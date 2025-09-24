(define (domain tetris)
(:requirements :typing :equality :negative-preconditions :action-costs)
(:types
	object
	position - object
	pieces - object
	one_square - pieces
	two_straight - pieces
	right_l - pieces)
(:constants )
(:predicates
	(clear ?xy - position)
	(connected ?x - position ?y - position)
	(at_square ?element - one_square ?xy - position)
	(at_two ?element - two_straight ?xy - position ?xy2 - position)
	(at_right_l ?element - right_l ?xy - position ?xy2 - position ?xy3 - position)
	(= ?x - object ?y - object)
	(clear-copy ?xy - position)
	(connected-copy ?x - position ?y - position)
	(at_square-copy ?element - one_square ?xy - position)
	(at_two-copy ?element - two_straight ?xy - position ?xy2 - position)
	(at_right_l-copy ?element - right_l ?xy - position ?xy2 - position ?xy3 - position)
	(=-copy ?x - object ?y - object)
	(invalid )
	(unlock-origin-domain )
	(move_square-lock ?xy_initial - position ?xy_final - position ?element - one_square)
	(move_two-lock ?xy_initial1 - position ?xy_initial2 - position ?xy_final - position ?element - two_straight)
	(move_l_right-lock ?xy_initial1 - position ?xy_initial2 - position ?xy_initial3 - position ?xy_final - position ?xy_final2 - position ?xy_between_final - position ?element - right_l)
	(move_l_left-lock ?xy_initial1 - position ?xy_initial2 - position ?xy_initial3 - position ?xy_final - position ?xy_final2 - position ?element - right_l)
	(move_l_up-lock ?xy_initial1 - position ?xy_initial2 - position ?xy_initial3 - position ?xy_final - position ?xy_final2 - position ?xy_between_final - position ?element - right_l)
	(move_l_down-lock ?xy_initial1 - position ?xy_initial2 - position ?xy_initial3 - position ?xy_final - position ?xy_final2 - position ?element - right_l))
(:functions (total-cost ))
(:action move_square
	:parameters (?xy_initial - position
		?xy_final - position
		?element - one_square)
	:precondition (and
		(clear ?xy_final)
		(at_square ?element ?xy_initial)
		(connected ?xy_initial ?xy_final)
		(connected ?xy_final ?xy_initial)
		(unlock-origin-domain ))
	:effect (and
		(clear ?xy_initial)
		(at_square ?element ?xy_final)
		(not (clear ?xy_final))
		(not (at_square ?element ?xy_initial))
		(move_square-lock ?xy_initial ?xy_final ?element)
		(not (unlock-origin-domain ))(increase (total-cost ) 1)))

(:action move_two
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_final - position
		?element - two_straight)
	:precondition (and
		(clear ?xy_final)
		(at_two ?element ?xy_initial1 ?xy_initial2)
		(connected ?xy_initial2 ?xy_final)
		(unlock-origin-domain ))
	:effect (and
		(clear ?xy_initial1)
		(at_two ?element ?xy_initial2 ?xy_final)
		(not (clear ?xy_final))
		(not (at_two ?element ?xy_initial1 ?xy_initial2))
		(move_two-lock ?xy_initial1 ?xy_initial2 ?xy_final ?element)
		(not (unlock-origin-domain ))(increase (total-cost ) 2)))

(:action move_l_right
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(clear ?xy_final)
		(clear ?xy_final2)
		(at_right_l ?element ?xy_initial1 ?xy_initial2 ?xy_initial3)
		(connected ?xy_initial1 ?xy_final)
		(connected ?xy_initial3 ?xy_final2)
		(connected ?xy_initial3 ?xy_final)
		(connected ?xy_final ?xy_between_final)
		(connected ?xy_final2 ?xy_between_final)
		(not (= ?xy_final ?xy_final2))
		(not (= ?xy_between_final ?xy_initial3))
		(not (connected ?xy_initial1 ?xy_final2))
		(unlock-origin-domain ))
	:effect (and
		(clear ?xy_initial2)
		(clear ?xy_initial1)
		(at_right_l ?element ?xy_final ?xy_initial3 ?xy_final2)
		(not (clear ?xy_final))
		(not (clear ?xy_final2))
		(not (at_right_l ?element ?xy_initial1 ?xy_initial2 ?xy_initial3))
		(move_l_right-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element)
		(not (unlock-origin-domain ))(increase (total-cost ) 3)))

