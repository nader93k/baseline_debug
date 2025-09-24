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
	(= ?x - object ?y - object))
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
		(not (disable-link-0-0 )))
	:effect (and
		(linked ?n1 ?n2)
		(node-degree1 ?n1)
		(not (node-degree0 ?n2))
		(node-degree1 ?n2)
		(not (cell-capacity ?c1 ?c1capfrom))
		(cell-capacity ?c1 ?c1capto)
		(not (cell-capacity ?c2 ?c2capfrom))
		(cell-capacity ?c2 ?c2capto)
		(disable-link-0-0 )))

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
		(cell-capacity-inc ?c2capto ?c2capfrom))
	:effect (and
		(linked ?n1 ?n2)
		(not (node-degree0 ?n1))
		(node-degree1 ?n1)
		(not (node-degree1 ?n2))
		(node-degree2 ?n2)
		(not (cell-capacity ?c1 ?c1capfrom))
		(cell-capacity ?c1 ?c1capto)
		(not (cell-capacity ?c2 ?c2capfrom))
		(cell-capacity ?c2 ?c2capto)))

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
		(not (cell-capacity-inc ?c1capfrom ?c2capfrom)))
	:effect (and
		(linked ?n1 ?n2)
		(not (node-degree1 ?n1))
		(node-degree2 ?n1)
		(not (node-degree0 ?n2))
		(node-degree1 ?n2)
		(not (cell-capacity ?c1 ?c1capfrom))
		(cell-capacity ?c1 ?c1capto)
		(not (cell-capacity ?c2 ?c2capfrom))
		(cell-capacity ?c2 ?c2capto)))

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
		(cell-capacity-inc ?c2capto ?c2capfrom))
	:effect (and
		(linked ?n1 ?n2)
		(not (node-degree1 ?n1))
		(node-degree2 ?n1)
		(not (node-degree1 ?n2))
		(node-degree2 ?n2)
		(not (cell-capacity ?c1 ?c1capfrom))
		(cell-capacity ?c1 ?c1capto)
		(not (cell-capacity ?c2 ?c2capfrom))
		(cell-capacity ?c2 ?c2capto))) )