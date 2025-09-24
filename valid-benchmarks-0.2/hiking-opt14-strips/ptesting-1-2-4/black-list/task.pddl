(define (problem hiking-1-2)                       (:domain hiking)                       (:objects place1 - place
car1 - car
couple0 - couple
place0 - place
car0 - car
tent0 - tent
place2 - place
guy0 - person
girl0 - person
place3 - place)                        (:init (unlock-origin-domain )
(at_person-copy guy0 place0)
(at_tent-copy tent0 place0)
(at_tent tent0 place0)
(next place1 place2)
(walked couple0 place0)
(next-copy place0 place1)
(at_car-copy car0 place0)
(at_person guy0 place0)
(next-copy place2 place3)
(at_car-copy car1 place0)
(partners-copy couple0 guy0 girl0)
(at_car car0 place0)
(at_person-copy girl0 place0)
(down tent0)
(next-copy place1 place2)
(walked-copy couple0 place0)
(down-copy tent0)
(next place0 place1)
(at_car car1 place0)
(partners couple0 guy0 girl0)
(at_person girl0 place0)
(next place2 place3))                        (:goal (and
		(walked couple0 place3)
		(invalid )))                        )