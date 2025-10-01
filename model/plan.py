from fd.pddl.conditions import Conjunction, Atom
from .domain import *
from .repair import *
from utils import *

from typing import List, Tuple, Set


def applicable(action, state, var_mapping):
    literals = (action.precondition,)
    if isinstance(action.precondition, Conjunction):
        literals = action.precondition.parts
    for literal in literals:
        grounded_paras = tuple(var_mapping[para].name for para in literal.args)
        atom = Atom(literal.predicate, grounded_paras)
        if (not literal.negated) and (atom not in state):
            return atom
        if literal.negated and (atom in state):
            return atom.negate()  # return a negated atom to indicate that it shall be deleted
    return None


def check_goal(state, goal):
    for atom in goal.parts:
        if (not atom.negated) and (atom not in state):
            return atom
        if atom.negated and (atom in state):
            return atom
    return None


def next_state(action, var_mapping, current):
    pos_effs, neg_effs = set(), set()
    for eff in action.effects:
        assert (len(eff.parameters) == 0)
        literal = eff.literal
        grounded_paras = tuple(var_mapping[para].name for para in literal.args)
        atom = Atom(literal.predicate, grounded_paras)
        if literal.negated:
            neg_effs.add(atom)
        else:
            pos_effs.add(atom)
    state = current.difference(neg_effs)
    state = state.union(pos_effs)
    return state


class Plan:
    def __init__(self, plan_file):
        self._steps: List[Tuple] = []
        self._var_mapping = []
        with open(plan_file, "r") as f:
            for line in f.readlines():
                if not line.strip():
                    continue
                line = line.strip()
                if line[0] == "(" and line[-1] == ")":
                    line = line[1:-1]
                parts = line.split(" ")
                self._steps.append(tuple(parts))
        if self._steps[-1][0] == ";":
            self._steps.pop(-1)
        self._succeed = False
        self._pos = None
        self._atom = None

        self._plan_file = plan_file

    @property
    def executable(self):
        return self._succeed

    @property
    def position(self):
        return self._pos

    @property
    def atom(self):
        return self._atom

    def compute_subs(self, domain, task):
        for step in self._steps:
            mapping = {}
            action = domain.get_action(step[0])
            for idx, para in enumerate(action.parameters):
                object = task.get_object(step[idx + 1])
                if object is None:
                    object = domain.get_constant(step[idx + 1])
                if object is None:
                    raise KeyError("Undefined object")
                mapping[para.name] = object
            mapping.update([(c.name, c) for c in domain.constants])
            self._var_mapping.append((step[0], mapping))

    def step(self, idx):
        return self._steps[idx]

    def substitution(self, idx):
        return self._var_mapping[idx]

    def execute(self, domain: Domain, task: Task):
        pass

    def compute_conflict(self, domain: Domain):
        pass


