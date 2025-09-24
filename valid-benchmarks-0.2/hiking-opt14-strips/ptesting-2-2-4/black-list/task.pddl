(define (problem hiking-2-2)                       (:domain hiking)                       (:objects place1 - place
couple1 - couple
car1 - car
couple0 - couple
place0 - place
girl1 - person
car0 - car
tent0 - tent
place2 - place
guy1 - person
guy0 - person
tent1 - tent
girl0 - person
place3 - place)                        (:init (unlock-origin-domain )
(at_person-copy guy0 place0)
(at_tent-copy tent0 place0)
(at_person guy1 place0)
(walked-copy couple1 place0)
(partners-copy couple1 guy1 girl1)
(at_tent tent0 place0)
(at_tent-copy tent1 place0)
(next place1 place2)
(walked couple0 place0)
(next-copy place0 place1)
(at_tent tent1 place0)
(at_car-copy car0 place0)
(at_person guy0 place0)
(next-copy place2 place3)
(partners couple1 guy1 girl1)
(at_person-copy girl1 place0)
(walked couple1 place0)
(at_car-copy car1 place0)
(partners-copy couple0 guy0 girl0)
(at_car car0 place0)
(at_person girl1 place0)
(at_person-copy girl0 place0)
(down tent0)
(next-copy place1 place2)
(down tent1)
(walked-copy couple0 place0)
(down-copy tent0)
(next place0 place1)
(down-copy tent1)
(at_person-copy guy1 place0)
(at_car car1 place0)
(partners couple0 guy0 girl0)
(at_person girl0 place0)
(next place2 place3))                        (:goal (and
		(walked couple0 place3)
		(walked couple1 place3)
		(invalid )))                        )