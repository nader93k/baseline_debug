(define (domain floor-tile)
(:requirements :typing)
(:types
	object
	robot - object
	tile - object
	color - object)
(:constants )
(:predicates
	(robot-at ?r - robot ?x - tile)
	(up ?x - tile ?y - tile)
	(down ?x - tile ?y - tile)
	(right ?x - tile ?y - tile)
	(left ?x - tile ?y - tile)
	(clear ?x - tile)
	(painted ?x - tile ?c - color)
	(robot-has ?r - robot ?c - color)
	(available-color ?c - color)
	(free-color ?r - robot)
	(= ?x - object ?y - object)
	(robot-at-copy ?r - robot ?x - tile)
	(up-copy ?x - tile ?y - tile)
	(down-copy ?x - tile ?y - tile)
	(right-copy ?x - tile ?y - tile)
	(left-copy ?x - tile ?y - tile)
	(clear-copy ?x - tile)
	(painted-copy ?x - tile ?c - color)
	(robot-has-copy ?r - robot ?c - color)
	(available-color-copy ?c - color)
	(free-color-copy ?r - robot)
	(=-copy ?x - object ?y - object)
	(invalid )
	(unlock-origin-domain )
	(change-color-lock ?r - robot ?c - color ?c2 - color)
	(paint-up-lock ?r - robot ?y - tile ?x - tile ?c - color)
	(paint-down-lock ?r - robot ?y - tile ?x - tile ?c - color)
	(up-lock ?r - robot ?x - tile ?y - tile)
	(down-lock ?r - robot ?x - tile ?y - tile)
	(right-lock ?r - robot ?x - tile ?y - tile)
	(left-lock ?r - robot ?x - tile ?y - tile))
(:functions (total-cost ))
(:action change-color
	:parameters (?r - robot
		?c - color
		?c2 - color)
	:precondition (and
		(robot-has ?r ?c)
		(available-color ?c2)
		(unlock-origin-domain ))
	:effect (and
		(not (robot-has ?r ?c))
		(robot-has ?r ?c2)
		(change-color-lock ?r ?c ?c2)
		(not (unlock-origin-domain ))(increase (total-cost ) 5)))

(:action paint-up
	:parameters (?r - robot
		?y - tile
		?x - tile
		?c - color)
	:precondition (and
		(robot-has ?r ?c)
		(robot-at ?r ?x)
		(up ?y ?x)
		(clear ?y)
		(unlock-origin-domain ))
	:effect (and
		(not (clear ?y))
		(painted ?y ?c)
		(paint-up-lock ?r ?y ?x ?c)
		(not (unlock-origin-domain ))(increase (total-cost ) 2)))

(:action paint-down
	:parameters (?r - robot
		?y - tile
		?x - tile
		?c - color)
	:precondition (and
		(robot-has ?r ?c)
		(robot-at ?r ?x)
		(down ?y ?x)
		(clear ?y)
		(unlock-origin-domain ))
	:effect (and
		(not (clear ?y))
		(painted ?y ?c)
		(paint-down-lock ?r ?y ?x ?c)
		(not (unlock-origin-domain ))(increase (total-cost ) 2)))

(:action up
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(robot-at ?r ?x)
		(up ?y ?x)
		(clear ?y)
		(unlock-origin-domain ))
	:effect (and
		(robot-at ?r ?y)
		(not (robot-at ?r ?x))
		(clear ?x)
		(not (clear ?y))
		(up-lock ?r ?x ?y)
		(not (unlock-origin-domain ))(increase (total-cost ) 3)))

(:action down
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(robot-at ?r ?x)
		(down ?y ?x)
		(clear ?y)
		(unlock-origin-domain ))
	:effect (and
		(robot-at ?r ?y)
		(not (robot-at ?r ?x))
		(clear ?x)
		(not (clear ?y))
		(down-lock ?r ?x ?y)
		(not (unlock-origin-domain ))(increase (total-cost ) 1)))

