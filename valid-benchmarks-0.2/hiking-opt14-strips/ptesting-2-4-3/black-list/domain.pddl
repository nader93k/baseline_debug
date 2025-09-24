(define (domain hiking)
(:requirements :strips :equality :typing)
(:types
	object
	object - object
	car - object
	tent - object
	person - object
	couple - object
	place - object)
(:constants )
(:predicates
	(at_tent ?x1 - tent ?x2 - place)
	(at_person ?x1 - person ?x2 - place)
	(at_car ?x1 - car ?x2 - place)
	(partners ?x1 - couple ?x2 - person ?x3 - person)
	(up ?x1 - tent)
	(down ?x1 - tent)
	(walked ?x1 - couple ?x2 - place)
	(next ?x1 - place ?x2 - place)
	(= ?x - object ?y - object)
	(= ?x - object ?y - object)
	(at_tent-copy ?x1 - tent ?x2 - place)
	(at_person-copy ?x1 - person ?x2 - place)
	(at_car-copy ?x1 - car ?x2 - place)
	(partners-copy ?x1 - couple ?x2 - person ?x3 - person)
	(up-copy ?x1 - tent)
	(down-copy ?x1 - tent)
	(walked-copy ?x1 - couple ?x2 - place)
	(next-copy ?x1 - place ?x2 - place)
	(=-copy ?x - object ?y - object)
	(invalid )
	(unlock-origin-domain )
	(put_down-lock ?x1 - person ?x2 - place ?x3 - tent)
	(put_up-lock ?x1 - person ?x2 - place ?x3 - tent)
	(drive_passenger-lock ?x1 - person ?x2 - place ?x3 - place ?x4 - car ?x5 - person)
	(drive-lock ?x1 - person ?x2 - place ?x3 - place ?x4 - car)
	(drive_tent-lock ?x1 - person ?x2 - place ?x3 - place ?x4 - car ?x5 - tent)
	(drive_tent_passenger-lock ?x1 - person ?x2 - place ?x3 - place ?x4 - car ?x5 - tent ?x6 - person)
	(walk_together-lock ?x1 - tent ?x2 - place ?x3 - person ?x4 - place ?x5 - person ?x6 - couple))
(:functions )
(:action put_down
	:parameters (?x1 - person
		?x2 - place
		?x3 - tent)
	:precondition (and
		(at_person ?x1 ?x2)
		(at_tent ?x3 ?x2)
		(up ?x3)
		(unlock-origin-domain ))
	:effect (and
		(down ?x3)
		(not (up ?x3))
		(not (at_person ?x1 ?x2))
		(put_down-lock ?x1 ?x2 ?x3)
		(not (unlock-origin-domain ))))

(:action put_up
	:parameters (?x1 - person
		?x2 - place
		?x3 - tent)
	:precondition (and
		(at_person ?x1 ?x2)
		(at_tent ?x3 ?x2)
		(down ?x3)
		(unlock-origin-domain ))
	:effect (and
		(up ?x3)
		(not (down ?x3))
		(put_up-lock ?x1 ?x2 ?x3)
		(not (unlock-origin-domain ))))

(:action drive_passenger
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - person)
	:precondition (and
		(at_person ?x1 ?x2)
		(at_car ?x4 ?x2)
		(at_person ?x5 ?x2)
		(not (= ?x1 ?x5))
		(unlock-origin-domain ))
	:effect (and
		(at_person ?x1 ?x3)
		(not (at_person ?x1 ?x2))
		(at_car ?x4 ?x3)
		(not (at_car ?x4 ?x2))
		(at_person ?x5 ?x3)
		(not (at_person ?x5 ?x2))
		(next ?x3 ?x3)
		(drive_passenger-lock ?x1 ?x2 ?x3 ?x4 ?x5)
		(not (unlock-origin-domain ))))

