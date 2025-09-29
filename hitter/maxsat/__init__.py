from pysat.formula import WCNF
from pysat.examples.fm import FM
from pysat.examples.rc2 import RC2
from typing import List
import math


class MaxSATHitter:
    def __init__(self):
        self._wcnf = WCNF()

    def add_conflict(self, conflict: List[int], weight=None):
        if weight is None:
            self._wcnf.append(conflict)
        else:
            self._wcnf.append(conflict, weight)
    
    def get_conflicts(self):
        return [clause for clause in self._wcnf.hard]

    def top(self):
        solver = FM(self._wcnf)
        _ = solver.compute()
        return [e for e in solver.model if e > 0]

    def top_enum(self):
            min_card_diags = []
            with RC2(self._wcnf) as rc2:
                limit = math.inf
                for model in rc2.enumerate():
                    sol = [lit for lit in model if lit > 0]
                    if len(sol) <= limit:
                        limit = len(sol)
                        min_card_diags.append(sol)
                    else: break
            return min_card_diags