(:action right
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(robot-at ?r ?x)
		(right ?y ?x)
		(clear ?y)
		(unlock-origin-domain ))
	:effect (and
		(robot-at ?r ?y)
		(not (robot-at ?r ?x))
		(clear ?x)
		(not (clear ?y))
		(right-lock ?r ?x ?y)
		(not (unlock-origin-domain ))(increase (total-cost ) 1)))

(:action left
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(robot-at ?r ?x)
		(left ?y ?x)
		(clear ?y)
		(unlock-origin-domain ))
	:effect (and
		(robot-at ?r ?y)
		(not (robot-at ?r ?x))
		(clear ?x)
		(not (clear ?y))
		(left-lock ?r ?x ?y)
		(not (unlock-origin-domain ))(increase (total-cost ) 1)))

(:action change-color-stop-0
	:parameters (?r - robot
		?c - color
		?c2 - color)
	:precondition (and
		(not (robot-has-copy ?r ?c))
		(change-color-lock ?r ?c ?c2))
	:effect (and
		(invalid )(increase (total-cost ) 5)))

(:action change-color-stop-1
	:parameters (?r - robot
		?c - color
		?c2 - color)
	:precondition (and
		(not (available-color-copy ?c2))
		(change-color-lock ?r ?c ?c2))
	:effect (and
		(invalid )(increase (total-cost ) 5)))

(:action change-color-copy
	:parameters (?r - robot
		?c - color
		?c2 - color)
	:precondition (and
		(change-color-lock ?r ?c ?c2)
		(robot-has-copy ?r ?c)
		(available-color-copy ?c2))
	:effect (and
		(not (change-color-lock ?r ?c ?c2))
		(unlock-origin-domain )
		(not (robot-has-copy ?r ?c))
		(robot-has-copy ?r ?c2)(increase (total-cost ) 5)))

(:action paint-up-stop-0
	:parameters (?r - robot
		?y - tile
		?x - tile
		?c - color)
	:precondition (and
		(not (robot-has-copy ?r ?c))
		(paint-up-lock ?r ?y ?x ?c))
	:effect (and
		(invalid )(increase (total-cost ) 2)))

(:action paint-up-stop-1
	:parameters (?r - robot
		?y - tile
		?x - tile
		?c - color)
	:precondition (and
		(not (robot-at-copy ?r ?x))
		(paint-up-lock ?r ?y ?x ?c))
	:effect (and
		(invalid )(increase (total-cost ) 2)))

(:action paint-up-stop-2
	:parameters (?r - robot
		?y - tile
		?x - tile
		?c - color)
	:precondition (and
		(not (clear-copy ?y))
		(paint-up-lock ?r ?y ?x ?c))
	:effect (and
		(invalid )(increase (total-cost ) 2)))

(:action paint-up-copy
	:parameters (?r - robot
		?y - tile
		?x - tile
		?c - color)
	:precondition (and
		(paint-up-lock ?r ?y ?x ?c)
		(robot-has-copy ?r ?c)
		(robot-at-copy ?r ?x)
		(clear-copy ?y))
	:effect (and
		(not (paint-up-lock ?r ?y ?x ?c))
		(unlock-origin-domain )
		(not (clear-copy ?y))
		(painted-copy ?y ?c)(increase (total-cost ) 2)))

(:action paint-down-stop-0
	:parameters (?r - robot
		?y - tile
		?x - tile
		?c - color)
	:precondition (and
		(not (robot-has-copy ?r ?c))
		(paint-down-lock ?r ?y ?x ?c))
	:effect (and
		(invalid )(increase (total-cost ) 2)))

(:action paint-down-stop-1
	:parameters (?r - robot
		?y - tile
		?x - tile
		?c - color)
	:precondition (and
		(not (robot-at-copy ?r ?x))
		(paint-down-lock ?r ?y ?x ?c))
	:effect (and
		(invalid )(increase (total-cost ) 2)))

(:action paint-down-stop-2
	:parameters (?r - robot
		?y - tile
		?x - tile
		?c - color)
	:precondition (and
		(not (down-copy ?y ?x))
		(paint-down-lock ?r ?y ?x ?c))
	:effect (and
		(invalid )(increase (total-cost ) 2)))