(:action drive
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car)
	:precondition (and
		(at_person ?x1 ?x2)
		(at_car ?x4 ?x2)
		(unlock-origin-domain ))
	:effect (and
		(at_person ?x1 ?x3)
		(not (at_person ?x1 ?x2))
		(at_car ?x4 ?x3)
		(not (at_car ?x4 ?x2))
		(drive-lock ?x1 ?x2 ?x3 ?x4)
		(not (unlock-origin-domain ))))

(:action drive_tent
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - tent)
	:precondition (and
		(at_person ?x1 ?x2)
		(at_car ?x4 ?x2)
		(at_tent ?x5 ?x2)
		(down ?x5)
		(unlock-origin-domain ))
	:effect (and
		(at_person ?x1 ?x3)
		(not (at_person ?x1 ?x2))
		(at_car ?x4 ?x3)
		(not (at_car ?x4 ?x2))
		(at_tent ?x5 ?x3)
		(not (at_tent ?x5 ?x2))
		(drive_tent-lock ?x1 ?x2 ?x3 ?x4 ?x5)
		(not (unlock-origin-domain ))))

(:action drive_tent_passenger
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - tent
		?x6 - person)
	:precondition (and
		(at_person ?x1 ?x2)
		(at_car ?x4 ?x2)
		(at_tent ?x5 ?x2)
		(down ?x5)
		(at_person ?x6 ?x2)
		(not (= ?x1 ?x6))
		(unlock-origin-domain ))
	:effect (and
		(at_person ?x1 ?x3)
		(not (at_person ?x1 ?x2))
		(at_car ?x4 ?x3)
		(not (at_car ?x4 ?x2))
		(at_tent ?x5 ?x3)
		(not (at_tent ?x5 ?x2))
		(at_person ?x6 ?x3)
		(not (at_person ?x6 ?x2))
		(drive_tent_passenger-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6)
		(not (unlock-origin-domain ))))

(:action walk_together
	:parameters (?x1 - tent
		?x2 - place
		?x3 - person
		?x4 - place
		?x5 - person
		?x6 - couple)
	:precondition (and
		(at_tent ?x1 ?x2)
		(up ?x1)
		(at_person ?x3 ?x4)
		(next ?x4 ?x2)
		(at_person ?x5 ?x4)
		(not (= ?x3 ?x5))
		(walked ?x6 ?x4)
		(partners ?x6 ?x3 ?x5)
		(unlock-origin-domain ))
	:effect (and
		(at_person ?x3 ?x2)
		(not (at_person ?x3 ?x4))
		(at_person ?x5 ?x2)
		(not (at_person ?x5 ?x4))
		(walked ?x6 ?x2)
		(walk_together-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6)
		(not (unlock-origin-domain ))))

(:action put_down-stop-0
	:parameters (?x1 - person
		?x2 - place
		?x3 - tent)
	:precondition (and
		(not (at_person-copy ?x1 ?x2))
		(put_down-lock ?x1 ?x2 ?x3))
	:effect (and
		(invalid )))

(:action put_down-stop-1
	:parameters (?x1 - person
		?x2 - place
		?x3 - tent)
	:precondition (and
		(not (at_tent-copy ?x3 ?x2))
		(put_down-lock ?x1 ?x2 ?x3))
	:effect (and
		(invalid )))

(:action put_down-stop-2
	:parameters (?x1 - person
		?x2 - place
		?x3 - tent)
	:precondition (and
		(not (up-copy ?x3))
		(put_down-lock ?x1 ?x2 ?x3))
	:effect (and
		(invalid )))

(:action put_down-copy
	:parameters (?x1 - person
		?x2 - place
		?x3 - tent)
	:precondition (and
		(put_down-lock ?x1 ?x2 ?x3)
		(at_person-copy ?x1 ?x2)
		(at_tent-copy ?x3 ?x2)
		(up-copy ?x3))
	:effect (and
		(not (put_down-lock ?x1 ?x2 ?x3))
		(unlock-origin-domain )
		(down-copy ?x3)
		(not (up-copy ?x3))))

