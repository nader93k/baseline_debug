(define (domain sokoban-sequential)
(:requirements :typing :action-costs)
(:types
	object
	object - object
	thing - object
	location - object
	direction - object
	player - thing
	stone - thing)
(:constants )
(:predicates
	(clear ?l - location)
	(at ?t - thing ?l - location)
	(at-goal ?s - stone)
	(is-goal ?l - location)
	(is-nongoal ?l - location)
	(move-dir ?from - location ?to - location ?dir - direction)
	(= ?x - object ?y - object)
	(= ?x - object ?y - object)
	(clear-copy ?l - location)
	(at-copy ?t - thing ?l - location)
	(at-goal-copy ?s - stone)
	(is-goal-copy ?l - location)
	(is-nongoal-copy ?l - location)
	(move-dir-copy ?from - location ?to - location ?dir - direction)
	(=-copy ?x - object ?y - object)
	(invalid )
	(unlock-origin-domain )
	(move-lock ?p - player ?from - location ?to - location ?dir - direction)
	(push-to-nongoal-lock ?p - player ?s - stone ?ppos - location ?from - location ?to - location ?dir - direction)
	(push-to-goal-lock ?p - player ?s - stone ?ppos - location ?from - location ?to - location ?dir - direction))
(:functions (total-cost ))
(:action move
	:parameters (?p - player
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(at ?p ?from)
		(clear ?to)
		(move-dir ?from ?to ?dir)
		(is-nongoal ?to)
		(unlock-origin-domain ))
	:effect (and
		(not (at ?p ?from))
		(not (clear ?to))
		(at ?p ?to)
		(clear ?from)
		(move-lock ?p ?from ?to ?dir)
		(not (unlock-origin-domain ))))

(:action push-to-nongoal
	:parameters (?p - player
		?s - stone
		?ppos - location
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(at ?p ?ppos)
		(at ?s ?from)
		(clear ?to)
		(move-dir ?ppos ?from ?dir)
		(move-dir ?from ?to ?dir)
		(is-nongoal ?to)
		(unlock-origin-domain ))
	:effect (and
		(not (at ?p ?ppos))
		(not (at ?s ?from))
		(not (clear ?to))
		(at ?p ?from)
		(at ?s ?to)
		(clear ?ppos)
		(not (at-goal ?s))
		(push-to-nongoal-lock ?p ?s ?ppos ?from ?to ?dir)
		(not (unlock-origin-domain ))(increase (total-cost ) 1)))

(:action push-to-goal
	:parameters (?p - player
		?s - stone
		?ppos - location
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(at ?p ?ppos)
		(at ?s ?from)
		(clear ?to)
		(move-dir ?ppos ?from ?dir)
		(move-dir ?from ?to ?dir)
		(is-goal ?to)
		(unlock-origin-domain ))
	:effect (and
		(not (at ?p ?ppos))
		(not (at ?s ?from))
		(at ?p ?from)
		(at ?s ?to)
		(clear ?ppos)
		(at-goal ?s)
		(push-to-goal-lock ?p ?s ?ppos ?from ?to ?dir)
		(not (unlock-origin-domain ))(increase (total-cost ) 1)))

(:action move-stop-0
	:parameters (?p - player
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(not (at-copy ?p ?from))
		(move-lock ?p ?from ?to ?dir))
	:effect (and
		(invalid )))

(:action move-stop-1
	:parameters (?p - player
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(not (clear-copy ?to))
		(move-lock ?p ?from ?to ?dir))
	:effect (and
		(invalid )))

(:action move-stop-2
	:parameters (?p - player
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(not (move-dir-copy ?from ?to ?dir))
		(move-lock ?p ?from ?to ?dir))
	:effect (and
		(invalid )))

(:action move-copy
	:parameters (?p - player
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(move-lock ?p ?from ?to ?dir)
		(at-copy ?p ?from)
		(clear-copy ?to)
		(move-dir-copy ?from ?to ?dir))
	:effect (and
		(not (move-lock ?p ?from ?to ?dir))
		(unlock-origin-domain )
		(not (at-copy ?p ?from))
		(not (clear-copy ?to))
		(at-copy ?p ?to)
		(clear-copy ?from)))

(:action push-to-nongoal-stop-0
	:parameters (?p - player
		?s - stone
		?ppos - location
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(not (at-copy ?p ?ppos))
		(push-to-nongoal-lock ?p ?s ?ppos ?from ?to ?dir))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action push-to-nongoal-stop-1
	:parameters (?p - player
		?s - stone
		?ppos - location
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(not (at-copy ?s ?from))
		(push-to-nongoal-lock ?p ?s ?ppos ?from ?to ?dir))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action push-to-nongoal-stop-2
	:parameters (?p - player
		?s - stone
		?ppos - location
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(not (clear-copy ?to))
		(push-to-nongoal-lock ?p ?s ?ppos ?from ?to ?dir))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action push-to-nongoal-stop-3
	:parameters (?p - player
		?s - stone
		?ppos - location
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(not (move-dir-copy ?ppos ?from ?dir))
		(push-to-nongoal-lock ?p ?s ?ppos ?from ?to ?dir))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action push-to-nongoal-stop-4
	:parameters (?p - player
		?s - stone
		?ppos - location
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(not (move-dir-copy ?from ?to ?dir))
		(push-to-nongoal-lock ?p ?s ?ppos ?from ?to ?dir))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action push-to-nongoal-stop-5
	:parameters (?p - player
		?s - stone
		?ppos - location
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(not (is-nongoal-copy ?to))
		(push-to-nongoal-lock ?p ?s ?ppos ?from ?to ?dir))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action push-to-nongoal-copy
	:parameters (?p - player
		?s - stone
		?ppos - location
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(push-to-nongoal-lock ?p ?s ?ppos ?from ?to ?dir)
		(at-copy ?p ?ppos)
		(at-copy ?s ?from)
		(clear-copy ?to)
		(move-dir-copy ?ppos ?from ?dir)
		(move-dir-copy ?from ?to ?dir)
		(is-nongoal-copy ?to))
	:effect (and
		(not (push-to-nongoal-lock ?p ?s ?ppos ?from ?to ?dir))
		(unlock-origin-domain )
		(not (at-copy ?p ?ppos))
		(not (at-copy ?s ?from))
		(not (clear-copy ?to))
		(at-copy ?p ?from)
		(at-copy ?s ?to)
		(clear-copy ?ppos)
		(not (at-goal-copy ?s))(increase (total-cost ) 1)))

(:action push-to-goal-stop-0
	:parameters (?p - player
		?s - stone
		?ppos - location
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(not (at-copy ?p ?ppos))
		(push-to-goal-lock ?p ?s ?ppos ?from ?to ?dir))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action push-to-goal-stop-1
	:parameters (?p - player
		?s - stone
		?ppos - location
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(not (at-copy ?s ?from))
		(push-to-goal-lock ?p ?s ?ppos ?from ?to ?dir))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action push-to-goal-stop-2
	:parameters (?p - player
		?s - stone
		?ppos - location
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(not (clear-copy ?to))
		(push-to-goal-lock ?p ?s ?ppos ?from ?to ?dir))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action push-to-goal-stop-3
	:parameters (?p - player
		?s - stone
		?ppos - location
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(not (move-dir-copy ?ppos ?from ?dir))
		(push-to-goal-lock ?p ?s ?ppos ?from ?to ?dir))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action push-to-goal-stop-4
	:parameters (?p - player
		?s - stone
		?ppos - location
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(not (move-dir-copy ?from ?to ?dir))
		(push-to-goal-lock ?p ?s ?ppos ?from ?to ?dir))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action push-to-goal-stop-5
	:parameters (?p - player
		?s - stone
		?ppos - location
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(not (is-goal-copy ?to))
		(push-to-goal-lock ?p ?s ?ppos ?from ?to ?dir))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action push-to-goal-copy
	:parameters (?p - player
		?s - stone
		?ppos - location
		?from - location
		?to - location
		?dir - direction)
	:precondition (and
		(push-to-goal-lock ?p ?s ?ppos ?from ?to ?dir)
		(at-copy ?p ?ppos)
		(at-copy ?s ?from)
		(clear-copy ?to)
		(move-dir-copy ?ppos ?from ?dir)
		(move-dir-copy ?from ?to ?dir)
		(is-goal-copy ?to))
	:effect (and
		(not (push-to-goal-lock ?p ?s ?ppos ?from ?to ?dir))
		(unlock-origin-domain )
		(not (at-copy ?p ?ppos))
		(not (at-copy ?s ?from))
		(not (clear-copy ?to))
		(at-copy ?p ?from)
		(at-copy ?s ?to)
		(clear-copy ?ppos)
		(at-goal-copy ?s)(increase (total-cost ) 1)))

(:action turning
	:parameters ()
	:precondition (and
		(invalid ))
	:effect (and
		(unlock-origin-domain )(increase (total-cost ) 1))) )