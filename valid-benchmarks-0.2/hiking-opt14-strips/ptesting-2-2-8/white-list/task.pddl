(define (problem hiking-2-2)                       (:domain hiking)                       (:objects couple1 - couple
car1 - car
couple0 - couple
tent1 - tent
car0 - car
place4 - place
guy0 - person
girl0 - person
place7 - place
place1 - place
place0 - place
place6 - place
tent0 - tent
place2 - place
place5 - place
guy1 - person
girl1 - person
place3 - place)                        (:init (up-copy tent1)
(up-copy tent0)
(up tent1)
(next-copy place5 place6)
(unlock-origin-domain )
(at_person-copy guy0 place0)
(at_tent-copy tent0 place0)
(at_person guy1 place0)
(walked-copy couple1 place0)
(partners-copy couple1 guy1 girl1)
(at_tent tent0 place0)
(next-copy place4 place5)
(at_tent-copy tent1 place0)
(next place1 place2)
(walked couple0 place0)
(next-copy place0 place1)
(next-copy place3 place4)
(at_tent tent1 place0)
(at_car-copy car0 place0)
(at_person guy0 place0)
(next-copy place6 place7)
(next-copy place2 place3)
(partners couple1 guy1 girl1)
(at_person-copy girl1 place0)
(next place5 place6)
(walked couple1 place0)
(at_car-copy car1 place0)
(partners-copy couple0 guy0 girl0)
(next place4 place5)
(at_car car0 place0)
(at_person girl1 place0)
(at_person-copy girl0 place0)
(next-copy place1 place2)
(walked-copy couple0 place0)
(next place0 place1)
(next place3 place4)
(at_person-copy guy1 place0)
(at_car car1 place0)
(next place6 place7)
(partners couple0 guy0 girl0)
(at_person girl0 place0)
(next place2 place3)
(up tent0))                        (:goal (and
		(walked couple0 place7)
		(walked couple1 place7)
		(invalid )))                        )