(:action put_up-stop-0
	:parameters (?x1 - person
		?x2 - place
		?x3 - tent)
	:precondition (and
		(not (at_person-copy ?x1 ?x2))
		(put_up-lock ?x1 ?x2 ?x3))
	:effect (and
		(invalid )))

(:action put_up-stop-1
	:parameters (?x1 - person
		?x2 - place
		?x3 - tent)
	:precondition (and
		(not (at_tent-copy ?x3 ?x2))
		(put_up-lock ?x1 ?x2 ?x3))
	:effect (and
		(invalid )))

(:action put_up-stop-2
	:parameters (?x1 - person
		?x2 - place
		?x3 - tent)
	:precondition (and
		(not (down-copy ?x3))
		(put_up-lock ?x1 ?x2 ?x3))
	:effect (and
		(invalid )))

(:action put_up-copy
	:parameters (?x1 - person
		?x2 - place
		?x3 - tent)
	:precondition (and
		(put_up-lock ?x1 ?x2 ?x3)
		(at_person-copy ?x1 ?x2)
		(at_tent-copy ?x3 ?x2)
		(down-copy ?x3))
	:effect (and
		(not (put_up-lock ?x1 ?x2 ?x3))
		(unlock-origin-domain )
		(up-copy ?x3)
		(not (down-copy ?x3))))

(:action drive_passenger-stop-0
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - person)
	:precondition (and
		(not (at_person-copy ?x1 ?x2))
		(drive_passenger-lock ?x1 ?x2 ?x3 ?x4 ?x5))
	:effect (and
		(invalid )))

(:action drive_passenger-stop-1
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - person)
	:precondition (and
		(not (at_car-copy ?x4 ?x2))
		(drive_passenger-lock ?x1 ?x2 ?x3 ?x4 ?x5))
	:effect (and
		(invalid )))

(:action drive_passenger-stop-2
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - person)
	:precondition (and
		(not (at_person-copy ?x5 ?x2))
		(drive_passenger-lock ?x1 ?x2 ?x3 ?x4 ?x5))
	:effect (and
		(invalid )))

(:action drive_passenger-stop-3
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - person)
	:precondition (and
		(=-copy ?x1 ?x5)
		(drive_passenger-lock ?x1 ?x2 ?x3 ?x4 ?x5))
	:effect (and
		(invalid )))

(:action drive_passenger-copy
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - person)
	:precondition (and
		(drive_passenger-lock ?x1 ?x2 ?x3 ?x4 ?x5)
		(at_person-copy ?x1 ?x2)
		(at_car-copy ?x4 ?x2)
		(at_person-copy ?x5 ?x2)
		(not (=-copy ?x1 ?x5)))
	:effect (and
		(not (drive_passenger-lock ?x1 ?x2 ?x3 ?x4 ?x5))
		(unlock-origin-domain )
		(at_person-copy ?x1 ?x3)
		(not (at_person-copy ?x1 ?x2))
		(at_car-copy ?x4 ?x3)
		(not (at_car-copy ?x4 ?x2))
		(at_person-copy ?x5 ?x3)
		(not (at_person-copy ?x5 ?x2))))

(:action drive-stop-0
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car)
	:precondition (and
		(not (at_person-copy ?x1 ?x2))
		(drive-lock ?x1 ?x2 ?x3 ?x4))
	:effect (and
		(invalid )))

(:action drive-stop-1
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car)
	:precondition (and
		(not (at_car-copy ?x4 ?x2))
		(drive-lock ?x1 ?x2 ?x3 ?x4))
	:effect (and
		(invalid )))

(:action drive-copy
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car)
	:precondition (and
		(drive-lock ?x1 ?x2 ?x3 ?x4)
		(at_person-copy ?x1 ?x2)
		(at_car-copy ?x4 ?x2))
	:effect (and
		(not (drive-lock ?x1 ?x2 ?x3 ?x4))
		(unlock-origin-domain )
		(at_person-copy ?x1 ?x3)
		(not (at_person-copy ?x1 ?x2))
		(at_car-copy ?x4 ?x3)
		(not (at_car-copy ?x4 ?x2))))

