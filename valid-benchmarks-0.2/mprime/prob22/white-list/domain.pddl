(define (domain mystery-prime-strips)
(:requirements :negative-preconditions :equality)
(:types
	object)
(:constants )
(:predicates
	(province ?x - object)
	(planet ?x - object)
	(food ?x - object)
	(pleasure ?x - object)
	(pain ?x - object)
	(eats ?n1 - object ?n2 - object)
	(craves ?v - object ?n - object)
	(fears ?c - object ?v - object)
	(locale ?n - object ?a - object)
	(harmony ?v - object ?s - object)
	(attacks ?i - object ?j - object)
	(orbits ?i - object ?j - object)
	(= ?x - object ?y - object)
	(province-copy ?x - object)
	(planet-copy ?x - object)
	(food-copy ?x - object)
	(pleasure-copy ?x - object)
	(pain-copy ?x - object)
	(eats-copy ?n1 - object ?n2 - object)
	(craves-copy ?v - object ?n - object)
	(fears-copy ?c - object ?v - object)
	(locale-copy ?n - object ?a - object)
	(harmony-copy ?v - object ?s - object)
	(attacks-copy ?i - object ?j - object)
	(orbits-copy ?i - object ?j - object)
	(=-copy ?x - object ?y - object)
	(invalid )
	(unlock-origin-domain )
	(overcome-lock ?c - object ?v - object ?n - object ?s1 - object ?s2 - object)
	(feast-lock ?v - object ?n1 - object ?n2 - object ?l1 - object ?l2 - object)
	(succumb-lock ?c - object ?v - object ?n - object ?s1 - object ?s2 - object)
	(drink-lock ?n1 - object ?n2 - object ?l11 - object ?l12 - object ?l13 - object ?l21 - object ?l22 - object))
(:functions )
(:action overcome
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(pain ?c)
		(pleasure ?v)
		(craves ?c ?n)
		(craves ?v ?n)
		(food ?n)
		(harmony ?v ?s2)
		(planet ?s2)
		(orbits ?s1 ?s2)
		(planet ?s1)
		(unlock-origin-domain ))
	:effect (and
		(not (craves ?c ?n))
		(fears ?c ?v)
		(not (harmony ?v ?s2))
		(harmony ?v ?s1)
		(overcome-lock ?c ?v ?n ?s1 ?s2)
		(not (unlock-origin-domain ))))

(:action feast
	:parameters (?v - object
		?n1 - object
		?n2 - object
		?l1 - object
		?l2 - object)
	:precondition (and
		(craves ?v ?n1)
		(food ?n1)
		(pleasure ?v)
		(eats ?n1 ?n2)
		(food ?n2)
		(locale ?n1 ?l2)
		(attacks ?l1 ?l2)
		(unlock-origin-domain ))
	:effect (and
		(not (craves ?v ?n1))
		(craves ?v ?n2)
		(not (locale ?n1 ?l2))
		(locale ?n1 ?l1)
		(feast-lock ?v ?n1 ?n2 ?l1 ?l2)
		(not (unlock-origin-domain ))))

(:action succumb
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(fears ?c ?v)
		(pain ?c)
		(pleasure ?v)
		(craves ?v ?n)
		(food ?n)
		(harmony ?v ?s1)
		(orbits ?s1 ?s2)
		(unlock-origin-domain ))
	:effect (and
		(not (fears ?c ?v))
		(craves ?c ?n)
		(not (harmony ?v ?s1))
		(harmony ?v ?s2)
		(succumb-lock ?c ?v ?n ?s1 ?s2)
		(not (unlock-origin-domain ))))

(:action drink
	:parameters (?n1 - object
		?n2 - object
		?l11 - object
		?l12 - object
		?l13 - object
		?l21 - object
		?l22 - object)
	:precondition (and
		(not (= ?n1 ?n2))
		(locale ?n1 ?l11)
		(attacks ?l12 ?l11)
		(attacks ?l13 ?l12)
		(locale ?n2 ?l21)
		(attacks ?l21 ?l22)
		(unlock-origin-domain ))
	:effect (and
		(not (locale ?n1 ?l11))
		(locale ?n1 ?l12)
		(not (locale ?n2 ?l21))
		(locale ?n2 ?l22)
		(drink-lock ?n1 ?n2 ?l11 ?l12 ?l13 ?l21 ?l22)
		(not (unlock-origin-domain ))))

(:action overcome-stop-0
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(not (pain-copy ?c))
		(overcome-lock ?c ?v ?n ?s1 ?s2))
	:effect (and
		(invalid )))

(:action overcome-stop-1
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(not (pleasure-copy ?v))
		(overcome-lock ?c ?v ?n ?s1 ?s2))
	:effect (and
		(invalid )))

(:action overcome-stop-2
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(not (craves-copy ?c ?n))
		(overcome-lock ?c ?v ?n ?s1 ?s2))
	:effect (and
		(invalid )))

(:action overcome-stop-3
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(not (craves-copy ?v ?n))
		(overcome-lock ?c ?v ?n ?s1 ?s2))
	:effect (and
		(invalid )))