(:action paint-down-stop-3
	:parameters (?r - robot
		?y - tile
		?x - tile
		?c - color)
	:precondition (and
		(not (clear-copy ?y))
		(paint-down-lock ?r ?y ?x ?c))
	:effect (and
		(invalid )(increase (total-cost ) 2)))

(:action paint-down-copy
	:parameters (?r - robot
		?y - tile
		?x - tile
		?c - color)
	:precondition (and
		(paint-down-lock ?r ?y ?x ?c)
		(robot-has-copy ?r ?c)
		(robot-at-copy ?r ?x)
		(down-copy ?y ?x)
		(clear-copy ?y))
	:effect (and
		(not (paint-down-lock ?r ?y ?x ?c))
		(unlock-origin-domain )
		(not (clear-copy ?y))
		(painted-copy ?y ?c)
		(not (down-copy ?y ?x))(increase (total-cost ) 2)))

(:action up-stop-0
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(not (robot-at-copy ?r ?x))
		(up-lock ?r ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action up-stop-1
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(not (up-copy ?y ?x))
		(up-lock ?r ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action up-stop-2
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(not (clear-copy ?y))
		(up-lock ?r ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action up-copy
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(up-lock ?r ?x ?y)
		(robot-at-copy ?r ?x)
		(up-copy ?y ?x)
		(clear-copy ?y))
	:effect (and
		(not (up-lock ?r ?x ?y))
		(unlock-origin-domain )
		(robot-at-copy ?r ?y)
		(not (robot-at-copy ?r ?x))
		(clear-copy ?x)
		(not (clear-copy ?y))(increase (total-cost ) 3)))

(:action down-stop-0
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(not (robot-at-copy ?r ?x))
		(down-lock ?r ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action down-stop-1
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(not (down-copy ?y ?x))
		(down-lock ?r ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action down-stop-2
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(not (clear-copy ?y))
		(down-lock ?r ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action down-copy
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(down-lock ?r ?x ?y)
		(robot-at-copy ?r ?x)
		(down-copy ?y ?x)
		(clear-copy ?y))
	:effect (and
		(not (down-lock ?r ?x ?y))
		(unlock-origin-domain )
		(robot-at-copy ?r ?y)
		(not (robot-at-copy ?r ?x))
		(clear-copy ?x)
		(not (clear-copy ?y))(increase (total-cost ) 1)))

(:action right-stop-0
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(not (robot-at-copy ?r ?x))
		(right-lock ?r ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action right-stop-1
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(not (right-copy ?y ?x))
		(right-lock ?r ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action right-stop-2
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(not (clear-copy ?y))
		(right-lock ?r ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action right-copy
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(right-lock ?r ?x ?y)
		(robot-at-copy ?r ?x)
		(right-copy ?y ?x)
		(clear-copy ?y))
	:effect (and
		(not (right-lock ?r ?x ?y))
		(unlock-origin-domain )
		(robot-at-copy ?r ?y)
		(not (robot-at-copy ?r ?x))
		(clear-copy ?x)
		(not (clear-copy ?y))
		(up-copy ?y ?y)(increase (total-cost ) 1)))

(:action left-stop-0
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(not (robot-at-copy ?r ?x))
		(left-lock ?r ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action left-stop-1
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(not (left-copy ?y ?x))
		(left-lock ?r ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action left-stop-2
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(not (clear-copy ?y))
		(left-lock ?r ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action left-copy
	:parameters (?r - robot
		?x - tile
		?y - tile)
	:precondition (and
		(left-lock ?r ?x ?y)
		(robot-at-copy ?r ?x)
		(left-copy ?y ?x)
		(clear-copy ?y))
	:effect (and
		(not (left-lock ?r ?x ?y))
		(unlock-origin-domain )
		(robot-at-copy ?r ?y)
		(not (robot-at-copy ?r ?x))
		(not (clear-copy ?y))(increase (total-cost ) 1)))

(:action turning
	:parameters ()
	:precondition (and
		(invalid ))
	:effect (and
		(unlock-origin-domain )(increase (total-cost ) 1))) )