(:action drive_tent-stop-0
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - tent)
	:precondition (and
		(not (at_person-copy ?x1 ?x2))
		(drive_tent-lock ?x1 ?x2 ?x3 ?x4 ?x5))
	:effect (and
		(invalid )))

(:action drive_tent-stop-1
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - tent)
	:precondition (and
		(not (at_car-copy ?x4 ?x2))
		(drive_tent-lock ?x1 ?x2 ?x3 ?x4 ?x5))
	:effect (and
		(invalid )))

(:action drive_tent-stop-2
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - tent)
	:precondition (and
		(not (at_tent-copy ?x5 ?x2))
		(drive_tent-lock ?x1 ?x2 ?x3 ?x4 ?x5))
	:effect (and
		(invalid )))

(:action drive_tent-stop-3
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - tent)
	:precondition (and
		(not (down-copy ?x5))
		(drive_tent-lock ?x1 ?x2 ?x3 ?x4 ?x5))
	:effect (and
		(invalid )))

(:action drive_tent-copy
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - tent)
	:precondition (and
		(drive_tent-lock ?x1 ?x2 ?x3 ?x4 ?x5)
		(at_person-copy ?x1 ?x2)
		(at_car-copy ?x4 ?x2)
		(at_tent-copy ?x5 ?x2)
		(down-copy ?x5))
	:effect (and
		(not (drive_tent-lock ?x1 ?x2 ?x3 ?x4 ?x5))
		(unlock-origin-domain )
		(at_person-copy ?x1 ?x3)
		(not (at_person-copy ?x1 ?x2))
		(at_car-copy ?x4 ?x3)
		(not (at_car-copy ?x4 ?x2))
		(at_tent-copy ?x5 ?x3)
		(not (at_tent-copy ?x5 ?x2))))

(:action drive_tent_passenger-stop-0
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - tent
		?x6 - person)
	:precondition (and
		(not (at_person-copy ?x1 ?x2))
		(drive_tent_passenger-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6))
	:effect (and
		(invalid )))

(:action drive_tent_passenger-stop-1
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - tent
		?x6 - person)
	:precondition (and
		(not (at_car-copy ?x4 ?x2))
		(drive_tent_passenger-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6))
	:effect (and
		(invalid )))

(:action drive_tent_passenger-stop-2
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - tent
		?x6 - person)
	:precondition (and
		(not (at_tent-copy ?x5 ?x2))
		(drive_tent_passenger-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6))
	:effect (and
		(invalid )))

(:action drive_tent_passenger-stop-3
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - tent
		?x6 - person)
	:precondition (and
		(not (down-copy ?x5))
		(drive_tent_passenger-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6))
	:effect (and
		(invalid )))

(:action drive_tent_passenger-stop-4
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - tent
		?x6 - person)
	:precondition (and
		(not (at_person-copy ?x6 ?x2))
		(drive_tent_passenger-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6))
	:effect (and
		(invalid )))

(:action drive_tent_passenger-stop-5
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - tent
		?x6 - person)
	:precondition (and
		(=-copy ?x1 ?x6)
		(drive_tent_passenger-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6))
	:effect (and
		(invalid )))

(:action drive_tent_passenger-copy
	:parameters (?x1 - person
		?x2 - place
		?x3 - place
		?x4 - car
		?x5 - tent
		?x6 - person)
	:precondition (and
		(drive_tent_passenger-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6)
		(at_person-copy ?x1 ?x2)
		(at_car-copy ?x4 ?x2)
		(at_tent-copy ?x5 ?x2)
		(down-copy ?x5)
		(at_person-copy ?x6 ?x2)
		(not (=-copy ?x1 ?x6)))
	:effect (and
		(not (drive_tent_passenger-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6))
		(unlock-origin-domain )
		(at_person-copy ?x1 ?x3)
		(not (at_person-copy ?x1 ?x2))
		(at_car-copy ?x4 ?x3)
		(not (at_car-copy ?x4 ?x2))
		(at_tent-copy ?x5 ?x3)
		(not (at_tent-copy ?x5 ?x2))
		(at_person-copy ?x6 ?x3)
		(not (at_person-copy ?x6 ?x2))))