(:action overcome-stop-4
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(not (food-copy ?n))
		(overcome-lock ?c ?v ?n ?s1 ?s2))
	:effect (and
		(invalid )))

(:action overcome-stop-5
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(not (harmony-copy ?v ?s2))
		(overcome-lock ?c ?v ?n ?s1 ?s2))
	:effect (and
		(invalid )))

(:action overcome-stop-6
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(not (planet-copy ?s2))
		(overcome-lock ?c ?v ?n ?s1 ?s2))
	:effect (and
		(invalid )))

(:action overcome-stop-7
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(not (orbits-copy ?s1 ?s2))
		(overcome-lock ?c ?v ?n ?s1 ?s2))
	:effect (and
		(invalid )))

(:action overcome-stop-8
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(not (planet-copy ?s1))
		(overcome-lock ?c ?v ?n ?s1 ?s2))
	:effect (and
		(invalid )))

(:action overcome-copy
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(overcome-lock ?c ?v ?n ?s1 ?s2)
		(pain-copy ?c)
		(pleasure-copy ?v)
		(craves-copy ?c ?n)
		(craves-copy ?v ?n)
		(food-copy ?n)
		(harmony-copy ?v ?s2)
		(planet-copy ?s2)
		(orbits-copy ?s1 ?s2)
		(planet-copy ?s1))
	:effect (and
		(not (overcome-lock ?c ?v ?n ?s1 ?s2))
		(unlock-origin-domain )
		(not (craves-copy ?c ?n))
		(fears-copy ?c ?v)
		(not (harmony-copy ?v ?s2))
		(harmony-copy ?v ?s1)))

(:action feast-stop-0
	:parameters (?v - object
		?n1 - object
		?n2 - object
		?l1 - object
		?l2 - object)
	:precondition (and
		(not (craves-copy ?v ?n1))
		(feast-lock ?v ?n1 ?n2 ?l1 ?l2))
	:effect (and
		(invalid )))

(:action feast-stop-1
	:parameters (?v - object
		?n1 - object
		?n2 - object
		?l1 - object
		?l2 - object)
	:precondition (and
		(not (food-copy ?n1))
		(feast-lock ?v ?n1 ?n2 ?l1 ?l2))
	:effect (and
		(invalid )))

(:action feast-stop-2
	:parameters (?v - object
		?n1 - object
		?n2 - object
		?l1 - object
		?l2 - object)
	:precondition (and
		(not (pleasure-copy ?v))
		(feast-lock ?v ?n1 ?n2 ?l1 ?l2))
	:effect (and
		(invalid )))

(:action feast-stop-3
	:parameters (?v - object
		?n1 - object
		?n2 - object
		?l1 - object
		?l2 - object)
	:precondition (and
		(not (eats-copy ?n1 ?n2))
		(feast-lock ?v ?n1 ?n2 ?l1 ?l2))
	:effect (and
		(invalid )))

(:action feast-stop-4
	:parameters (?v - object
		?n1 - object
		?n2 - object
		?l1 - object
		?l2 - object)
	:precondition (and
		(not (food-copy ?n2))
		(feast-lock ?v ?n1 ?n2 ?l1 ?l2))
	:effect (and
		(invalid )))

(:action feast-stop-5
	:parameters (?v - object
		?n1 - object
		?n2 - object
		?l1 - object
		?l2 - object)
	:precondition (and
		(not (locale-copy ?n1 ?l2))
		(feast-lock ?v ?n1 ?n2 ?l1 ?l2))
	:effect (and
		(invalid )))

(:action feast-stop-6
	:parameters (?v - object
		?n1 - object
		?n2 - object
		?l1 - object
		?l2 - object)
	:precondition (and
		(not (attacks-copy ?l1 ?l2))
		(feast-lock ?v ?n1 ?n2 ?l1 ?l2))
	:effect (and
		(invalid )))

(:action feast-copy
	:parameters (?v - object
		?n1 - object
		?n2 - object
		?l1 - object
		?l2 - object)
	:precondition (and
		(feast-lock ?v ?n1 ?n2 ?l1 ?l2)
		(craves-copy ?v ?n1)
		(food-copy ?n1)
		(pleasure-copy ?v)
		(eats-copy ?n1 ?n2)
		(food-copy ?n2)
		(locale-copy ?n1 ?l2)
		(attacks-copy ?l1 ?l2))
	:effect (and
		(not (feast-lock ?v ?n1 ?n2 ?l1 ?l2))
		(unlock-origin-domain )
		(not (craves-copy ?v ?n1))
		(craves-copy ?v ?n2)))

(:action succumb-stop-0
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(not (fears-copy ?c ?v))
		(succumb-lock ?c ?v ?n ?s1 ?s2))
	:effect (and
		(invalid )))

(:action succumb-stop-1
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(not (pain-copy ?c))
		(succumb-lock ?c ?v ?n ?s1 ?s2))
	:effect (and
		(invalid )))

(:action succumb-stop-2
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(not (pleasure-copy ?v))
		(succumb-lock ?c ?v ?n ?s1 ?s2))
	:effect (and
		(invalid )))

