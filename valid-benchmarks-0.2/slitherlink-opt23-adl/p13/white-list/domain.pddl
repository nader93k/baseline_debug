(define (domain slitherlink)
(:requirements :typing :adl)
(:types
	object
	node - object
	cell - object
	cell-capacity-level - object)
(:constants )
(:predicates
	(cell-capacity-inc ?clower - cell-capacity-level ?chigher - cell-capacity-level)
	(cell-capacity ?c - cell ?cap - cell-capacity-level)
	(cell-edge ?c1 - cell ?c2 - cell ?n1 - node ?n2 - node)
	(node-degree0 ?n - node)
	(node-degree1 ?n - node)
	(node-degree2 ?n - node)
	(linked ?n1 - node ?n2 - node)
	(disable-link-0-0 )
	(= ?x - object ?y - object)
	(cell-capacity-inc-copy ?clower - cell-capacity-level ?chigher - cell-capacity-level)
	(cell-capacity-copy ?c - cell ?cap - cell-capacity-level)
	(cell-edge-copy ?c1 - cell ?c2 - cell ?n1 - node ?n2 - node)
	(node-degree0-copy ?n - node)
	(node-degree1-copy ?n - node)
	(node-degree2-copy ?n - node)
	(linked-copy ?n1 - node ?n2 - node)
	(disable-link-0-0-copy )
	(=-copy ?x - object ?y - object)
	(invalid )
	(unlock-origin-domain )
	(link-0-0-lock ?n1 - node ?n2 - node ?c1 - cell ?c1capfrom - cell-capacity-level ?c1capto - cell-capacity-level ?c2 - cell ?c2capfrom - cell-capacity-level ?c2capto - cell-capacity-level)
	(link-0-1-lock ?n1 - node ?n2 - node ?c1 - cell ?c1capfrom - cell-capacity-level ?c1capto - cell-capacity-level ?c2 - cell ?c2capfrom - cell-capacity-level ?c2capto - cell-capacity-level)
	(link-1-0-lock ?n1 - node ?n2 - node ?c1 - cell ?c1capfrom - cell-capacity-level ?c1capto - cell-capacity-level ?c2 - cell ?c2capfrom - cell-capacity-level ?c2capto - cell-capacity-level)
	(link-1-1-lock ?n1 - node ?n2 - node ?c1 - cell ?c1capfrom - cell-capacity-level ?c1capto - cell-capacity-level ?c2 - cell ?c2capfrom - cell-capacity-level ?c2capto - cell-capacity-level))
(:functions )
(:action link-0-0
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (linked ?n1 ?n2))
		(node-degree0 ?n1)
		(node-degree0 ?n2)
		(cell-edge ?c1 ?c2 ?n1 ?n2)
		(cell-capacity ?c1 ?c1capfrom)
		(cell-capacity ?c2 ?c2capfrom)
		(cell-capacity-inc ?c1capto ?c1capfrom)
		(cell-capacity-inc ?c2capto ?c2capfrom)
		(not (disable-link-0-0 ))
		(unlock-origin-domain ))
	:effect (and
		(linked ?n1 ?n2)
		(not (node-degree0 ?n1))
		(node-degree1 ?n1)
		(not (node-degree0 ?n2))
		(node-degree1 ?n2)
		(not (cell-capacity ?c1 ?c1capfrom))
		(cell-capacity ?c1 ?c1capto)
		(not (cell-capacity ?c2 ?c2capfrom))
		(cell-capacity ?c2 ?c2capto)
		(disable-link-0-0 )
		(link-0-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto)
		(not (unlock-origin-domain ))))

(:action link-0-1
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (linked ?n1 ?n2))
		(node-degree0 ?n1)
		(node-degree1 ?n2)
		(cell-edge ?c1 ?c2 ?n1 ?n2)
		(cell-capacity ?c1 ?c1capfrom)
		(cell-capacity ?c2 ?c2capfrom)
		(cell-capacity-inc ?c1capto ?c1capfrom)
		(cell-capacity-inc ?c2capto ?c2capfrom)
		(unlock-origin-domain ))
	:effect (and
		(linked ?n1 ?n2)
		(not (node-degree0 ?n1))
		(node-degree1 ?n1)
		(not (node-degree1 ?n2))
		(node-degree2 ?n2)
		(not (cell-capacity ?c1 ?c1capfrom))
		(cell-capacity ?c1 ?c1capto)
		(not (cell-capacity ?c2 ?c2capfrom))
		(cell-capacity ?c2 ?c2capto)
		(link-0-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto)
		(not (unlock-origin-domain ))))