(:action move_l_left
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?element - right_l)
	:precondition (and
		(clear ?xy_final)
		(clear ?xy_final2)
		(at_right_l ?element ?xy_initial1 ?xy_initial2 ?xy_initial3)
		(connected ?xy_initial1 ?xy_final)
		(connected ?xy_initial2 ?xy_final2)
		(connected ?xy_final2 ?xy_final)
		(not (= ?xy_final ?xy_final2))
		(unlock-origin-domain ))
	:effect (and
		(clear ?xy_initial3)
		(clear ?xy_initial1)
		(at_right_l ?element ?xy_final ?xy_final2 ?xy_initial2)
		(not (clear ?xy_final))
		(not (clear ?xy_final2))
		(not (at_right_l ?element ?xy_initial1 ?xy_initial2 ?xy_initial3))
		(move_l_left-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element)
		(not (unlock-origin-domain ))(increase (total-cost ) 3)))

(:action move_l_up
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(clear ?xy_final)
		(clear ?xy_final2)
		(at_right_l ?element ?xy_initial1 ?xy_initial2 ?xy_initial3)
		(connected ?xy_initial1 ?xy_final)
		(connected ?xy_initial3 ?xy_final2)
		(connected ?xy_initial1 ?xy_final2)
		(connected ?xy_final ?xy_between_final)
		(connected ?xy_final2 ?xy_between_final)
		(not (= ?xy_final ?xy_final2))
		(not (= ?xy_between_final ?xy_initial1))
		(not (connected ?xy_initial3 ?xy_final))
		(unlock-origin-domain ))
	:effect (and
		(clear ?xy_initial2)
		(clear ?xy_initial3)
		(at_right_l ?element ?xy_final ?xy_initial1 ?xy_final2)
		(not (clear ?xy_final))
		(not (clear ?xy_final2))
		(not (at_right_l ?element ?xy_initial1 ?xy_initial2 ?xy_initial3))
		(move_l_up-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element)
		(not (unlock-origin-domain ))(increase (total-cost ) 3)))

(:action move_l_down
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?element - right_l)
	:precondition (and
		(clear ?xy_final)
		(clear ?xy_final2)
		(at_right_l ?element ?xy_initial1 ?xy_initial2 ?xy_initial3)
		(connected ?xy_initial2 ?xy_final)
		(connected ?xy_initial3 ?xy_final2)
		(connected ?xy_final2 ?xy_final)
		(not (= ?xy_final ?xy_final2))
		(unlock-origin-domain ))
	:effect (and
		(clear ?xy_initial3)
		(clear ?xy_initial1)
		(at_right_l ?element ?xy_initial2 ?xy_final ?xy_final2)
		(not (clear ?xy_final))
		(not (clear ?xy_final2))
		(not (at_right_l ?element ?xy_initial1 ?xy_initial2 ?xy_initial3))
		(move_l_down-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element)
		(not (unlock-origin-domain ))(increase (total-cost ) 3)))