class PositivePlan(Plan):
    def __init__(self, plan_file):
        super().__init__(plan_file)

    def execute(self, domain: Domain, task: Task):
        state = set()
        for p in task.init:
            state.add(p)
        for pos, step in enumerate(self._steps):
            action = domain.get_action(step[0])
            var_mapping = self._var_mapping[pos][-1]
            unsat_atom = applicable(action, state, var_mapping)
            if unsat_atom is not None:
                self._succeed = False
                self._pos = pos
                self._atom = unsat_atom
                return False
            state = next_state(action, var_mapping, state)
        unsat_atom = check_goal(state, task.goal)
        if unsat_atom is not None:
            self._succeed = False
            self._pos = len(self._steps)
            self._atom = unsat_atom
            return False
        return True
    

    def compute_conflict(self, domain: Domain) -> Set[Repair]:
        conflict = set()
        if self._pos < len(self._steps):
            name = self._steps[self._pos][0]
            action = domain.get_action(name)
            prec = match_existing_prec(
                action,
                self._var_mapping[self._pos][-1],
                self._atom)
            for atom in prec:
                repair = RepairPrec(name, atom, -1)
                conflict.add(repair)
        for idx in range(self._pos - 1, -1, -1):
            has_neg_conf = False
            name = self._steps[idx][0]
            action = domain.get_action(name)
            current_mapping = self._var_mapping[idx][-1]
            missing = match_missing_effs(
                action,
                self._var_mapping[idx][-1],
                self._atom)
            # TODO: capture the case where a negative effect is added while the same positive effect exists
            for atom in missing:
                if atom.negated:
                    grounding = tuple(current_mapping[arg].name for arg in atom.args)
                    counter_part = Atom(atom.predicate, grounding)
                    existing_positive_effs = match_existing_effs(
                            action, self._var_mapping[idx][-1], counter_part)
                    if len(existing_positive_effs) > 0:
                        continue
                repair = RepairEffs(name, atom, 1)
                conflict.add(repair)
                for r in repair.negate():
                    if r in domain.repairs:
                        has_neg_conf = True
            # if not self._atom.negated:
            existing = match_existing_effs(
                action,
                self._var_mapping[idx][-1],
                self._atom.negate())
            # else:
            #     existing = match_existing_effs(
            #         action,
            #         self._var_mapping[idx][-1],
            #         self._atom)
            if len(existing) > 0:
                for atom in existing:
                    repair = RepairEffs(name, atom, -1)
                    conflict.add(repair)
                break
            if has_neg_conf:
                break
        for r in domain.repairs:
            for neg in r.negate():
                if neg in conflict:
                    conflict.remove(neg)
                    r.condition = True
                    conflict.add(r)
        return conflict


    def to_debug_data(self, file_path: str):
        """
        Writes key internal data to the specified file path to understand the
        instance's state for debugging. This method is similar to the one 
        in NegativePlan but tailored for the PositivePlan's failure modes.
        """
        debug_lines = []

        debug_lines.append(f"--- PositivePlan Debug Data (Output File: {file_path}) ---")

        # Basic Plan data
        debug_lines.append(f"Total Steps: {len(self._steps) if hasattr(self, '_steps') else 'N/A'}")
        debug_lines.append(f"Variable Mappings available (per step): {len(self._var_mapping) if hasattr(self, '_var_mapping') else 'N/A'}")
        debug_lines.append(f"Execution Success (_succeed): {getattr(self, '_succeed', 'N/A')}")


        # Execution/Conflict Resolution State Data (if set)
        if hasattr(self, '_succeed') and not self._succeed:
            # Plan failed
            debug_lines.append(f"Execution Failed: True")
            
            # Failure position and atom
            failure_pos = getattr(self, '_pos', 'N/A')
            failure_atom = getattr(self, '_atom', 'N/A')
            debug_lines.append(f"Failed Position (_pos): {failure_pos}")
            debug_lines.append(f"Unsatisfied Atom (_atom): {failure_atom}")

            # Details about the failed step (Precondition failure) or Goal
            if isinstance(failure_pos, int):
                if failure_pos < len(self._steps):
                    # Precondition failure on an action
                    failed_step = self._steps[failure_pos]
                    debug_lines.append(f"Failure Type: Precondition failure on Action at pos {failure_pos}")
                    debug_lines.append(f"Failed Step: {failed_step}")
                    if failure_pos < len(self._var_mapping) and self._var_mapping[failure_pos]:
                        debug_lines.append(f"Failed Step Var Mapping: {self._var_mapping[failure_pos][-1]}")
                    else:
                        debug_lines.append("Failed Step Var Mapping: Not available.")
                elif failure_pos == len(self._steps):
                    # Goal failure
                    debug_lines.append(f"Failure Type: Goal condition failure after all steps.")
                else:
                    debug_lines.append("Warning: Failure Position (_pos) is inconsistent.")
            else:
                 debug_lines.append("Warning: Failed Position (_pos) is not an integer.")

        else:
             debug_lines.append("Plan Execution Status: Success or Not executed.")


        debug_lines.append("-----------------------------------------------------")

        # Write all collected lines to the file
        try:
            with open(file_path, 'a') as f:
                f.write('\n'.join(debug_lines) + '\n')
            # You might want to print a success message to the console for user feedback
            print(f"PositivePlan debug data successfully written to {file_path}")
        except IOError as e:
            print(f"Error writing debug data to file {file_path}: {e}")


