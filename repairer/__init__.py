# from hitter.memhitter import *
from hitter.maxsat import *
from model.domain import *
from model.plan import *
import logging
from typing import Dict, List, Tuple, Optional
import json


class Repairer:
    def __init__(self,
                 domain: Domain,
                 instances: List[Tuple[Task, List[Plan]]]):
        for instance in instances:
            task, plans = instance
            for plan in plans:
                plan.compute_subs(domain, task)
        _repair_to_idx = {}
        _idx_to_repair = {}
        hitter = MaxSATHitter()
        while True:
            candidate = hitter.top()
            candidate = set(_idx_to_repair[x] for x in candidate)
            logging.debug("printing candidate repairs:")
            for c in candidate:
                msg = str(c) + "({})".format(_repair_to_idx[c])
                logging.debug(msg)
            logging.debug("end printing candidate")
            domain.repairs = candidate
            domain.update()
            domain.repaired = True
            for instance in instances:
                task, plans = instance
                for i, plan in enumerate(plans):
                    logging.debug("conflict for the {}th plan".format(i))
                    succeed = plan.execute(domain, task)
                    if not succeed:
                        domain.repaired = False
                        conf = plan.compute_conflict(domain)
                        conflict = []
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
                            msg = str(r) + " condition: {} -- {}".format(
                                    r.condition, _repair_to_idx[r])
                            logging.debug(msg)
                        hitter.add_conflict(conflict)
                    logging.debug("end conflict for the {}th plan".format(i))
            if domain.repaired:
                self._hitter = hitter
                self._idx_to_repair = _idx_to_repair
                self._repairs = candidate
                break
        
    def enum_solutions(self, outfile):
        min_card_diags = self._hitter.top_enum()
        repairs = set()
        for diag in min_card_diags:
            repairs.add(
                frozenset(str(self._idx_to_repair[x]) for x in diag)
            )
        serializable = sorted([sorted(fs) for fs in repairs])
        with open(outfile, "w") as f:
            json.dump(serializable, f, indent=4)

    def print_repairs(self):
        for r in self._repairs:
            print(str(r))

    def write(self, outfile):
        with open(outfile, "w") as f:
            for r in self._repairs:
                f.write(str(r) + "\n")
