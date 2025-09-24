(define (problem scanalyzer3d-16)                       (:domain scanalyzer3d)                       (:objects seg-out-4 - segment
seg-in-2 - segment
seg-in-3 - segment
car-in-1 - car
car-in-2 - car
seg-out-2 - segment
car-in-4 - car
seg-in-1 - segment
seg-out-3 - segment
car-in-3 - car
car-out-3 - car
car-out-1 - car
car-out-4 - car
seg-out-1 - segment
car-out-2 - car
seg-in-4 - segment)                        (:init (on car-in-2 seg-in-2)
(cycle-2-copy seg-in-3 seg-out-2)
(unlock-origin-domain )
(on car-out-2 seg-out-2)
(cycle-2 seg-in-1 seg-out-4)
(cycle-2 seg-in-1 seg-out-3)
(= (total-cost ) 0)
(cycle-2-copy seg-in-3 seg-out-4)
(on car-out-4 seg-out-4)
(on-copy car-in-1 seg-in-1)
(on-copy car-in-4 seg-in-4)
(cycle-2-copy seg-in-3 seg-out-1)
(on-copy car-in-3 seg-in-3)
(cycle-2-copy seg-in-2 seg-out-1)
(cycle-2-copy seg-in-3 seg-out-3)
(cycle-2 seg-in-2 seg-out-2)
(cycle-2-copy seg-in-2 seg-out-4)
(cycle-2-copy seg-in-1 seg-out-2)
(cycle-2-copy seg-in-2 seg-out-3)
(cycle-2 seg-in-4 seg-out-2)
(cycle-2-copy seg-in-4 seg-out-4)
(cycle-2-copy seg-in-4 seg-out-1)
(on-copy car-out-1 seg-out-1)
(on car-in-1 seg-in-1)
(on car-in-4 seg-in-4)
(cycle-2-with-analysis seg-in-1 seg-out-1)
(cycle-2-with-analysis-copy seg-in-1 seg-out-1)
(cycle-2 seg-in-3 seg-out-2)
(on car-in-3 seg-in-3)
(cycle-2-copy seg-in-1 seg-out-1)
(cycle-2-copy seg-in-4 seg-out-3)
(cycle-2 seg-in-3 seg-out-4)
(cycle-2 seg-in-3 seg-out-1)
(cycle-2 seg-in-2 seg-out-1)
(cycle-2 seg-in-3 seg-out-3)
(cycle-2 seg-in-2 seg-out-4)
(on-copy car-out-3 seg-out-3)
(on car-out-1 seg-out-1)
(cycle-2-copy seg-in-1 seg-out-4)
(cycle-2 seg-in-2 seg-out-3)
(cycle-2 seg-in-4 seg-out-4)
(cycle-2 seg-in-1 seg-out-2)
(cycle-2-copy seg-in-1 seg-out-3)
(cycle-2 seg-in-4 seg-out-1)
(on-copy car-in-2 seg-in-2)
(cycle-2 seg-in-1 seg-out-1)
(cycle-2-copy seg-in-2 seg-out-2)
(cycle-2 seg-in-4 seg-out-3)
(on-copy car-out-2 seg-out-2)
(on car-out-3 seg-out-3)
(on-copy car-out-4 seg-out-4)
(cycle-2-copy seg-in-4 seg-out-2))                        (:goal (and
		(analyzed car-in-1)
		(analyzed car-in-2)
		(analyzed car-in-3)
		(analyzed car-in-4)
		(analyzed car-out-1)
		(analyzed car-out-2)
		(analyzed car-out-3)
		(analyzed car-out-4)
		(on car-in-1 seg-in-1)
		(on car-in-2 seg-in-2)
		(on car-in-3 seg-in-3)
		(on car-in-4 seg-in-4)
		(on car-out-1 seg-out-1)
		(on car-out-2 seg-out-2)
		(on car-out-3 seg-out-3)
		(on car-out-4 seg-out-4)
		(invalid )))                        (:metric minimize (total-cost) ))