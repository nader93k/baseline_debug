(define (domain optimal)
	(:requirements :strips)
	(:types
		object - object
	)
	(:predicates
		(f)
		(g) ; A single zeroary predicate
	)
	(:action a1
		:parameters (
		)
		:precondition (and
			(not (f))
			(g)
		)
		:effect (and
			(not (f))
			(g)
		)
	)
)
