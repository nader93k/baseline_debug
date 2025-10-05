(define (domain optimal)
	(:requirements :strips)
	(:types
		object - object
	)
	(:predicates
		(f) ; A single zeroary predicate
		(unused)
	)

	

	; --- Actions a1 and a2: No precondition, effect is to delete (f) ---

	(:action a1
		:parameters ()
		:precondition (and
			(unused)
		)
		:effect (and
			(f)
			(g)
		)
	)

	(:action a2
		:parameters ()
		:precondition (and
			(unused)
		)
		:effect (and
			(f)
			(g)
		)
	)

	; --- Actions a3, a4, and a5: Precondition is (f), no effect ---

	(:action a3
		:parameters ()
		:precondition (and
			(not (f))
			(g)
		)
		:effect (and
			(unused)
		)
	)

	(:action a4
		:parameters ()
		:precondition (and
			(not (f))
			(g)
		)
		:effect (and
			(unused)
		)
	)

	(:action a5
		:parameters ()
		:precondition (and
			(not (f))
			(g)
		)
		:effect (and
			(unused)
		)
	)

	(:action ax
		:parameters ()
		:precondition (and
			(not (f))
			(g)
		)
		:effect (and
			(f)
		)
	)
)