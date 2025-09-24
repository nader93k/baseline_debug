(define (domain scanalyzer3d)
(:requirements :typing :action-costs)
(:types
	object
	segment - object
	car - object)
(:constants )
(:predicates
	(on ?c - car ?s - segment)
	(analyzed ?c - car)
	(cycle-2 ?s1 - segment ?s2 - segment)
	(cycle-4 ?s1 - segment ?s2 - segment ?s3 - segment ?s4 - segment)
	(cycle-2-with-analysis ?s1 - segment ?s2 - segment)
	(cycle-4-with-analysis ?s1 - segment ?s2 - segment ?s3 - segment ?s4 - segment)
	(= ?x - object ?y - object)
	(on-copy ?c - car ?s - segment)
	(analyzed-copy ?c - car)
	(cycle-2-copy ?s1 - segment ?s2 - segment)
	(cycle-4-copy ?s1 - segment ?s2 - segment ?s3 - segment ?s4 - segment)
	(cycle-2-with-analysis-copy ?s1 - segment ?s2 - segment)
	(cycle-4-with-analysis-copy ?s1 - segment ?s2 - segment ?s3 - segment ?s4 - segment)
	(=-copy ?x - object ?y - object)
	(invalid )
	(unlock-origin-domain )
	(analyze-2-lock ?s1 - segment ?s2 - segment ?c1 - car ?c2 - car)
	(analyze-4-lock ?s1 - segment ?s2 - segment ?s3 - segment ?s4 - segment ?c1 - car ?c2 - car ?c3 - car ?c4 - car)
	(rotate-2-lock ?s1 - segment ?s2 - segment ?c1 - car ?c2 - car)
	(rotate-4-lock ?s1 - segment ?s2 - segment ?s3 - segment ?s4 - segment ?c1 - car ?c2 - car ?c3 - car ?c4 - car))
(:functions (total-cost ))
(:action analyze-2
	:parameters (?s1 - segment
		?s2 - segment
		?c1 - car
		?c2 - car)
	:precondition (and
		(cycle-2-with-analysis ?s1 ?s2)
		(on ?c1 ?s1)
		(on ?c2 ?s2)
		(unlock-origin-domain ))
	:effect (and
		(not (on ?c1 ?s1))
		(not (on ?c2 ?s2))
		(on ?c1 ?s2)
		(on ?c2 ?s1)
		(analyzed ?c1)
		(analyze-2-lock ?s1 ?s2 ?c1 ?c2)
		(not (unlock-origin-domain ))(increase (total-cost ) 3)))

(:action analyze-4
	:parameters (?s1 - segment
		?s2 - segment
		?s3 - segment
		?s4 - segment
		?c1 - car
		?c2 - car
		?c3 - car
		?c4 - car)
	:precondition (and
		(cycle-4-with-analysis ?s1 ?s2 ?s3 ?s4)
		(on ?c1 ?s1)
		(on ?c2 ?s2)
		(on ?c3 ?s3)
		(on ?c4 ?s4)
		(unlock-origin-domain ))
	:effect (and
		(not (on ?c1 ?s1))
		(not (on ?c2 ?s2))
		(not (on ?c3 ?s3))
		(not (on ?c4 ?s4))
		(on ?c1 ?s4)
		(on ?c2 ?s1)
		(on ?c3 ?s2)
		(on ?c4 ?s3)
		(analyzed ?c1)
		(analyze-4-lock ?s1 ?s2 ?s3 ?s4 ?c1 ?c2 ?c3 ?c4)
		(not (unlock-origin-domain ))(increase (total-cost ) 3)))

(:action rotate-2
	:parameters (?s1 - segment
		?s2 - segment
		?c1 - car
		?c2 - car)
	:precondition (and
		(cycle-2 ?s1 ?s2)
		(on ?c1 ?s1)
		(on ?c2 ?s2)
		(unlock-origin-domain ))
	:effect (and
		(not (on ?c1 ?s1))
		(not (on ?c2 ?s2))
		(on ?c1 ?s2)
		(on ?c2 ?s1)
		(rotate-2-lock ?s1 ?s2 ?c1 ?c2)
		(not (unlock-origin-domain ))(increase (total-cost ) 1)))

(:action rotate-4
	:parameters (?s1 - segment
		?s2 - segment
		?s3 - segment
		?s4 - segment
		?c1 - car
		?c2 - car
		?c3 - car
		?c4 - car)
	:precondition (and
		(cycle-4 ?s1 ?s2 ?s3 ?s4)
		(on ?c1 ?s1)
		(on ?c2 ?s2)
		(on ?c3 ?s3)
		(on ?c4 ?s4)
		(unlock-origin-domain ))
	:effect (and
		(not (on ?c1 ?s1))
		(not (on ?c2 ?s2))
		(not (on ?c3 ?s3))
		(not (on ?c4 ?s4))
		(on ?c1 ?s4)
		(on ?c2 ?s1)
		(on ?c3 ?s2)
		(on ?c4 ?s3)
		(rotate-4-lock ?s1 ?s2 ?s3 ?s4 ?c1 ?c2 ?c3 ?c4)
		(not (unlock-origin-domain ))(increase (total-cost ) 1)))

(:action analyze-2-stop-0
	:parameters (?s1 - segment
		?s2 - segment
		?c1 - car
		?c2 - car)
	:precondition (and
		(not (cycle-2-with-analysis-copy ?s1 ?s2))
		(analyze-2-lock ?s1 ?s2 ?c1 ?c2))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action analyze-2-stop-1
	:parameters (?s1 - segment
		?s2 - segment
		?c1 - car
		?c2 - car)
	:precondition (and
		(not (on-copy ?c1 ?s1))
		(analyze-2-lock ?s1 ?s2 ?c1 ?c2))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action analyze-2-stop-2
	:parameters (?s1 - segment
		?s2 - segment
		?c1 - car
		?c2 - car)
	:precondition (and
		(not (on-copy ?c2 ?s2))
		(analyze-2-lock ?s1 ?s2 ?c1 ?c2))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action analyze-2-copy
	:parameters (?s1 - segment
		?s2 - segment
		?c1 - car
		?c2 - car)
	:precondition (and
		(analyze-2-lock ?s1 ?s2 ?c1 ?c2)
		(cycle-2-with-analysis-copy ?s1 ?s2)
		(on-copy ?c1 ?s1)
		(on-copy ?c2 ?s2))
	:effect (and
		(not (analyze-2-lock ?s1 ?s2 ?c1 ?c2))
		(unlock-origin-domain )
		(not (on-copy ?c1 ?s1))
		(not (on-copy ?c2 ?s2))
		(on-copy ?c1 ?s2)
		(on-copy ?c2 ?s1)
		(analyzed-copy ?c1)(increase (total-cost ) 3)))

(:action analyze-4-stop-0
	:parameters (?s1 - segment
		?s2 - segment
		?s3 - segment
		?s4 - segment
		?c1 - car
		?c2 - car
		?c3 - car
		?c4 - car)
	:precondition (and
		(not (cycle-4-with-analysis-copy ?s1 ?s2 ?s3 ?s4))
		(analyze-4-lock ?s1 ?s2 ?s3 ?s4 ?c1 ?c2 ?c3 ?c4))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action analyze-4-stop-1
	:parameters (?s1 - segment
		?s2 - segment
		?s3 - segment
		?s4 - segment
		?c1 - car
		?c2 - car
		?c3 - car
		?c4 - car)
	:precondition (and
		(not (on-copy ?c1 ?s1))
		(analyze-4-lock ?s1 ?s2 ?s3 ?s4 ?c1 ?c2 ?c3 ?c4))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action analyze-4-stop-2
	:parameters (?s1 - segment
		?s2 - segment
		?s3 - segment
		?s4 - segment
		?c1 - car
		?c2 - car
		?c3 - car
		?c4 - car)
	:precondition (and
		(not (on-copy ?c2 ?s2))
		(analyze-4-lock ?s1 ?s2 ?s3 ?s4 ?c1 ?c2 ?c3 ?c4))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action analyze-4-stop-3
	:parameters (?s1 - segment
		?s2 - segment
		?s3 - segment
		?s4 - segment
		?c1 - car
		?c2 - car
		?c3 - car
		?c4 - car)
	:precondition (and
		(not (on-copy ?c3 ?s3))
		(analyze-4-lock ?s1 ?s2 ?s3 ?s4 ?c1 ?c2 ?c3 ?c4))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action analyze-4-stop-4
	:parameters (?s1 - segment
		?s2 - segment
		?s3 - segment
		?s4 - segment
		?c1 - car
		?c2 - car
		?c3 - car
		?c4 - car)
	:precondition (and
		(not (on-copy ?c4 ?s4))
		(analyze-4-lock ?s1 ?s2 ?s3 ?s4 ?c1 ?c2 ?c3 ?c4))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action analyze-4-copy
	:parameters (?s1 - segment
		?s2 - segment
		?s3 - segment
		?s4 - segment
		?c1 - car
		?c2 - car
		?c3 - car
		?c4 - car)
	:precondition (and
		(analyze-4-lock ?s1 ?s2 ?s3 ?s4 ?c1 ?c2 ?c3 ?c4)
		(cycle-4-with-analysis-copy ?s1 ?s2 ?s3 ?s4)
		(on-copy ?c1 ?s1)
		(on-copy ?c2 ?s2)
		(on-copy ?c3 ?s3)
		(on-copy ?c4 ?s4))
	:effect (and
		(not (analyze-4-lock ?s1 ?s2 ?s3 ?s4 ?c1 ?c2 ?c3 ?c4))
		(unlock-origin-domain )
		(not (on-copy ?c1 ?s1))
		(not (on-copy ?c3 ?s3))
		(not (on-copy ?c4 ?s4))
		(on-copy ?c1 ?s4)
		(on-copy ?c2 ?s1)
		(on-copy ?c3 ?s2)
		(on-copy ?c4 ?s3)
		(analyzed-copy ?c1)(increase (total-cost ) 3)))

(:action rotate-2-stop-0
	:parameters (?s1 - segment
		?s2 - segment
		?c1 - car
		?c2 - car)
	:precondition (and
		(not (cycle-2-copy ?s1 ?s2))
		(rotate-2-lock ?s1 ?s2 ?c1 ?c2))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action rotate-2-stop-1
	:parameters (?s1 - segment
		?s2 - segment
		?c1 - car
		?c2 - car)
	:precondition (and
		(not (on-copy ?c1 ?s1))
		(rotate-2-lock ?s1 ?s2 ?c1 ?c2))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action rotate-2-stop-2
	:parameters (?s1 - segment
		?s2 - segment
		?c1 - car
		?c2 - car)
	:precondition (and
		(not (on-copy ?c2 ?s2))
		(rotate-2-lock ?s1 ?s2 ?c1 ?c2))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action rotate-2-stop-3
	:parameters (?s1 - segment
		?s2 - segment
		?c1 - car
		?c2 - car)
	:precondition (and
		(not (cycle-2-copy ?s2 ?s2))
		(rotate-2-lock ?s1 ?s2 ?c1 ?c2))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action rotate-2-copy
	:parameters (?s1 - segment
		?s2 - segment
		?c1 - car
		?c2 - car)
	:precondition (and
		(rotate-2-lock ?s1 ?s2 ?c1 ?c2)
		(cycle-2-copy ?s1 ?s2)
		(on-copy ?c1 ?s1)
		(on-copy ?c2 ?s2)
		(cycle-2-copy ?s2 ?s2))
	:effect (and
		(not (rotate-2-lock ?s1 ?s2 ?c1 ?c2))
		(unlock-origin-domain )
		(not (on-copy ?c1 ?s1))
		(not (on-copy ?c2 ?s2))
		(on-copy ?c1 ?s2)
		(on-copy ?c2 ?s1)(increase (total-cost ) 1)))

(:action rotate-4-stop-0
	:parameters (?s1 - segment
		?s2 - segment
		?s3 - segment
		?s4 - segment
		?c1 - car
		?c2 - car
		?c3 - car
		?c4 - car)
	:precondition (and
		(not (cycle-4-copy ?s1 ?s2 ?s3 ?s4))
		(rotate-4-lock ?s1 ?s2 ?s3 ?s4 ?c1 ?c2 ?c3 ?c4))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action rotate-4-stop-1
	:parameters (?s1 - segment
		?s2 - segment
		?s3 - segment
		?s4 - segment
		?c1 - car
		?c2 - car
		?c3 - car
		?c4 - car)
	:precondition (and
		(not (on-copy ?c1 ?s1))
		(rotate-4-lock ?s1 ?s2 ?s3 ?s4 ?c1 ?c2 ?c3 ?c4))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action rotate-4-stop-2
	:parameters (?s1 - segment
		?s2 - segment
		?s3 - segment
		?s4 - segment
		?c1 - car
		?c2 - car
		?c3 - car
		?c4 - car)
	:precondition (and
		(not (on-copy ?c2 ?s2))
		(rotate-4-lock ?s1 ?s2 ?s3 ?s4 ?c1 ?c2 ?c3 ?c4))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action rotate-4-stop-3
	:parameters (?s1 - segment
		?s2 - segment
		?s3 - segment
		?s4 - segment
		?c1 - car
		?c2 - car
		?c3 - car
		?c4 - car)
	:precondition (and
		(not (on-copy ?c3 ?s3))
		(rotate-4-lock ?s1 ?s2 ?s3 ?s4 ?c1 ?c2 ?c3 ?c4))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action rotate-4-stop-4
	:parameters (?s1 - segment
		?s2 - segment
		?s3 - segment
		?s4 - segment
		?c1 - car
		?c2 - car
		?c3 - car
		?c4 - car)
	:precondition (and
		(not (on-copy ?c4 ?s4))
		(rotate-4-lock ?s1 ?s2 ?s3 ?s4 ?c1 ?c2 ?c3 ?c4))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action rotate-4-copy
	:parameters (?s1 - segment
		?s2 - segment
		?s3 - segment
		?s4 - segment
		?c1 - car
		?c2 - car
		?c3 - car
		?c4 - car)
	:precondition (and
		(rotate-4-lock ?s1 ?s2 ?s3 ?s4 ?c1 ?c2 ?c3 ?c4)
		(cycle-4-copy ?s1 ?s2 ?s3 ?s4)
		(on-copy ?c1 ?s1)
		(on-copy ?c2 ?s2)
		(on-copy ?c3 ?s3)
		(on-copy ?c4 ?s4))
	:effect (and
		(not (rotate-4-lock ?s1 ?s2 ?s3 ?s4 ?c1 ?c2 ?c3 ?c4))
		(unlock-origin-domain )
		(not (on-copy ?c1 ?s1))
		(not (on-copy ?c2 ?s2))
		(not (on-copy ?c3 ?s3))
		(not (on-copy ?c4 ?s4))
		(on-copy ?c1 ?s4)
		(on-copy ?c2 ?s1)
		(on-copy ?c3 ?s2)
		(on-copy ?c4 ?s3)(increase (total-cost ) 1)))

(:action turning
	:parameters ()
	:precondition (and
		(invalid ))
	:effect (and
		(unlock-origin-domain )(increase (total-cost ) 1))) )