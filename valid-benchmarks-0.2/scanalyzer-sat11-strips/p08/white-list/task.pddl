(define (problem scanalyzer3d-56)                       (:domain scanalyzer3d)                       (:objects car-out-1b - car
seg-out-1a - segment
seg-in-1b - segment
car-out-2a - car
car-in-1a - car
seg-in-1a - segment
seg-out-2a - segment
car-out-2b - car
car-in-2a - car
seg-in-2a - segment
seg-in-2b - segment
seg-out-2b - segment
car-in-1b - car
seg-out-1b - segment
car-out-1a - car
car-in-2b - car)                        (:init (cycle-4-copy seg-in-1a seg-in-1b seg-out-2a seg-out-2b)
(= (total-cost ) 0)
(on car-out-2b seg-out-2b)
(unlock-origin-domain )
(on-copy car-out-1a seg-out-1a)
(cycle-4-copy seg-in-2a seg-in-2b seg-out-1a seg-out-1b)
(on-copy car-in-1b seg-in-1b)
(on car-out-1a seg-out-1a)
(cycle-4 seg-in-2a seg-in-2b seg-out-2a seg-out-2b)
(on-copy car-in-1a seg-in-1a)
(on car-in-1b seg-in-1b)
(cycle-4 seg-in-1a seg-in-1b seg-out-1a seg-out-1b)
(on-copy car-in-2a seg-in-2a)
(on-copy car-out-1b seg-out-1b)
(cycle-4-copy seg-in-2a seg-in-2b seg-out-2a seg-out-2b)
(cycle-4-copy seg-in-1a seg-in-1b seg-out-1a seg-out-1b)
(on car-in-1a seg-in-1a)
(on-copy car-out-2a seg-out-2a)
(on-copy car-in-2b seg-in-2b)
(on car-in-2a seg-in-2a)
(on car-out-1b seg-out-1b)
(on-copy car-out-2b seg-out-2b)
(cycle-4 seg-in-1a seg-in-1b seg-out-2a seg-out-2b)
(on car-out-2a seg-out-2a)
(on car-in-2b seg-in-2b)
(cycle-4-with-analysis seg-in-1a seg-in-1b seg-out-1a seg-out-1b)
(cycle-4-with-analysis-copy seg-in-1a seg-in-1b seg-out-1a seg-out-1b)
(cycle-4 seg-in-2a seg-in-2b seg-out-1a seg-out-1b))                        (:goal (and
		(analyzed car-in-1a)
		(analyzed car-in-1b)
		(analyzed car-in-2a)
		(analyzed car-in-2b)
		(analyzed car-out-1a)
		(analyzed car-out-1b)
		(analyzed car-out-2a)
		(analyzed car-out-2b)
		(on car-in-1a seg-out-1b)
		(on car-in-1b seg-in-1a)
		(on car-in-2a seg-out-2b)
		(on car-in-2b seg-in-2a)
		(on car-out-1a seg-in-1b)
		(on car-out-1b seg-out-1a)
		(on car-out-2a seg-in-2b)
		(on car-out-2b seg-out-2a)
		(invalid )))                        (:metric minimize (total-cost) ))