(:action link-1-0
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (linked ?n1 ?n2))
		(node-degree1 ?n1)
		(node-degree0 ?n2)
		(cell-edge ?c1 ?c2 ?n1 ?n2)
		(cell-capacity ?c1 ?c1capfrom)
		(cell-capacity ?c2 ?c2capfrom)
		(cell-capacity-inc ?c1capto ?c1capfrom)
		(cell-capacity-inc ?c2capto ?c2capfrom)
		(unlock-origin-domain ))
	:effect (and
		(linked ?n1 ?n2)
		(not (node-degree1 ?n1))
		(node-degree2 ?n1)
		(not (node-degree0 ?n2))
		(node-degree1 ?n2)
		(not (cell-capacity ?c1 ?c1capfrom))
		(cell-capacity ?c1 ?c1capto)
		(not (cell-capacity ?c2 ?c2capfrom))
		(cell-capacity ?c2 ?c2capto)
		(link-1-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto)
		(not (unlock-origin-domain ))))

(:action link-1-1
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (linked ?n1 ?n2))
		(node-degree1 ?n1)
		(node-degree1 ?n2)
		(cell-edge ?c1 ?c2 ?n1 ?n2)
		(cell-capacity ?c1 ?c1capfrom)
		(cell-capacity ?c2 ?c2capfrom)
		(cell-capacity-inc ?c1capto ?c1capfrom)
		(cell-capacity-inc ?c2capto ?c2capfrom)
		(unlock-origin-domain ))
	:effect (and
		(linked ?n1 ?n2)
		(not (node-degree1 ?n1))
		(node-degree2 ?n1)
		(not (node-degree1 ?n2))
		(node-degree2 ?n2)
		(not (cell-capacity ?c1 ?c1capfrom))
		(cell-capacity ?c1 ?c1capto)
		(not (cell-capacity ?c2 ?c2capfrom))
		(cell-capacity ?c2 ?c2capto)
		(link-1-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto)
		(not (unlock-origin-domain ))))