(:action succumb-stop-3
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(not (craves-copy ?v ?n))
		(succumb-lock ?c ?v ?n ?s1 ?s2))
	:effect (and
		(invalid )))

(:action succumb-stop-4
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(not (food-copy ?n))
		(succumb-lock ?c ?v ?n ?s1 ?s2))
	:effect (and
		(invalid )))

(:action succumb-stop-5
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(not (harmony-copy ?v ?s1))
		(succumb-lock ?c ?v ?n ?s1 ?s2))
	:effect (and
		(invalid )))

(:action succumb-stop-6
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(not (orbits-copy ?s1 ?s2))
		(succumb-lock ?c ?v ?n ?s1 ?s2))
	:effect (and
		(invalid )))

(:action succumb-copy
	:parameters (?c - object
		?v - object
		?n - object
		?s1 - object
		?s2 - object)
	:precondition (and
		(succumb-lock ?c ?v ?n ?s1 ?s2)
		(fears-copy ?c ?v)
		(pain-copy ?c)
		(pleasure-copy ?v)
		(craves-copy ?v ?n)
		(food-copy ?n)
		(harmony-copy ?v ?s1)
		(orbits-copy ?s1 ?s2))
	:effect (and
		(not (succumb-lock ?c ?v ?n ?s1 ?s2))
		(unlock-origin-domain )
		(not (fears-copy ?c ?v))
		(craves-copy ?c ?n)
		(not (harmony-copy ?v ?s1))
		(harmony-copy ?v ?s2)))

(:action drink-stop-0
	:parameters (?n1 - object
		?n2 - object
		?l11 - object
		?l12 - object
		?l13 - object
		?l21 - object
		?l22 - object)
	:precondition (and
		(=-copy ?n1 ?n2)
		(drink-lock ?n1 ?n2 ?l11 ?l12 ?l13 ?l21 ?l22))
	:effect (and
		(invalid )))

(:action drink-stop-1
	:parameters (?n1 - object
		?n2 - object
		?l11 - object
		?l12 - object
		?l13 - object
		?l21 - object
		?l22 - object)
	:precondition (and
		(not (locale-copy ?n1 ?l11))
		(drink-lock ?n1 ?n2 ?l11 ?l12 ?l13 ?l21 ?l22))
	:effect (and
		(invalid )))

(:action drink-stop-2
	:parameters (?n1 - object
		?n2 - object
		?l11 - object
		?l12 - object
		?l13 - object
		?l21 - object
		?l22 - object)
	:precondition (and
		(not (attacks-copy ?l12 ?l11))
		(drink-lock ?n1 ?n2 ?l11 ?l12 ?l13 ?l21 ?l22))
	:effect (and
		(invalid )))

(:action drink-stop-3
	:parameters (?n1 - object
		?n2 - object
		?l11 - object
		?l12 - object
		?l13 - object
		?l21 - object
		?l22 - object)
	:precondition (and
		(not (attacks-copy ?l13 ?l12))
		(drink-lock ?n1 ?n2 ?l11 ?l12 ?l13 ?l21 ?l22))
	:effect (and
		(invalid )))

(:action drink-stop-4
	:parameters (?n1 - object
		?n2 - object
		?l11 - object
		?l12 - object
		?l13 - object
		?l21 - object
		?l22 - object)
	:precondition (and
		(not (locale-copy ?n2 ?l21))
		(drink-lock ?n1 ?n2 ?l11 ?l12 ?l13 ?l21 ?l22))
	:effect (and
		(invalid )))

(:action drink-stop-5
	:parameters (?n1 - object
		?n2 - object
		?l11 - object
		?l12 - object
		?l13 - object
		?l21 - object
		?l22 - object)
	:precondition (and
		(not (attacks-copy ?l21 ?l22))
		(drink-lock ?n1 ?n2 ?l11 ?l12 ?l13 ?l21 ?l22))
	:effect (and
		(invalid )))

(:action drink-copy
	:parameters (?n1 - object
		?n2 - object
		?l11 - object
		?l12 - object
		?l13 - object
		?l21 - object
		?l22 - object)
	:precondition (and
		(drink-lock ?n1 ?n2 ?l11 ?l12 ?l13 ?l21 ?l22)
		(not (=-copy ?n1 ?n2))
		(locale-copy ?n1 ?l11)
		(attacks-copy ?l12 ?l11)
		(attacks-copy ?l13 ?l12)
		(locale-copy ?n2 ?l21)
		(attacks-copy ?l21 ?l22))
	:effect (and
		(not (drink-lock ?n1 ?n2 ?l11 ?l12 ?l13 ?l21 ?l22))
		(unlock-origin-domain )
		(not (locale-copy ?n1 ?l11))
		(locale-copy ?n1 ?l12)
		(not (locale-copy ?n2 ?l21))
		(locale-copy ?n2 ?l22)))

(:action turning
	:parameters ()
	:precondition (and
		(invalid ))
	:effect (and
		(unlock-origin-domain ))) )