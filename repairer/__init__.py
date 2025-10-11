# from hitter.memhitter import *
from hitter.maxsat import *
from model.domain import *
from model.plan import *
import logging
from typing import Dict, List, Tuple, Optional
import json
import pdb
from remote_pdb import RemotePdb


DEBUG_FILE = "/Users/u7899572/Git/baseline_debug/debug.txt"

class Repairer:
    def __init__(self,
                 domain: Domain,
                 instances: List[Tuple[Task, List[Plan]]]):
        self.domain = domain
        self.instances = instances

        for instance in instances:
            task, plans = instance
            for plan in plans:
                plan.compute_subs(domain, task)
        _repair_to_idx = {}
        _idx_to_repair = {}
        hitter = MaxSATHitter()
        self.debug_conflicts = []
        self.debug_err = []
        self.debug_iter_repair = []

        while True:
            candidate = hitter.top()
            candidate = set(_idx_to_repair[x] for x in candidate)
            # logging.debug("printing candidate repairs:")
            # for c in candidate:
            #     msg = str(c) + "({})".format(_repair_to_idx[c])
            #     logging.debug(msg)
            # logging.debug("end printing candidate")

            # with open(DEBUG_FILE, 'a') as f:
            #     f.write(f'Applying repairs: {[str(c) for c in candidate]}\n')

            domain.repairs = candidate
            self.debug_iter_repair.append(candidate)
            domain.update()
            domain.repaired = True
            # pdb.set_trace()
            # RemotePdb('127.0.0.1', 4444).set_trace() # debug
            debug_err = []
            debug_conflicts = []
            for i_ins, instance in enumerate(instances):
                task, plans = instance
                for i, plan in enumerate(plans):
                    # logging.debug("conflict for the {}th plan".format(i))
                    succeed = plan.execute(domain, task)
                    debug_err.append((str(plan._atom), plan._plan_file))
                    if not succeed:
                        domain.repaired = False
                        conf = plan.compute_conflict(domain)

                        # with open(DEBUG_FILE, 'a') as f:
                        #     f.write(f'Conflict detected in instance {i_ins}, plan {i}, plan_file={plan._plan_file}\n')
                        plan.to_debug_data(DEBUG_FILE)
                        conflict = []
                        # Collect unsatisfied preconditions and plan file
                        for r in conf:
                            if r not in _repair_to_idx:
                                idx = len(_repair_to_idx) + 1
                                _repair_to_idx[r] = idx
                                _idx_to_repair[idx] = r
                                hitter.add_conflict([-idx], 10)
                            if r.condition:
                                conflict.append(-_repair_to_idx[r])
                            else:
                                conflict.append(_repair_to_idx[r])
                            # msg = str(r) + " condition: {} -- {}".format(
                            #         r.condition, _repair_to_idx[r])
                            # logging.debug(msg)
                        hitter.add_conflict(conflict)
                        debug_conflicts.append(conflict)
                    logging.debug("end conflict for the {}th plan".format(i))
            self.debug_err.append(debug_err)
            self.debug_conflicts.append(debug_conflicts)
            if domain.repaired:
                self._hitter = hitter
                self._idx_to_repair = _idx_to_repair
                self._repairs = candidate
                break
    
    def filter_solutions(self, diags):
        sol_diags = set()
        domain = self.domain
        instances = self.instances

        for instance in instances:
            task, plans = instance
            for plan in plans:
                plan.compute_subs(domain, task)
        
        for candidate in diags:
            candidate = set(self._idx_to_repair[x] for x in candidate)
            domain.repairs = candidate
            domain.update()
            domain.repaired = True
            for i_ins, instance in enumerate(instances):
                task, plans = instance
                for i, plan in enumerate(plans):
                    succeed = plan.execute(domain, task)
                    if not succeed:
                        domain.repaired = False
            if domain.repaired:
                sol_diags.add(frozenset(candidate))
        
        return sol_diags


    def enum_solutions(self, outfile):
        min_card_diags = self._hitter.top_enum()
        # repairs = self.filter_solutions(min_card_diags)
        repairs = set()
        for diag in min_card_diags:
            repairs.add(
                frozenset(str(self._idx_to_repair[x]) for x in diag)
            )
        serializable = sorted([sorted(fs) for fs in repairs])
        with open(outfile, "w") as f:
            json.dump(serializable, f, indent=4)
    

    def format_conflicts(self, conflicts):
        repairs = set()
        for conf in conflicts:
            repairs.add(
                frozenset(
                    str(self._idx_to_repair[x]) if x > 0 else "(neg) " + str(self._idx_to_repair[-x])
                    for x in conf
                )
            )
        serializable = sorted([sorted(r) for r in repairs])
        return serializable
    

    def write_conflicts(self, outfile):
        conflicts = self._hitter.get_conflicts()
        serializable = []
        if conflicts:
            serializable = self.format_conflicts(conflicts)

        with open(outfile, "w") as f:
            json.dump(serializable, f, indent=4)

    
    def write_debug_conflicts(self, outfile):
        debug_data = {}
        for i, conflicts in enumerate(self.debug_conflicts):
            print()
            print()
            print(conflicts)
            print()
            print()
            serializable = self.format_conflicts([conflicts])
            debug_data[f'iteration_{i}'] = serializable
        with open(outfile, "w") as f:
            json.dump(debug_data, f, indent=4)


    def print_repairs(self):
        for r in self._repairs:
            print(str(r))

    def write(self, outfile):
        with open(outfile, "w") as f:
            for r in self._repairs:
                f.write(str(r) + "\n")
    
    def write_iteration_debug(self, outfile):
        # save the data in self.debug_err and self.debug_iter_repair to a json file
        debug_data = {}
        print(self.debug_conflicts[0][0])
        for i, debug_err in enumerate(self.debug_err):
            # debug_err is a list of (failed_atom, plan_file)
            debug_data[f'iteration_{i}'] = {
                'failed_atoms': [e[0] for e in debug_err],
                'plan_files': [e[1] for e in debug_err],
                'conflicts': [self.format_conflicts(self.debug_conflicts[i])],
                'applied_repairs': [str(r) for r in self.debug_iter_repair[i]]
            }

        with open(outfile, "w") as f:
            json.dump(debug_data, f, indent=4)