(:action link-0-0-stop-0
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(linked-copy ?n1 ?n2)
		(link-0-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-0-0-stop-1
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (node-degree0-copy ?n1))
		(link-0-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-0-0-stop-2
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (node-degree0-copy ?n2))
		(link-0-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-0-0-stop-3
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-edge-copy ?c1 ?c2 ?n1 ?n2))
		(link-0-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-0-0-stop-4
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-capacity-copy ?c1 ?c1capfrom))
		(link-0-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-0-0-stop-5
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-capacity-copy ?c2 ?c2capfrom))
		(link-0-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-0-0-stop-6
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-capacity-inc-copy ?c1capto ?c1capfrom))
		(link-0-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-0-0-stop-7
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-capacity-inc-copy ?c2capto ?c2capfrom))
		(link-0-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-0-0-stop-8
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(disable-link-0-0-copy )
		(link-0-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-0-0-copy
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(link-0-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto)
		(not (linked-copy ?n1 ?n2))
		(node-degree0-copy ?n1)
		(node-degree0-copy ?n2)
		(cell-edge-copy ?c1 ?c2 ?n1 ?n2)
		(cell-capacity-copy ?c1 ?c1capfrom)
		(cell-capacity-copy ?c2 ?c2capfrom)
		(cell-capacity-inc-copy ?c1capto ?c1capfrom)
		(cell-capacity-inc-copy ?c2capto ?c2capfrom)
		(not (disable-link-0-0-copy )))
	:effect (and
		(not (link-0-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
		(unlock-origin-domain )
		(linked-copy ?n1 ?n2)
		(node-degree1-copy ?n1)
		(not (node-degree0-copy ?n2))
		(node-degree1-copy ?n2)
		(not (cell-capacity-copy ?c1 ?c1capfrom))
		(cell-capacity-copy ?c1 ?c1capto)
		(not (cell-capacity-copy ?c2 ?c2capfrom))
		(cell-capacity-copy ?c2 ?c2capto)
		(disable-link-0-0-copy )))

(:action link-0-1-stop-0
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(linked-copy ?n1 ?n2)
		(link-0-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-0-1-stop-1
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (node-degree0-copy ?n1))
		(link-0-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-0-1-stop-2
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (node-degree1-copy ?n2))
		(link-0-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-0-1-stop-3
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-edge-copy ?c1 ?c2 ?n1 ?n2))
		(link-0-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-0-1-stop-4
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-capacity-copy ?c1 ?c1capfrom))
		(link-0-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-0-1-stop-5
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-capacity-copy ?c2 ?c2capfrom))
		(link-0-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-0-1-stop-6
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-capacity-inc-copy ?c1capto ?c1capfrom))
		(link-0-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-0-1-stop-7
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-capacity-inc-copy ?c2capto ?c2capfrom))
		(link-0-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-0-1-copy
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(link-0-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto)
		(not (linked-copy ?n1 ?n2))
		(node-degree0-copy ?n1)
		(node-degree1-copy ?n2)
		(cell-edge-copy ?c1 ?c2 ?n1 ?n2)
		(cell-capacity-copy ?c1 ?c1capfrom)
		(cell-capacity-copy ?c2 ?c2capfrom)
		(cell-capacity-inc-copy ?c1capto ?c1capfrom)
		(cell-capacity-inc-copy ?c2capto ?c2capfrom))
	:effect (and
		(not (link-0-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
		(unlock-origin-domain )
		(linked-copy ?n1 ?n2)
		(not (node-degree0-copy ?n1))
		(node-degree1-copy ?n1)
		(not (node-degree1-copy ?n2))
		(node-degree2-copy ?n2)
		(not (cell-capacity-copy ?c1 ?c1capfrom))
		(cell-capacity-copy ?c1 ?c1capto)
		(not (cell-capacity-copy ?c2 ?c2capfrom))
		(cell-capacity-copy ?c2 ?c2capto)))

(:action link-1-0-stop-0
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(linked-copy ?n1 ?n2)
		(link-1-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-1-0-stop-1
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (node-degree1-copy ?n1))
		(link-1-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-1-0-stop-2
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (node-degree0-copy ?n2))
		(link-1-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-1-0-stop-3
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-edge-copy ?c1 ?c2 ?n1 ?n2))
		(link-1-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-1-0-stop-4
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-capacity-copy ?c1 ?c1capfrom))
		(link-1-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-1-0-stop-5
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-capacity-copy ?c2 ?c2capfrom))
		(link-1-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-1-0-stop-6
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-capacity-inc-copy ?c1capto ?c1capfrom))
		(link-1-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-1-0-stop-7
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-capacity-inc-copy ?c2capto ?c2capfrom))
		(link-1-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-1-0-stop-8
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(cell-capacity-inc-copy ?c1capfrom ?c2capfrom)
		(link-1-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-1-0-copy
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(link-1-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto)
		(not (linked-copy ?n1 ?n2))
		(node-degree1-copy ?n1)
		(node-degree0-copy ?n2)
		(cell-edge-copy ?c1 ?c2 ?n1 ?n2)
		(cell-capacity-copy ?c1 ?c1capfrom)
		(cell-capacity-copy ?c2 ?c2capfrom)
		(cell-capacity-inc-copy ?c1capto ?c1capfrom)
		(cell-capacity-inc-copy ?c2capto ?c2capfrom)
		(not (cell-capacity-inc-copy ?c1capfrom ?c2capfrom)))
	:effect (and
		(not (link-1-0-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
		(unlock-origin-domain )
		(linked-copy ?n1 ?n2)
		(not (node-degree1-copy ?n1))
		(node-degree2-copy ?n1)
		(not (node-degree0-copy ?n2))
		(node-degree1-copy ?n2)
		(not (cell-capacity-copy ?c1 ?c1capfrom))
		(cell-capacity-copy ?c1 ?c1capto)
		(not (cell-capacity-copy ?c2 ?c2capfrom))
		(cell-capacity-copy ?c2 ?c2capto)))

(:action link-1-1-stop-0
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(linked-copy ?n1 ?n2)
		(link-1-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-1-1-stop-1
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (node-degree1-copy ?n1))
		(link-1-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-1-1-stop-2
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (node-degree1-copy ?n2))
		(link-1-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-1-1-stop-3
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-edge-copy ?c1 ?c2 ?n1 ?n2))
		(link-1-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-1-1-stop-4
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-capacity-copy ?c1 ?c1capfrom))
		(link-1-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-1-1-stop-5
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-capacity-copy ?c2 ?c2capfrom))
		(link-1-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-1-1-stop-6
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-capacity-inc-copy ?c1capto ?c1capfrom))
		(link-1-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-1-1-stop-7
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(not (cell-capacity-inc-copy ?c2capto ?c2capfrom))
		(link-1-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
	:effect (and
		(invalid )))

(:action link-1-1-copy
	:parameters (?n1 - node
		?n2 - node
		?c1 - cell
		?c1capfrom - cell-capacity-level
		?c1capto - cell-capacity-level
		?c2 - cell
		?c2capfrom - cell-capacity-level
		?c2capto - cell-capacity-level)
	:precondition (and
		(link-1-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto)
		(not (linked-copy ?n1 ?n2))
		(node-degree1-copy ?n1)
		(node-degree1-copy ?n2)
		(cell-edge-copy ?c1 ?c2 ?n1 ?n2)
		(cell-capacity-copy ?c1 ?c1capfrom)
		(cell-capacity-copy ?c2 ?c2capfrom)
		(cell-capacity-inc-copy ?c1capto ?c1capfrom)
		(cell-capacity-inc-copy ?c2capto ?c2capfrom))
	:effect (and
		(not (link-1-1-lock ?n1 ?n2 ?c1 ?c1capfrom ?c1capto ?c2 ?c2capfrom ?c2capto))
		(unlock-origin-domain )
		(linked-copy ?n1 ?n2)
		(not (node-degree1-copy ?n1))
		(node-degree2-copy ?n1)
		(not (node-degree1-copy ?n2))
		(node-degree2-copy ?n2)
		(not (cell-capacity-copy ?c1 ?c1capfrom))
		(cell-capacity-copy ?c1 ?c1capto)
		(not (cell-capacity-copy ?c2 ?c2capfrom))
		(cell-capacity-copy ?c2 ?c2capto)))

(:action turning
	:parameters ()
	:precondition (and
		(invalid ))
	:effect (and
		(unlock-origin-domain ))) )