(:action walk_together-stop-0
	:parameters (?x1 - tent
		?x2 - place
		?x3 - person
		?x4 - place
		?x5 - person
		?x6 - couple)
	:precondition (and
		(not (at_tent-copy ?x1 ?x2))
		(walk_together-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6))
	:effect (and
		(invalid )))

(:action walk_together-stop-1
	:parameters (?x1 - tent
		?x2 - place
		?x3 - person
		?x4 - place
		?x5 - person
		?x6 - couple)
	:precondition (and
		(not (up-copy ?x1))
		(walk_together-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6))
	:effect (and
		(invalid )))

(:action walk_together-stop-2
	:parameters (?x1 - tent
		?x2 - place
		?x3 - person
		?x4 - place
		?x5 - person
		?x6 - couple)
	:precondition (and
		(not (at_person-copy ?x3 ?x4))
		(walk_together-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6))
	:effect (and
		(invalid )))

(:action walk_together-stop-3
	:parameters (?x1 - tent
		?x2 - place
		?x3 - person
		?x4 - place
		?x5 - person
		?x6 - couple)
	:precondition (and
		(not (next-copy ?x4 ?x2))
		(walk_together-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6))
	:effect (and
		(invalid )))

(:action walk_together-stop-4
	:parameters (?x1 - tent
		?x2 - place
		?x3 - person
		?x4 - place
		?x5 - person
		?x6 - couple)
	:precondition (and
		(not (at_person-copy ?x5 ?x4))
		(walk_together-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6))
	:effect (and
		(invalid )))

(:action walk_together-stop-5
	:parameters (?x1 - tent
		?x2 - place
		?x3 - person
		?x4 - place
		?x5 - person
		?x6 - couple)
	:precondition (and
		(=-copy ?x3 ?x5)
		(walk_together-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6))
	:effect (and
		(invalid )))

(:action walk_together-stop-6
	:parameters (?x1 - tent
		?x2 - place
		?x3 - person
		?x4 - place
		?x5 - person
		?x6 - couple)
	:precondition (and
		(not (walked-copy ?x6 ?x4))
		(walk_together-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6))
	:effect (and
		(invalid )))

(:action walk_together-stop-7
	:parameters (?x1 - tent
		?x2 - place
		?x3 - person
		?x4 - place
		?x5 - person
		?x6 - couple)
	:precondition (and
		(not (partners-copy ?x6 ?x3 ?x5))
		(walk_together-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6))
	:effect (and
		(invalid )))

(:action walk_together-copy
	:parameters (?x1 - tent
		?x2 - place
		?x3 - person
		?x4 - place
		?x5 - person
		?x6 - couple)
	:precondition (and
		(walk_together-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6)
		(at_tent-copy ?x1 ?x2)
		(up-copy ?x1)
		(at_person-copy ?x3 ?x4)
		(next-copy ?x4 ?x2)
		(at_person-copy ?x5 ?x4)
		(not (=-copy ?x3 ?x5))
		(walked-copy ?x6 ?x4)
		(partners-copy ?x6 ?x3 ?x5))
	:effect (and
		(not (walk_together-lock ?x1 ?x2 ?x3 ?x4 ?x5 ?x6))
		(unlock-origin-domain )
		(at_person-copy ?x3 ?x2)
		(not (at_person-copy ?x3 ?x4))
		(at_person-copy ?x5 ?x2)
		(not (at_person-copy ?x5 ?x4))
		(walked-copy ?x6 ?x2)
		(not (walked-copy ?x6 ?x4))))

(:action turning
	:parameters ()
	:precondition (and
		(invalid ))
	:effect (and
		(unlock-origin-domain ))) )