(:action move_square-stop-0
	:parameters (?xy_initial - position
		?xy_final - position
		?element - one_square)
	:precondition (and
		(not (clear-copy ?xy_final))
		(move_square-lock ?xy_initial ?xy_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action move_square-stop-1
	:parameters (?xy_initial - position
		?xy_final - position
		?element - one_square)
	:precondition (and
		(not (at_square-copy ?element ?xy_initial))
		(move_square-lock ?xy_initial ?xy_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action move_square-stop-2
	:parameters (?xy_initial - position
		?xy_final - position
		?element - one_square)
	:precondition (and
		(not (connected-copy ?xy_initial ?xy_final))
		(move_square-lock ?xy_initial ?xy_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action move_square-stop-3
	:parameters (?xy_initial - position
		?xy_final - position
		?element - one_square)
	:precondition (and
		(not (connected-copy ?xy_final ?xy_initial))
		(move_square-lock ?xy_initial ?xy_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action move_square-copy
	:parameters (?xy_initial - position
		?xy_final - position
		?element - one_square)
	:precondition (and
		(move_square-lock ?xy_initial ?xy_final ?element)
		(clear-copy ?xy_final)
		(at_square-copy ?element ?xy_initial)
		(connected-copy ?xy_initial ?xy_final)
		(connected-copy ?xy_final ?xy_initial))
	:effect (and
		(not (move_square-lock ?xy_initial ?xy_final ?element))
		(unlock-origin-domain )
		(clear-copy ?xy_initial)
		(at_square-copy ?element ?xy_final)
		(not (clear-copy ?xy_final))
		(not (at_square-copy ?element ?xy_initial))
		(connected-copy ?xy_initial ?xy_final)(increase (total-cost ) 1)))

(:action move_two-stop-0
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_final - position
		?element - two_straight)
	:precondition (and
		(not (clear-copy ?xy_final))
		(move_two-lock ?xy_initial1 ?xy_initial2 ?xy_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 2)))

(:action move_two-stop-1
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_final - position
		?element - two_straight)
	:precondition (and
		(not (at_two-copy ?element ?xy_initial1 ?xy_initial2))
		(move_two-lock ?xy_initial1 ?xy_initial2 ?xy_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 2)))

(:action move_two-stop-2
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_final - position
		?element - two_straight)
	:precondition (and
		(not (connected-copy ?xy_initial2 ?xy_final))
		(move_two-lock ?xy_initial1 ?xy_initial2 ?xy_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 2)))

(:action move_two-copy
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_final - position
		?element - two_straight)
	:precondition (and
		(move_two-lock ?xy_initial1 ?xy_initial2 ?xy_final ?element)
		(clear-copy ?xy_final)
		(at_two-copy ?element ?xy_initial1 ?xy_initial2)
		(connected-copy ?xy_initial2 ?xy_final))
	:effect (and
		(not (move_two-lock ?xy_initial1 ?xy_initial2 ?xy_final ?element))
		(unlock-origin-domain )
		(clear-copy ?xy_initial1)
		(at_two-copy ?element ?xy_initial2 ?xy_final)
		(not (clear-copy ?xy_final))
		(not (at_two-copy ?element ?xy_initial1 ?xy_initial2))(increase (total-cost ) 2)))

(:action move_l_right-stop-0
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(not (clear-copy ?xy_final))
		(move_l_right-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_right-stop-1
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(not (clear-copy ?xy_final2))
		(move_l_right-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_right-stop-2
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(not (at_right_l-copy ?element ?xy_initial1 ?xy_initial2 ?xy_initial3))
		(move_l_right-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_right-stop-3
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(not (connected-copy ?xy_initial1 ?xy_final))
		(move_l_right-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_right-stop-4
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(not (connected-copy ?xy_initial3 ?xy_final2))
		(move_l_right-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_right-stop-5
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(not (connected-copy ?xy_initial3 ?xy_final))
		(move_l_right-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_right-stop-6
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(not (connected-copy ?xy_final ?xy_between_final))
		(move_l_right-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_right-stop-7
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(not (connected-copy ?xy_final2 ?xy_between_final))
		(move_l_right-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_right-stop-8
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(=-copy ?xy_final ?xy_final2)
		(move_l_right-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_right-stop-9
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(=-copy ?xy_between_final ?xy_initial3)
		(move_l_right-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_right-stop-10
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(connected-copy ?xy_initial1 ?xy_final2)
		(move_l_right-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_right-copy
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(move_l_right-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element)
		(clear-copy ?xy_final)
		(clear-copy ?xy_final2)
		(at_right_l-copy ?element ?xy_initial1 ?xy_initial2 ?xy_initial3)
		(connected-copy ?xy_initial1 ?xy_final)
		(connected-copy ?xy_initial3 ?xy_final2)
		(connected-copy ?xy_initial3 ?xy_final)
		(connected-copy ?xy_final ?xy_between_final)
		(connected-copy ?xy_final2 ?xy_between_final)
		(not (=-copy ?xy_final ?xy_final2))
		(not (=-copy ?xy_between_final ?xy_initial3))
		(not (connected-copy ?xy_initial1 ?xy_final2)))
	:effect (and
		(not (move_l_right-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
		(unlock-origin-domain )
		(clear-copy ?xy_initial2)
		(clear-copy ?xy_initial1)
		(at_right_l-copy ?element ?xy_final ?xy_initial3 ?xy_final2)
		(not (clear-copy ?xy_final))
		(not (clear-copy ?xy_final2))
		(not (at_right_l-copy ?element ?xy_initial1 ?xy_initial2 ?xy_initial3))(increase (total-cost ) 3)))

(:action move_l_left-stop-0
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?element - right_l)
	:precondition (and
		(not (clear-copy ?xy_final))
		(move_l_left-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_left-stop-1
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?element - right_l)
	:precondition (and
		(not (clear-copy ?xy_final2))
		(move_l_left-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_left-stop-2
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?element - right_l)
	:precondition (and
		(not (at_right_l-copy ?element ?xy_initial1 ?xy_initial2 ?xy_initial3))
		(move_l_left-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_left-stop-3
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?element - right_l)
	:precondition (and
		(not (connected-copy ?xy_initial1 ?xy_final))
		(move_l_left-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_left-stop-4
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?element - right_l)
	:precondition (and
		(not (connected-copy ?xy_initial2 ?xy_final2))
		(move_l_left-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_left-stop-5
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?element - right_l)
	:precondition (and
		(not (connected-copy ?xy_final2 ?xy_final))
		(move_l_left-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_left-stop-6
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?element - right_l)
	:precondition (and
		(=-copy ?xy_final ?xy_final2)
		(move_l_left-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_left-copy
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?element - right_l)
	:precondition (and
		(move_l_left-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element)
		(clear-copy ?xy_final)
		(clear-copy ?xy_final2)
		(at_right_l-copy ?element ?xy_initial1 ?xy_initial2 ?xy_initial3)
		(connected-copy ?xy_initial1 ?xy_final)
		(connected-copy ?xy_initial2 ?xy_final2)
		(connected-copy ?xy_final2 ?xy_final)
		(not (=-copy ?xy_final ?xy_final2)))
	:effect (and
		(not (move_l_left-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element))
		(unlock-origin-domain )
		(clear-copy ?xy_initial1)
		(at_right_l-copy ?element ?xy_final ?xy_final2 ?xy_initial2)
		(not (clear-copy ?xy_final))
		(not (clear-copy ?xy_final2))(increase (total-cost ) 3)))

(:action move_l_up-stop-0
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(not (clear-copy ?xy_final))
		(move_l_up-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_up-stop-1
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(not (clear-copy ?xy_final2))
		(move_l_up-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_up-stop-2
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(not (at_right_l-copy ?element ?xy_initial1 ?xy_initial2 ?xy_initial3))
		(move_l_up-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_up-stop-3
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(not (connected-copy ?xy_initial1 ?xy_final))
		(move_l_up-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_up-stop-4
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(not (connected-copy ?xy_initial3 ?xy_final2))
		(move_l_up-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_up-stop-5
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(not (connected-copy ?xy_initial1 ?xy_final2))
		(move_l_up-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_up-stop-6
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(not (connected-copy ?xy_final ?xy_between_final))
		(move_l_up-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_up-stop-7
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(not (connected-copy ?xy_final2 ?xy_between_final))
		(move_l_up-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_up-stop-8
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(=-copy ?xy_final ?xy_final2)
		(move_l_up-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_up-stop-9
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(=-copy ?xy_between_final ?xy_initial1)
		(move_l_up-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_up-stop-10
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(connected-copy ?xy_initial3 ?xy_final)
		(move_l_up-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_up-stop-11
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(at_right_l-copy ?element ?xy_final ?xy_initial3 ?xy_initial2)
		(move_l_up-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_up-copy
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?xy_between_final - position
		?element - right_l)
	:precondition (and
		(move_l_up-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element)
		(clear-copy ?xy_final)
		(clear-copy ?xy_final2)
		(at_right_l-copy ?element ?xy_initial1 ?xy_initial2 ?xy_initial3)
		(connected-copy ?xy_initial1 ?xy_final)
		(connected-copy ?xy_initial3 ?xy_final2)
		(connected-copy ?xy_initial1 ?xy_final2)
		(connected-copy ?xy_final ?xy_between_final)
		(connected-copy ?xy_final2 ?xy_between_final)
		(not (=-copy ?xy_final ?xy_final2))
		(not (=-copy ?xy_between_final ?xy_initial1))
		(not (connected-copy ?xy_initial3 ?xy_final))
		(not (at_right_l-copy ?element ?xy_final ?xy_initial3 ?xy_initial2)))
	:effect (and
		(not (move_l_up-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?xy_between_final ?element))
		(unlock-origin-domain )
		(clear-copy ?xy_initial2)
		(clear-copy ?xy_initial3)
		(at_right_l-copy ?element ?xy_final ?xy_initial1 ?xy_final2)
		(not (clear-copy ?xy_final))
		(not (clear-copy ?xy_final2))
		(not (at_right_l-copy ?element ?xy_initial1 ?xy_initial2 ?xy_initial3))(increase (total-cost ) 3)))

(:action move_l_down-stop-0
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?element - right_l)
	:precondition (and
		(not (clear-copy ?xy_final))
		(move_l_down-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_down-stop-1
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?element - right_l)
	:precondition (and
		(not (clear-copy ?xy_final2))
		(move_l_down-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_down-stop-2
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?element - right_l)
	:precondition (and
		(not (at_right_l-copy ?element ?xy_initial1 ?xy_initial2 ?xy_initial3))
		(move_l_down-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_down-stop-3
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?element - right_l)
	:precondition (and
		(not (connected-copy ?xy_initial2 ?xy_final))
		(move_l_down-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_down-stop-4
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?element - right_l)
	:precondition (and
		(not (connected-copy ?xy_initial3 ?xy_final2))
		(move_l_down-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_down-stop-5
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?element - right_l)
	:precondition (and
		(not (connected-copy ?xy_final2 ?xy_final))
		(move_l_down-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_down-stop-6
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?element - right_l)
	:precondition (and
		(=-copy ?xy_final ?xy_final2)
		(move_l_down-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element))
	:effect (and
		(invalid )(increase (total-cost ) 3)))

(:action move_l_down-copy
	:parameters (?xy_initial1 - position
		?xy_initial2 - position
		?xy_initial3 - position
		?xy_final - position
		?xy_final2 - position
		?element - right_l)
	:precondition (and
		(move_l_down-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element)
		(clear-copy ?xy_final)
		(clear-copy ?xy_final2)
		(at_right_l-copy ?element ?xy_initial1 ?xy_initial2 ?xy_initial3)
		(connected-copy ?xy_initial2 ?xy_final)
		(connected-copy ?xy_initial3 ?xy_final2)
		(connected-copy ?xy_final2 ?xy_final)
		(not (=-copy ?xy_final ?xy_final2)))
	:effect (and
		(not (move_l_down-lock ?xy_initial1 ?xy_initial2 ?xy_initial3 ?xy_final ?xy_final2 ?element))
		(unlock-origin-domain )
		(clear-copy ?xy_initial3)
		(clear-copy ?xy_initial1)
		(at_right_l-copy ?element ?xy_initial2 ?xy_final ?xy_final2)
		(not (clear-copy ?xy_final))
		(not (clear-copy ?xy_final2))
		(not (at_right_l-copy ?element ?xy_initial1 ?xy_initial2 ?xy_initial3))(increase (total-cost ) 3)))

(:action turning
	:parameters ()
	:precondition (and
		(invalid ))
	:effect (and
		(unlock-origin-domain )(increase (total-cost ) 3))) )