class NegativePlan(PositivePlan):
    def __init__(self, plan_file, idx):
        super().__init__(plan_file)
        self._idx = idx

    def execute(self, domain: Domain, task: Task):
        state = {p for p in task.init}
        for pos, step in enumerate(self._steps):
            if pos > self._idx:
                break
            action = domain.get_action(step[0])
            var_mapping = self._var_mapping[pos][-1]
            unsat_atom = applicable(action, state, var_mapping)
            if unsat_atom is not None:
                if pos != self._idx:
                    self._succeed = False
                    self._pos = pos
                    self._atom = unsat_atom
                    return False
                else:
                    return True
            else:
                if pos == self._idx:
                    self._pos = None
                    return False
            state = next_state(action, var_mapping, state)
        return False

    def compute_conflict(self, domain: Domain):
        if self._pos is not None and self._pos < self._idx:
            return super().compute_conflict(domain)
        name = self._steps[self._idx][0]
        action = domain.get_action(name)
        conflict = set()
        atoms = match_missing_prec(action, domain)
        for atom in atoms:
            if atom.predicate == "=":
                continue
            repair = RepairPrec(name, atom, 1)
            has_neg_repair = False
            for neg in repair.negate():
                if neg in domain.repairs:
                    neg.condition = True
                    conflict.add(neg)
                    has_neg_repair = True
            if has_neg_repair:
                continue
            conflict.add(repair)
        literals = (action.precondition, )
        if isinstance(action.precondition, Conjunction):
            literals = action.precondition.parts
        for literal in literals:
            var_mapping = self._var_mapping[self._idx][-1]
            grounded_paras = tuple(var_mapping[para].name for para in literal.args)
            target = Atom(literal.predicate, grounded_paras)
            if literal.negated:
                target = target.negate()
            for idx in range(self._idx - 1, -1, -1):
                prev_action = domain.get_action(self._steps[idx][0])
                prev_mapping = self._var_mapping[idx][-1]
                missing = match_missing_effs(
                        prev_action,
                        prev_mapping,
                        target.negate())
                for atom in missing:
                    if atom.predicate == "=":
                        continue
                    if atom.negated and (atom.negate() in set(eff.literal for eff in prev_action.effects)):
                        continue
                    if atom.negated:
                        grounding = tuple(prev_mapping[arg].name for arg in atom.args)
                        counter_part = Atom(atom.predicate, grounding)
                        existing_positive_effs = match_existing_effs(
                            prev_action, prev_mapping, counter_part)
                        if len(existing_positive_effs) > 0:
                            continue
                    repair = RepairEffs(prev_action.name, atom, 1)
                    has_neg_repair = False
                    for neg in repair.negate():
                        if neg in domain.repairs:
                            neg.condition = True
                            conflict.add(neg)
                            has_neg_repair = True
                    if has_neg_repair:
                        continue
                    conflict.add(repair)
                existing = match_existing_effs(
                        prev_action,
                        prev_mapping,
                        target)
                if len(existing) > 0:
                    for atom in existing:
                        if atom.predicate == "=":
                            continue
                        repair = RepairEffs(prev_action.name, atom, -1)
                        has_neg_repair = False
                        for neg in repair.negate():
                            if neg in domain.repairs:
                                neg.condition = True
                                conflict.add(neg)
                                has_neg_repair = True
                        if has_neg_repair:
                            continue
                        conflict.add(repair)
                    break
        return conflict
    

    def to_debug_data(self, file_path: str):
        """
        Writes key internal data to the specified file path to understand the 
        instance's state for debugging.
        """
        debug_lines = []
        
        debug_lines.append(f"--- NegativePlan Debug Data (Output File: {file_path}) ---")
        
        # Data from PositivePlan
        debug_lines.append(f"Total Steps: {len(self._steps) if hasattr(self, '_steps') else 'N/A'}")
        debug_lines.append(f"Variable Mappings available (per step): {len(self._var_mapping) if hasattr(self, '_var_mapping') else 'N/A'}")
        
        # NegativePlan specific data
        debug_lines.append(f"Index (_idx): {self._idx}")
        
        # Execution/Conflict Resolution State Data (if set)
        
        pos_is_set = hasattr(self, '_pos') and self._pos is not None
        
        if hasattr(self, '_succeed') and not self._succeed and pos_is_set:
            # Plan failed *before* the focus index (_idx)
            debug_lines.append(f"Execution Failed Before _idx: True")
            debug_lines.append(f"Failed Position (_pos): {self._pos}")
            debug_lines.append(f"Unsatisfied Atom (_atom): {getattr(self, '_atom', 'N/A')}")
        elif pos_is_set:
            # Plan failed at or before _idx, but not necessarily in the *expected* 'before' failure mode
            debug_lines.append(f"Execution Failure Position (_pos): {self._pos}")
            debug_lines.append(f"Unsatisfied Atom (_atom): {getattr(self, '_atom', 'N/A')}")
        elif hasattr(self, '_pos') and self._pos is None:
            # This state often means the action at _idx was applicable (unexpectedly successful/applicable)
            debug_lines.append("Plan Execution Status: Action at _idx was applicable (unexpectedly successful/applicable or fully executed)")
        else:
             debug_lines.append("Plan Execution Status: Not executed or state variables (_succeed, _pos, _atom) not fully set.")

        # Print the focus step details if available
        if hasattr(self, '_steps') and 0 <= self._idx < len(self._steps):
            focus_step = self._steps[self._idx]
            debug_lines.append(f"Focus Step ({self._idx}): {focus_step}")
            if hasattr(self, '_var_mapping') and self._idx < len(self._var_mapping) and self._var_mapping[self._idx]:
                 # Assumes the latest mapping is relevant
                debug_lines.append(f"Focus Step Var Mapping: {self._var_mapping[self._idx][-1]}")
            else:
                debug_lines.append("Focus Step Var Mapping: Not available.")
        else:
            debug_lines.append("Warning: Focus Index (_idx) is out of bounds for the plan steps.")

        debug_lines.append("-----------------------------------------------------")

        # Write all collected lines to the file
        try:
            with open(file_path, 'a') as f:
                f.write('\n'.join(debug_lines) + '\n')
            # You might want to print a success message to the console for user feedback
            print(f"Debug data successfully written to {file_path}")
        except IOError as e:
            print(f"Error writing debug data to file {file_path}: {e}")

