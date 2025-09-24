(define (domain thoughtful-typed)
(:requirements :typing)
(:types
	object
	object - object
	card - object
	colnum - object
	num - object
	suittype - object)
(:constants )
(:predicates
	(on ?c1 - card ?c2 - card)
	(ace ?c - card)
	(king ?c - card)
	(clear ?c - card)
	(colspace ?n - colnum)
	(bottomtalon ?c - card)
	(toptalon ?c - card)
	(ontalon ?c1 - card ?c2 - card)
	(talonplayable ?c - card)
	(instack ?c - card)
	(home ?c - card)
	(faceup ?c - card)
	(bottomcol ?c - card)
	(suit ?c - card ?s - suittype)
	(value ?c - card ?v - num)
	(successor ?n1 - num ?n0 - num)
	(canstack ?c1 - card ?c2 - card)
	(colsuccessor ?n1 - colnum ?n0 - colnum)
	(= ?x - object ?y - object)
	(= ?x - object ?y - object)
	(on-copy ?c1 - card ?c2 - card)
	(ace-copy ?c - card)
	(king-copy ?c - card)
	(clear-copy ?c - card)
	(colspace-copy ?n - colnum)
	(bottomtalon-copy ?c - card)
	(toptalon-copy ?c - card)
	(ontalon-copy ?c1 - card ?c2 - card)
	(talonplayable-copy ?c - card)
	(instack-copy ?c - card)
	(home-copy ?c - card)
	(faceup-copy ?c - card)
	(bottomcol-copy ?c - card)
	(suit-copy ?c - card ?s - suittype)
	(value-copy ?c - card ?v - num)
	(successor-copy ?n1 - num ?n0 - num)
	(canstack-copy ?c1 - card ?c2 - card)
	(colsuccessor-copy ?n1 - colnum ?n0 - colnum)
	(=-copy ?x - object ?y - object)
	(invalid )
	(unlock-origin-domain )
	(move-col-to-col-lock ?card - card ?oldcard - card ?newcard - card)
	(move-col-to-col-b-lock ?card - card ?newcard - card ?cols - colnum ?ncols - colnum)
	(move-col-to-col-c-lock ?card - card ?oldcard - card ?cols - colnum ?ncols - colnum)
	(col-to-home-lock ?card - card ?oldcard - card ?suit - suittype ?vcard - num ?homecard - card ?vhomecard - num)
	(col-to-home-b-lock ?card - card ?homecard - card ?suit - suittype ?vcard - num ?vhomecard - num ?cols - colnum ?ncols - colnum)
	(tal-to-col-lock ?card - card ?oldcard - card ?newcard - card ?cardabove - card)
	(tal-to-col-b-lock ?card - card ?newcard - card ?cardabove - card)
	(tal-to-col-c-lock ?card - card ?newcard - card ?oldcard - card)
	(tal-to-col-d-lock ?card - card ?newcard - card)
	(tal-to-col-e-lock ?card - card ?oldcard - card ?cardabove - card ?cols - colnum ?ncols - colnum)
	(tal-to-col-f-lock ?card - card ?cardabove - card ?cols - colnum ?ncols - colnum)
	(tal-to-col-g-lock ?card - card ?oldcard - card ?cols - colnum ?ncols - colnum)
	(tal-to-col-h-lock ?card - card ?cols - colnum ?ncols - colnum)
	(tal-to-home-lock ?card - card ?cardabove - card ?cardbelow - card ?homecard - card ?cardsuit - suittype ?vcard - num ?vhomecard - num)
	(tal-to-home-b-lock ?card - card ?cardabove - card ?homecard - card ?cardsuit - suittype ?vcard - num ?vhomecard - num)
	(tal-to-home-c-lock ?card - card ?cardbelow - card ?homecard - card ?cardsuit - suittype ?vcard - num ?vhomecard - num)
	(tal-to-home-d-lock ?card - card ?homecard - card ?cardsuit - suittype ?vcard - num ?vhomecard - num)
	(home-to-col-lock ?card - card ?cardbelow - card ?newcard - card ?cardsuit - suittype ?vcard - num ?vcardbelow - num)
	(home-to-col-a-lock ?card - card ?cardbelow - card ?cardsuit - suittype ?vcard - num ?vcardbelow - num ?cols - colnum ?ncols - colnum)
	(turn-deck-lock ?card - card ?c1 - card)
	(turn-deck-a-lock ?card - card ?c1 - card))
(:functions )
(:action move-col-to-col
	:parameters (?card - card
		?oldcard - card
		?newcard - card)
	:precondition (and
		(faceup ?card)
		(clear ?newcard)
		(canstack ?card ?newcard)
		(on ?card ?oldcard)
		(unlock-origin-domain ))
	:effect (and
		(on ?card ?newcard)
		(clear ?oldcard)
		(faceup ?oldcard)
		(not (on ?card ?oldcard))
		(move-col-to-col-lock ?card ?oldcard ?newcard)
		(not (unlock-origin-domain ))))

(:action move-col-to-col-b
	:parameters (?card - card
		?newcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(faceup ?card)
		(bottomcol ?card)
		(clear ?newcard)
		(canstack ?card ?newcard)
		(colspace ?cols)
		(colsuccessor ?ncols ?cols)
		(unlock-origin-domain ))
	:effect (and
		(on ?card ?newcard)
		(colspace ?ncols)
		(not (bottomcol ?card))
		(not (clear ?newcard))
		(not (colspace ?cols))
		(move-col-to-col-b-lock ?card ?newcard ?cols ?ncols)
		(not (unlock-origin-domain ))))

(:action move-col-to-col-c
	:parameters (?card - card
		?oldcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(faceup ?card)
		(king ?card)
		(colspace ?cols)
		(colsuccessor ?cols ?ncols)
		(on ?card ?oldcard)
		(unlock-origin-domain ))
	:effect (and
		(bottomcol ?card)
		(clear ?oldcard)
		(faceup ?oldcard)
		(colspace ?ncols)
		(not (on ?card ?oldcard))
		(move-col-to-col-c-lock ?card ?oldcard ?cols ?ncols)
		(not (unlock-origin-domain ))))

(:action col-to-home
	:parameters (?card - card
		?oldcard - card
		?suit - suittype
		?vcard - num
		?homecard - card
		?vhomecard - num)
	:precondition (and
		(clear ?card)
		(on ?card ?oldcard)
		(home ?homecard)
		(suit ?card ?suit)
		(suit ?homecard ?suit)
		(value ?card ?vcard)
		(value ?homecard ?vhomecard)
		(successor ?vcard ?vhomecard)
		(unlock-origin-domain ))
	:effect (and
		(home ?card)
		(clear ?oldcard)
		(on ?card ?homecard)
		(not (on ?card ?oldcard))
		(not (home ?homecard))
		(not (faceup ?card))
		(not (clear ?card))
		(col-to-home-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard)
		(not (unlock-origin-domain ))))

(:action col-to-home-b
	:parameters (?card - card
		?homecard - card
		?suit - suittype
		?vcard - num
		?vhomecard - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(clear ?card)
		(bottomcol ?card)
		(home ?homecard)
		(suit ?card ?suit)
		(suit ?homecard ?suit)
		(value ?card ?vcard)
		(value ?homecard ?vhomecard)
		(successor ?vcard ?vhomecard)
		(colspace ?cols)
		(colsuccessor ?ncols ?cols)
		(bottomcol ?card)
		(unlock-origin-domain ))
	:effect (and
		(home ?card)
		(colspace ?ncols)
		(not (home ?homecard))
		(not (faceup ?card))
		(not (clear ?card))
		(not (bottomcol ?card))
		(not (colspace ?cols))
		(col-to-home-b-lock ?card ?homecard ?suit ?vcard ?vhomecard ?cols ?ncols)
		(not (unlock-origin-domain ))))

(:action tal-to-col
	:parameters (?card - card
		?oldcard - card
		?newcard - card
		?cardabove - card)
	:precondition (and
		(clear ?newcard)
		(ontalon ?card ?oldcard)
		(ontalon ?cardabove ?card)
		(talonplayable ?card)
		(canstack ?card ?newcard)
		(unlock-origin-domain ))
	:effect (and
		(clear ?card)
		(faceup ?card)
		(talonplayable ?oldcard)
		(on ?card ?newcard)
		(ontalon ?cardabove ?oldcard)
		(not (clear ?newcard))
		(not (talonplayable ?card))
		(not (ontalon ?card ?oldcard))
		(not (ontalon ?cardabove ?card))
		(tal-to-col-lock ?card ?oldcard ?newcard ?cardabove)
		(not (unlock-origin-domain ))))

(:action tal-to-col-b
	:parameters (?card - card
		?newcard - card
		?cardabove - card)
	:precondition (and
		(clear ?newcard)
		(ontalon ?cardabove ?card)
		(talonplayable ?card)
		(bottomtalon ?card)
		(canstack ?card ?newcard)
		(unlock-origin-domain ))
	:effect (and
		(clear ?card)
		(faceup ?card)
		(on ?card ?newcard)
		(bottomtalon ?cardabove)
		(talonplayable ?cardabove)
		(not (bottomtalon ?card))
		(not (talonplayable ?card))
		(not (clear ?newcard))
		(not (ontalon ?cardabove ?card))
		(not (bottomcol ?newcard))
		(tal-to-col-b-lock ?card ?newcard ?cardabove)
		(not (unlock-origin-domain ))))

(:action tal-to-col-c
	:parameters (?card - card
		?newcard - card
		?oldcard - card)
	:precondition (and
		(clear ?newcard)
		(ontalon ?card ?oldcard)
		(canstack ?card ?newcard)
		(talonplayable ?card)
		(toptalon ?card)
		(unlock-origin-domain ))
	:effect (and
		(clear ?card)
		(faceup ?card)
		(on ?card ?newcard)
		(toptalon ?oldcard)
		(talonplayable ?oldcard)
		(not (clear ?newcard))
		(not (toptalon ?card))
		(not (talonplayable ?card))
		(not (ontalon ?card ?oldcard))
		(on ?oldcard ?oldcard)
		(tal-to-col-c-lock ?card ?newcard ?oldcard)
		(not (unlock-origin-domain ))))

(:action tal-to-col-d
	:parameters (?card - card
		?newcard - card)
	:precondition (and
		(clear ?newcard)
		(canstack ?card ?newcard)
		(bottomtalon ?card)
		(toptalon ?card)
		(talonplayable ?card)
		(unlock-origin-domain ))
	:effect (and
		(clear ?card)
		(faceup ?card)
		(on ?card ?newcard)
		(not (clear ?newcard))
		(not (toptalon ?card))
		(not (talonplayable ?card))
		(not (bottomtalon ?card))
		(tal-to-col-d-lock ?card ?newcard)
		(not (unlock-origin-domain ))))

(:action tal-to-col-e
	:parameters (?card - card
		?oldcard - card
		?cardabove - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(ontalon ?card ?oldcard)
		(ontalon ?cardabove ?card)
		(talonplayable ?card)
		(colspace ?cols)
		(colsuccessor ?cols ?ncols)
		(unlock-origin-domain ))
	:effect (and
		(clear ?card)
		(faceup ?card)
		(talonplayable ?oldcard)
		(ontalon ?cardabove ?oldcard)
		(bottomcol ?card)
		(colspace ?ncols)
		(not (colspace ?cols))
		(not (talonplayable ?card))
		(not (ontalon ?card ?oldcard))
		(not (ontalon ?cardabove ?card))
		(tal-to-col-e-lock ?card ?oldcard ?cardabove ?cols ?ncols)
		(not (unlock-origin-domain ))))

(:action tal-to-col-f
	:parameters (?card - card
		?cardabove - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(king ?card)
		(ontalon ?cardabove ?card)
		(talonplayable ?card)
		(bottomtalon ?card)
		(colspace ?cols)
		(colsuccessor ?cols ?ncols)
		(unlock-origin-domain ))
	:effect (and
		(clear ?card)
		(faceup ?card)
		(bottomtalon ?cardabove)
		(talonplayable ?cardabove)
		(bottomcol ?card)
		(colspace ?ncols)
		(not (colspace ?cols))
		(not (bottomtalon ?card))
		(not (talonplayable ?card))
		(not (ontalon ?cardabove ?card))
		(tal-to-col-f-lock ?card ?cardabove ?cols ?ncols)
		(not (unlock-origin-domain ))))

(:action tal-to-col-g
	:parameters (?card - card
		?oldcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(king ?card)
		(ontalon ?card ?oldcard)
		(talonplayable ?card)
		(colspace ?cols)
		(colsuccessor ?cols ?ncols)
		(toptalon ?card)
		(unlock-origin-domain ))
	:effect (and
		(clear ?card)
		(faceup ?card)
		(toptalon ?oldcard)
		(talonplayable ?oldcard)
		(bottomcol ?card)
		(colspace ?ncols)
		(not (colspace ?cols))
		(not (toptalon ?card))
		(not (talonplayable ?card))
		(not (ontalon ?card ?oldcard))
		(tal-to-col-g-lock ?card ?oldcard ?cols ?ncols)
		(not (unlock-origin-domain ))))

(:action tal-to-col-h
	:parameters (?card - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(king ?card)
		(bottomtalon ?card)
		(toptalon ?card)
		(colspace ?cols)
		(colsuccessor ?cols ?ncols)
		(talonplayable ?card)
		(unlock-origin-domain ))
	:effect (and
		(clear ?card)
		(faceup ?card)
		(bottomcol ?card)
		(colspace ?ncols)
		(not (colspace ?cols))
		(not (toptalon ?card))
		(not (talonplayable ?card))
		(not (bottomtalon ?card))
		(tal-to-col-h-lock ?card ?cols ?ncols)
		(not (unlock-origin-domain ))))

(:action tal-to-home
	:parameters (?card - card
		?cardabove - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(talonplayable ?card)
		(ontalon ?cardabove ?card)
		(ontalon ?card ?cardbelow)
		(suit ?card ?cardsuit)
		(suit ?homecard ?cardsuit)
		(home ?homecard)
		(value ?card ?vcard)
		(value ?homecard ?vhomecard)
		(successor ?vcard ?vhomecard)
		(unlock-origin-domain ))
	:effect (and
		(talonplayable ?cardbelow)
		(not (talonplayable ?card))
		(ontalon ?cardabove ?cardbelow)
		(not (ontalon ?cardabove ?card))
		(not (ontalon ?card ?cardbelow))
		(home ?card)
		(not (home ?homecard))
		(tal-to-home-lock ?card ?cardabove ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard)
		(not (unlock-origin-domain ))))

(:action tal-to-home-b
	:parameters (?card - card
		?cardabove - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(talonplayable ?card)
		(ontalon ?cardabove ?card)
		(bottomtalon ?card)
		(home ?homecard)
		(suit ?card ?cardsuit)
		(suit ?homecard ?cardsuit)
		(value ?card ?vcard)
		(value ?homecard ?vhomecard)
		(successor ?vcard ?vhomecard)
		(unlock-origin-domain ))
	:effect (and
		(bottomtalon ?cardabove)
		(talonplayable ?cardabove)
		(home ?card)
		(not (bottomtalon ?card))
		(not (talonplayable ?card))
		(not (ontalon ?cardabove ?card))
		(not (home ?homecard))
		(tal-to-home-b-lock ?card ?cardabove ?homecard ?cardsuit ?vcard ?vhomecard)
		(not (unlock-origin-domain ))))

(:action tal-to-home-c
	:parameters (?card - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(ontalon ?card ?cardbelow)
		(talonplayable ?card)
		(toptalon ?card)
		(home ?homecard)
		(suit ?card ?cardsuit)
		(suit ?homecard ?cardsuit)
		(value ?card ?vcard)
		(value ?homecard ?vhomecard)
		(successor ?vcard ?vhomecard)
		(unlock-origin-domain ))
	:effect (and
		(toptalon ?cardbelow)
		(talonplayable ?cardbelow)
		(home ?card)
		(not (home ?homecard))
		(not (toptalon ?card))
		(not (talonplayable ?card))
		(not (ontalon ?card ?cardbelow))
		(tal-to-home-c-lock ?card ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard)
		(not (unlock-origin-domain ))))

(:action tal-to-home-d
	:parameters (?card - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(bottomtalon ?card)
		(toptalon ?card)
		(talonplayable ?card)
		(home ?homecard)
		(suit ?card ?cardsuit)
		(suit ?homecard ?cardsuit)
		(value ?card ?vcard)
		(value ?homecard ?vhomecard)
		(successor ?vcard ?vhomecard)
		(unlock-origin-domain ))
	:effect (and
		(home ?card)
		(not (home ?homecard))
		(not (toptalon ?card))
		(not (talonplayable ?card))
		(not (bottomtalon ?card))
		(faceup ?homecard)
		(tal-to-home-d-lock ?card ?homecard ?cardsuit ?vcard ?vhomecard)
		(not (unlock-origin-domain ))))

(:action home-to-col
	:parameters (?card - card
		?cardbelow - card
		?newcard - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num)
	:precondition (and
		(home ?card)
		(suit ?card ?cardsuit)
		(suit ?cardbelow ?cardsuit)
		(value ?card ?vcard)
		(value ?cardbelow ?vcardbelow)
		(successor ?vcard ?vcardbelow)
		(canstack ?card ?newcard)
		(clear ?newcard)
		(unlock-origin-domain ))
	:effect (and
		(clear ?card)
		(faceup ?card)
		(home ?cardbelow)
		(on ?card ?newcard)
		(not (home ?card))
		(not (clear ?newcard))
		(not (ace ?card))
		(home-to-col-lock ?card ?cardbelow ?newcard ?cardsuit ?vcard ?vcardbelow)
		(not (unlock-origin-domain ))))

(:action home-to-col-a
	:parameters (?card - card
		?cardbelow - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(home ?card)
		(king ?card)
		(suit ?card ?cardsuit)
		(suit ?cardbelow ?cardsuit)
		(value ?card ?vcard)
		(value ?cardbelow ?vcardbelow)
		(successor ?vcard ?vcardbelow)
		(colspace ?cols)
		(colsuccessor ?cols ?ncols)
		(unlock-origin-domain ))
	:effect (and
		(home ?cardbelow)
		(bottomcol ?card)
		(clear ?card)
		(faceup ?card)
		(colspace ?ncols)
		(not (colspace ?cols))
		(not (home ?card))
		(home-to-col-a-lock ?card ?cardbelow ?cardsuit ?vcard ?vcardbelow ?cols ?ncols)
		(not (unlock-origin-domain ))))

(:action turn-deck
	:parameters (?card - card
		?c1 - card)
	:precondition (and
		(talonplayable ?card)
		(ontalon ?c1 ?card)
		(unlock-origin-domain ))
	:effect (and
		(talonplayable ?c1)
		(not (talonplayable ?card))
		(turn-deck-lock ?card ?c1)
		(not (unlock-origin-domain ))))

(:action turn-deck-a
	:parameters (?card - card
		?c1 - card)
	:precondition (and
		(talonplayable ?card)
		(toptalon ?card)
		(bottomtalon ?c1)
		(unlock-origin-domain ))
	:effect (and
		(talonplayable ?c1)
		(not (talonplayable ?card))
		(not (faceup ?card))
		(turn-deck-a-lock ?card ?c1)
		(not (unlock-origin-domain ))))

(:action move-col-to-col-stop-0
	:parameters (?card - card
		?oldcard - card
		?newcard - card)
	:precondition (and
		(not (faceup-copy ?card))
		(move-col-to-col-lock ?card ?oldcard ?newcard))
	:effect (and
		(invalid )))

(:action move-col-to-col-stop-1
	:parameters (?card - card
		?oldcard - card
		?newcard - card)
	:precondition (and
		(not (clear-copy ?newcard))
		(move-col-to-col-lock ?card ?oldcard ?newcard))
	:effect (and
		(invalid )))

(:action move-col-to-col-stop-2
	:parameters (?card - card
		?oldcard - card
		?newcard - card)
	:precondition (and
		(not (canstack-copy ?card ?newcard))
		(move-col-to-col-lock ?card ?oldcard ?newcard))
	:effect (and
		(invalid )))

(:action move-col-to-col-stop-3
	:parameters (?card - card
		?oldcard - card
		?newcard - card)
	:precondition (and
		(not (on-copy ?card ?oldcard))
		(move-col-to-col-lock ?card ?oldcard ?newcard))
	:effect (and
		(invalid )))

(:action move-col-to-col-copy
	:parameters (?card - card
		?oldcard - card
		?newcard - card)
	:precondition (and
		(move-col-to-col-lock ?card ?oldcard ?newcard)
		(faceup-copy ?card)
		(clear-copy ?newcard)
		(canstack-copy ?card ?newcard)
		(on-copy ?card ?oldcard))
	:effect (and
		(not (move-col-to-col-lock ?card ?oldcard ?newcard))
		(unlock-origin-domain )
		(on-copy ?card ?newcard)
		(clear-copy ?oldcard)
		(faceup-copy ?oldcard)
		(not (on-copy ?card ?oldcard))
		(not (clear-copy ?newcard))))

(:action move-col-to-col-b-stop-0
	:parameters (?card - card
		?newcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (faceup-copy ?card))
		(move-col-to-col-b-lock ?card ?newcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action move-col-to-col-b-stop-1
	:parameters (?card - card
		?newcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (bottomcol-copy ?card))
		(move-col-to-col-b-lock ?card ?newcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action move-col-to-col-b-stop-2
	:parameters (?card - card
		?newcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (clear-copy ?newcard))
		(move-col-to-col-b-lock ?card ?newcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action move-col-to-col-b-stop-3
	:parameters (?card - card
		?newcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (canstack-copy ?card ?newcard))
		(move-col-to-col-b-lock ?card ?newcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action move-col-to-col-b-stop-4
	:parameters (?card - card
		?newcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (colspace-copy ?cols))
		(move-col-to-col-b-lock ?card ?newcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action move-col-to-col-b-stop-5
	:parameters (?card - card
		?newcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (colsuccessor-copy ?ncols ?cols))
		(move-col-to-col-b-lock ?card ?newcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action move-col-to-col-b-copy
	:parameters (?card - card
		?newcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(move-col-to-col-b-lock ?card ?newcard ?cols ?ncols)
		(faceup-copy ?card)
		(bottomcol-copy ?card)
		(clear-copy ?newcard)
		(canstack-copy ?card ?newcard)
		(colspace-copy ?cols)
		(colsuccessor-copy ?ncols ?cols))
	:effect (and
		(not (move-col-to-col-b-lock ?card ?newcard ?cols ?ncols))
		(unlock-origin-domain )
		(on-copy ?card ?newcard)
		(colspace-copy ?ncols)
		(not (bottomcol-copy ?card))
		(not (clear-copy ?newcard))
		(not (colspace-copy ?cols))))

(:action move-col-to-col-c-stop-0
	:parameters (?card - card
		?oldcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (faceup-copy ?card))
		(move-col-to-col-c-lock ?card ?oldcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action move-col-to-col-c-stop-1
	:parameters (?card - card
		?oldcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (king-copy ?card))
		(move-col-to-col-c-lock ?card ?oldcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action move-col-to-col-c-stop-2
	:parameters (?card - card
		?oldcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (colspace-copy ?cols))
		(move-col-to-col-c-lock ?card ?oldcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action move-col-to-col-c-stop-3
	:parameters (?card - card
		?oldcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (colsuccessor-copy ?cols ?ncols))
		(move-col-to-col-c-lock ?card ?oldcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action move-col-to-col-c-stop-4
	:parameters (?card - card
		?oldcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (on-copy ?card ?oldcard))
		(move-col-to-col-c-lock ?card ?oldcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action move-col-to-col-c-copy
	:parameters (?card - card
		?oldcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(move-col-to-col-c-lock ?card ?oldcard ?cols ?ncols)
		(faceup-copy ?card)
		(king-copy ?card)
		(colspace-copy ?cols)
		(colsuccessor-copy ?cols ?ncols)
		(on-copy ?card ?oldcard))
	:effect (and
		(not (move-col-to-col-c-lock ?card ?oldcard ?cols ?ncols))
		(unlock-origin-domain )
		(bottomcol-copy ?card)
		(clear-copy ?oldcard)
		(faceup-copy ?oldcard)
		(colspace-copy ?ncols)
		(not (on-copy ?card ?oldcard))
		(not (colspace-copy ?cols))))

(:action col-to-home-stop-0
	:parameters (?card - card
		?oldcard - card
		?suit - suittype
		?vcard - num
		?homecard - card
		?vhomecard - num)
	:precondition (and
		(not (clear-copy ?card))
		(col-to-home-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard))
	:effect (and
		(invalid )))

(:action col-to-home-stop-1
	:parameters (?card - card
		?oldcard - card
		?suit - suittype
		?vcard - num
		?homecard - card
		?vhomecard - num)
	:precondition (and
		(not (on-copy ?card ?oldcard))
		(col-to-home-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard))
	:effect (and
		(invalid )))

(:action col-to-home-stop-2
	:parameters (?card - card
		?oldcard - card
		?suit - suittype
		?vcard - num
		?homecard - card
		?vhomecard - num)
	:precondition (and
		(not (home-copy ?homecard))
		(col-to-home-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard))
	:effect (and
		(invalid )))

(:action col-to-home-stop-3
	:parameters (?card - card
		?oldcard - card
		?suit - suittype
		?vcard - num
		?homecard - card
		?vhomecard - num)
	:precondition (and
		(not (suit-copy ?card ?suit))
		(col-to-home-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard))
	:effect (and
		(invalid )))

(:action col-to-home-stop-4
	:parameters (?card - card
		?oldcard - card
		?suit - suittype
		?vcard - num
		?homecard - card
		?vhomecard - num)
	:precondition (and
		(not (suit-copy ?homecard ?suit))
		(col-to-home-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard))
	:effect (and
		(invalid )))

(:action col-to-home-stop-5
	:parameters (?card - card
		?oldcard - card
		?suit - suittype
		?vcard - num
		?homecard - card
		?vhomecard - num)
	:precondition (and
		(not (value-copy ?card ?vcard))
		(col-to-home-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard))
	:effect (and
		(invalid )))

(:action col-to-home-stop-6
	:parameters (?card - card
		?oldcard - card
		?suit - suittype
		?vcard - num
		?homecard - card
		?vhomecard - num)
	:precondition (and
		(not (value-copy ?homecard ?vhomecard))
		(col-to-home-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard))
	:effect (and
		(invalid )))

(:action col-to-home-stop-7
	:parameters (?card - card
		?oldcard - card
		?suit - suittype
		?vcard - num
		?homecard - card
		?vhomecard - num)
	:precondition (and
		(not (successor-copy ?vcard ?vhomecard))
		(col-to-home-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard))
	:effect (and
		(invalid )))

(:action col-to-home-copy
	:parameters (?card - card
		?oldcard - card
		?suit - suittype
		?vcard - num
		?homecard - card
		?vhomecard - num)
	:precondition (and
		(col-to-home-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard)
		(clear-copy ?card)
		(on-copy ?card ?oldcard)
		(home-copy ?homecard)
		(suit-copy ?card ?suit)
		(suit-copy ?homecard ?suit)
		(value-copy ?card ?vcard)
		(value-copy ?homecard ?vhomecard)
		(successor-copy ?vcard ?vhomecard))
	:effect (and
		(not (col-to-home-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard))
		(unlock-origin-domain )
		(home-copy ?card)
		(clear-copy ?oldcard)
		(faceup-copy ?oldcard)
		(on-copy ?card ?homecard)
		(not (on-copy ?card ?oldcard))
		(not (home-copy ?homecard))
		(not (faceup-copy ?card))
		(not (clear-copy ?card))))

(:action col-to-home-b-stop-0
	:parameters (?card - card
		?homecard - card
		?suit - suittype
		?vcard - num
		?vhomecard - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (clear-copy ?card))
		(col-to-home-b-lock ?card ?homecard ?suit ?vcard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action col-to-home-b-stop-1
	:parameters (?card - card
		?homecard - card
		?suit - suittype
		?vcard - num
		?vhomecard - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (bottomcol-copy ?card))
		(col-to-home-b-lock ?card ?homecard ?suit ?vcard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action col-to-home-b-stop-2
	:parameters (?card - card
		?homecard - card
		?suit - suittype
		?vcard - num
		?vhomecard - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (home-copy ?homecard))
		(col-to-home-b-lock ?card ?homecard ?suit ?vcard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action col-to-home-b-stop-3
	:parameters (?card - card
		?homecard - card
		?suit - suittype
		?vcard - num
		?vhomecard - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (suit-copy ?card ?suit))
		(col-to-home-b-lock ?card ?homecard ?suit ?vcard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action col-to-home-b-stop-4
	:parameters (?card - card
		?homecard - card
		?suit - suittype
		?vcard - num
		?vhomecard - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (suit-copy ?homecard ?suit))
		(col-to-home-b-lock ?card ?homecard ?suit ?vcard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action col-to-home-b-stop-5
	:parameters (?card - card
		?homecard - card
		?suit - suittype
		?vcard - num
		?vhomecard - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (value-copy ?card ?vcard))
		(col-to-home-b-lock ?card ?homecard ?suit ?vcard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action col-to-home-b-stop-6
	:parameters (?card - card
		?homecard - card
		?suit - suittype
		?vcard - num
		?vhomecard - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (value-copy ?homecard ?vhomecard))
		(col-to-home-b-lock ?card ?homecard ?suit ?vcard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action col-to-home-b-stop-7
	:parameters (?card - card
		?homecard - card
		?suit - suittype
		?vcard - num
		?vhomecard - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (successor-copy ?vcard ?vhomecard))
		(col-to-home-b-lock ?card ?homecard ?suit ?vcard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action col-to-home-b-stop-8
	:parameters (?card - card
		?homecard - card
		?suit - suittype
		?vcard - num
		?vhomecard - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (colspace-copy ?cols))
		(col-to-home-b-lock ?card ?homecard ?suit ?vcard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action col-to-home-b-stop-9
	:parameters (?card - card
		?homecard - card
		?suit - suittype
		?vcard - num
		?vhomecard - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (colsuccessor-copy ?ncols ?cols))
		(col-to-home-b-lock ?card ?homecard ?suit ?vcard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action col-to-home-b-copy
	:parameters (?card - card
		?homecard - card
		?suit - suittype
		?vcard - num
		?vhomecard - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(col-to-home-b-lock ?card ?homecard ?suit ?vcard ?vhomecard ?cols ?ncols)
		(clear-copy ?card)
		(bottomcol-copy ?card)
		(home-copy ?homecard)
		(suit-copy ?card ?suit)
		(suit-copy ?homecard ?suit)
		(value-copy ?card ?vcard)
		(value-copy ?homecard ?vhomecard)
		(successor-copy ?vcard ?vhomecard)
		(colspace-copy ?cols)
		(colsuccessor-copy ?ncols ?cols))
	:effect (and
		(not (col-to-home-b-lock ?card ?homecard ?suit ?vcard ?vhomecard ?cols ?ncols))
		(unlock-origin-domain )
		(home-copy ?card)
		(colspace-copy ?ncols)
		(not (home-copy ?homecard))
		(not (faceup-copy ?card))
		(not (clear-copy ?card))
		(not (bottomcol-copy ?card))
		(not (colspace-copy ?cols))))

(:action tal-to-col-stop-0
	:parameters (?card - card
		?oldcard - card
		?newcard - card
		?cardabove - card)
	:precondition (and
		(not (clear-copy ?newcard))
		(tal-to-col-lock ?card ?oldcard ?newcard ?cardabove))
	:effect (and
		(invalid )))

(:action tal-to-col-stop-1
	:parameters (?card - card
		?oldcard - card
		?newcard - card
		?cardabove - card)
	:precondition (and
		(not (ontalon-copy ?card ?oldcard))
		(tal-to-col-lock ?card ?oldcard ?newcard ?cardabove))
	:effect (and
		(invalid )))

(:action tal-to-col-stop-2
	:parameters (?card - card
		?oldcard - card
		?newcard - card
		?cardabove - card)
	:precondition (and
		(not (ontalon-copy ?cardabove ?card))
		(tal-to-col-lock ?card ?oldcard ?newcard ?cardabove))
	:effect (and
		(invalid )))

(:action tal-to-col-stop-3
	:parameters (?card - card
		?oldcard - card
		?newcard - card
		?cardabove - card)
	:precondition (and
		(not (talonplayable-copy ?card))
		(tal-to-col-lock ?card ?oldcard ?newcard ?cardabove))
	:effect (and
		(invalid )))

(:action tal-to-col-stop-4
	:parameters (?card - card
		?oldcard - card
		?newcard - card
		?cardabove - card)
	:precondition (and
		(not (canstack-copy ?card ?newcard))
		(tal-to-col-lock ?card ?oldcard ?newcard ?cardabove))
	:effect (and
		(invalid )))

(:action tal-to-col-copy
	:parameters (?card - card
		?oldcard - card
		?newcard - card
		?cardabove - card)
	:precondition (and
		(tal-to-col-lock ?card ?oldcard ?newcard ?cardabove)
		(clear-copy ?newcard)
		(ontalon-copy ?card ?oldcard)
		(ontalon-copy ?cardabove ?card)
		(talonplayable-copy ?card)
		(canstack-copy ?card ?newcard))
	:effect (and
		(not (tal-to-col-lock ?card ?oldcard ?newcard ?cardabove))
		(unlock-origin-domain )
		(clear-copy ?card)
		(faceup-copy ?card)
		(talonplayable-copy ?oldcard)
		(on-copy ?card ?newcard)
		(ontalon-copy ?cardabove ?oldcard)
		(not (clear-copy ?newcard))
		(not (talonplayable-copy ?card))
		(not (ontalon-copy ?card ?oldcard))
		(not (ontalon-copy ?cardabove ?card))))

(:action tal-to-col-b-stop-0
	:parameters (?card - card
		?newcard - card
		?cardabove - card)
	:precondition (and
		(not (clear-copy ?newcard))
		(tal-to-col-b-lock ?card ?newcard ?cardabove))
	:effect (and
		(invalid )))

(:action tal-to-col-b-stop-1
	:parameters (?card - card
		?newcard - card
		?cardabove - card)
	:precondition (and
		(not (ontalon-copy ?cardabove ?card))
		(tal-to-col-b-lock ?card ?newcard ?cardabove))
	:effect (and
		(invalid )))

(:action tal-to-col-b-stop-2
	:parameters (?card - card
		?newcard - card
		?cardabove - card)
	:precondition (and
		(not (talonplayable-copy ?card))
		(tal-to-col-b-lock ?card ?newcard ?cardabove))
	:effect (and
		(invalid )))

(:action tal-to-col-b-stop-3
	:parameters (?card - card
		?newcard - card
		?cardabove - card)
	:precondition (and
		(not (bottomtalon-copy ?card))
		(tal-to-col-b-lock ?card ?newcard ?cardabove))
	:effect (and
		(invalid )))

(:action tal-to-col-b-stop-4
	:parameters (?card - card
		?newcard - card
		?cardabove - card)
	:precondition (and
		(not (canstack-copy ?card ?newcard))
		(tal-to-col-b-lock ?card ?newcard ?cardabove))
	:effect (and
		(invalid )))

(:action tal-to-col-b-copy
	:parameters (?card - card
		?newcard - card
		?cardabove - card)
	:precondition (and
		(tal-to-col-b-lock ?card ?newcard ?cardabove)
		(clear-copy ?newcard)
		(ontalon-copy ?cardabove ?card)
		(talonplayable-copy ?card)
		(bottomtalon-copy ?card)
		(canstack-copy ?card ?newcard))
	:effect (and
		(not (tal-to-col-b-lock ?card ?newcard ?cardabove))
		(unlock-origin-domain )
		(clear-copy ?card)
		(faceup-copy ?card)
		(on-copy ?card ?newcard)
		(bottomtalon-copy ?cardabove)
		(talonplayable-copy ?cardabove)
		(not (bottomtalon-copy ?card))
		(not (talonplayable-copy ?card))
		(not (clear-copy ?newcard))
		(not (ontalon-copy ?cardabove ?card))))

(:action tal-to-col-c-stop-0
	:parameters (?card - card
		?newcard - card
		?oldcard - card)
	:precondition (and
		(not (clear-copy ?newcard))
		(tal-to-col-c-lock ?card ?newcard ?oldcard))
	:effect (and
		(invalid )))

(:action tal-to-col-c-stop-1
	:parameters (?card - card
		?newcard - card
		?oldcard - card)
	:precondition (and
		(not (ontalon-copy ?card ?oldcard))
		(tal-to-col-c-lock ?card ?newcard ?oldcard))
	:effect (and
		(invalid )))

(:action tal-to-col-c-stop-2
	:parameters (?card - card
		?newcard - card
		?oldcard - card)
	:precondition (and
		(not (canstack-copy ?card ?newcard))
		(tal-to-col-c-lock ?card ?newcard ?oldcard))
	:effect (and
		(invalid )))

(:action tal-to-col-c-stop-3
	:parameters (?card - card
		?newcard - card
		?oldcard - card)
	:precondition (and
		(not (talonplayable-copy ?card))
		(tal-to-col-c-lock ?card ?newcard ?oldcard))
	:effect (and
		(invalid )))

(:action tal-to-col-c-stop-4
	:parameters (?card - card
		?newcard - card
		?oldcard - card)
	:precondition (and
		(not (toptalon-copy ?card))
		(tal-to-col-c-lock ?card ?newcard ?oldcard))
	:effect (and
		(invalid )))

(:action tal-to-col-c-copy
	:parameters (?card - card
		?newcard - card
		?oldcard - card)
	:precondition (and
		(tal-to-col-c-lock ?card ?newcard ?oldcard)
		(clear-copy ?newcard)
		(ontalon-copy ?card ?oldcard)
		(canstack-copy ?card ?newcard)
		(talonplayable-copy ?card)
		(toptalon-copy ?card))
	:effect (and
		(not (tal-to-col-c-lock ?card ?newcard ?oldcard))
		(unlock-origin-domain )
		(clear-copy ?card)
		(faceup-copy ?card)
		(on-copy ?card ?newcard)
		(toptalon-copy ?oldcard)
		(talonplayable-copy ?oldcard)
		(not (clear-copy ?newcard))
		(not (toptalon-copy ?card))
		(not (talonplayable-copy ?card))
		(not (ontalon-copy ?card ?oldcard))))

(:action tal-to-col-d-stop-0
	:parameters (?card - card
		?newcard - card)
	:precondition (and
		(not (clear-copy ?newcard))
		(tal-to-col-d-lock ?card ?newcard))
	:effect (and
		(invalid )))

(:action tal-to-col-d-stop-1
	:parameters (?card - card
		?newcard - card)
	:precondition (and
		(not (canstack-copy ?card ?newcard))
		(tal-to-col-d-lock ?card ?newcard))
	:effect (and
		(invalid )))

(:action tal-to-col-d-stop-2
	:parameters (?card - card
		?newcard - card)
	:precondition (and
		(not (bottomtalon-copy ?card))
		(tal-to-col-d-lock ?card ?newcard))
	:effect (and
		(invalid )))

(:action tal-to-col-d-stop-3
	:parameters (?card - card
		?newcard - card)
	:precondition (and
		(not (toptalon-copy ?card))
		(tal-to-col-d-lock ?card ?newcard))
	:effect (and
		(invalid )))

(:action tal-to-col-d-stop-4
	:parameters (?card - card
		?newcard - card)
	:precondition (and
		(not (talonplayable-copy ?card))
		(tal-to-col-d-lock ?card ?newcard))
	:effect (and
		(invalid )))

(:action tal-to-col-d-copy
	:parameters (?card - card
		?newcard - card)
	:precondition (and
		(tal-to-col-d-lock ?card ?newcard)
		(clear-copy ?newcard)
		(canstack-copy ?card ?newcard)
		(bottomtalon-copy ?card)
		(toptalon-copy ?card)
		(talonplayable-copy ?card))
	:effect (and
		(not (tal-to-col-d-lock ?card ?newcard))
		(unlock-origin-domain )
		(clear-copy ?card)
		(faceup-copy ?card)
		(on-copy ?card ?newcard)
		(not (clear-copy ?newcard))
		(not (toptalon-copy ?card))
		(not (talonplayable-copy ?card))
		(not (bottomtalon-copy ?card))))

(:action tal-to-col-e-stop-0
	:parameters (?card - card
		?oldcard - card
		?cardabove - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (king-copy ?card))
		(tal-to-col-e-lock ?card ?oldcard ?cardabove ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-e-stop-1
	:parameters (?card - card
		?oldcard - card
		?cardabove - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (ontalon-copy ?card ?oldcard))
		(tal-to-col-e-lock ?card ?oldcard ?cardabove ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-e-stop-2
	:parameters (?card - card
		?oldcard - card
		?cardabove - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (ontalon-copy ?cardabove ?card))
		(tal-to-col-e-lock ?card ?oldcard ?cardabove ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-e-stop-3
	:parameters (?card - card
		?oldcard - card
		?cardabove - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (talonplayable-copy ?card))
		(tal-to-col-e-lock ?card ?oldcard ?cardabove ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-e-stop-4
	:parameters (?card - card
		?oldcard - card
		?cardabove - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (colspace-copy ?cols))
		(tal-to-col-e-lock ?card ?oldcard ?cardabove ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-e-stop-5
	:parameters (?card - card
		?oldcard - card
		?cardabove - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (colsuccessor-copy ?cols ?ncols))
		(tal-to-col-e-lock ?card ?oldcard ?cardabove ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-e-copy
	:parameters (?card - card
		?oldcard - card
		?cardabove - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(tal-to-col-e-lock ?card ?oldcard ?cardabove ?cols ?ncols)
		(king-copy ?card)
		(ontalon-copy ?card ?oldcard)
		(ontalon-copy ?cardabove ?card)
		(talonplayable-copy ?card)
		(colspace-copy ?cols)
		(colsuccessor-copy ?cols ?ncols))
	:effect (and
		(not (tal-to-col-e-lock ?card ?oldcard ?cardabove ?cols ?ncols))
		(unlock-origin-domain )
		(clear-copy ?card)
		(faceup-copy ?card)
		(talonplayable-copy ?oldcard)
		(ontalon-copy ?cardabove ?oldcard)
		(bottomcol-copy ?card)
		(colspace-copy ?ncols)
		(not (colspace-copy ?cols))
		(not (talonplayable-copy ?card))
		(not (ontalon-copy ?card ?oldcard))
		(not (ontalon-copy ?cardabove ?card))))

(:action tal-to-col-f-stop-0
	:parameters (?card - card
		?cardabove - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (king-copy ?card))
		(tal-to-col-f-lock ?card ?cardabove ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-f-stop-1
	:parameters (?card - card
		?cardabove - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (ontalon-copy ?cardabove ?card))
		(tal-to-col-f-lock ?card ?cardabove ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-f-stop-2
	:parameters (?card - card
		?cardabove - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (talonplayable-copy ?card))
		(tal-to-col-f-lock ?card ?cardabove ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-f-stop-3
	:parameters (?card - card
		?cardabove - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (bottomtalon-copy ?card))
		(tal-to-col-f-lock ?card ?cardabove ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-f-stop-4
	:parameters (?card - card
		?cardabove - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (colspace-copy ?cols))
		(tal-to-col-f-lock ?card ?cardabove ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-f-stop-5
	:parameters (?card - card
		?cardabove - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (colsuccessor-copy ?cols ?ncols))
		(tal-to-col-f-lock ?card ?cardabove ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-f-copy
	:parameters (?card - card
		?cardabove - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(tal-to-col-f-lock ?card ?cardabove ?cols ?ncols)
		(king-copy ?card)
		(ontalon-copy ?cardabove ?card)
		(talonplayable-copy ?card)
		(bottomtalon-copy ?card)
		(colspace-copy ?cols)
		(colsuccessor-copy ?cols ?ncols))
	:effect (and
		(not (tal-to-col-f-lock ?card ?cardabove ?cols ?ncols))
		(unlock-origin-domain )
		(clear-copy ?card)
		(faceup-copy ?card)
		(bottomtalon-copy ?cardabove)
		(talonplayable-copy ?cardabove)
		(bottomcol-copy ?card)
		(colspace-copy ?ncols)
		(not (colspace-copy ?cols))
		(not (bottomtalon-copy ?card))
		(not (talonplayable-copy ?card))
		(not (ontalon-copy ?cardabove ?card))))

(:action tal-to-col-g-stop-0
	:parameters (?card - card
		?oldcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (king-copy ?card))
		(tal-to-col-g-lock ?card ?oldcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-g-stop-1
	:parameters (?card - card
		?oldcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (ontalon-copy ?card ?oldcard))
		(tal-to-col-g-lock ?card ?oldcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-g-stop-2
	:parameters (?card - card
		?oldcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (talonplayable-copy ?card))
		(tal-to-col-g-lock ?card ?oldcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-g-stop-3
	:parameters (?card - card
		?oldcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (colspace-copy ?cols))
		(tal-to-col-g-lock ?card ?oldcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-g-stop-4
	:parameters (?card - card
		?oldcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (colsuccessor-copy ?cols ?ncols))
		(tal-to-col-g-lock ?card ?oldcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-g-stop-5
	:parameters (?card - card
		?oldcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (toptalon-copy ?card))
		(tal-to-col-g-lock ?card ?oldcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-g-copy
	:parameters (?card - card
		?oldcard - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(tal-to-col-g-lock ?card ?oldcard ?cols ?ncols)
		(king-copy ?card)
		(ontalon-copy ?card ?oldcard)
		(talonplayable-copy ?card)
		(colspace-copy ?cols)
		(colsuccessor-copy ?cols ?ncols)
		(toptalon-copy ?card))
	:effect (and
		(not (tal-to-col-g-lock ?card ?oldcard ?cols ?ncols))
		(unlock-origin-domain )
		(clear-copy ?card)
		(faceup-copy ?card)
		(toptalon-copy ?oldcard)
		(talonplayable-copy ?oldcard)
		(bottomcol-copy ?card)
		(colspace-copy ?ncols)
		(not (colspace-copy ?cols))
		(not (toptalon-copy ?card))
		(not (talonplayable-copy ?card))
		(not (ontalon-copy ?card ?oldcard))))

(:action tal-to-col-h-stop-0
	:parameters (?card - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (king-copy ?card))
		(tal-to-col-h-lock ?card ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-h-stop-1
	:parameters (?card - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (bottomtalon-copy ?card))
		(tal-to-col-h-lock ?card ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-h-stop-2
	:parameters (?card - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (toptalon-copy ?card))
		(tal-to-col-h-lock ?card ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-h-stop-3
	:parameters (?card - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (colspace-copy ?cols))
		(tal-to-col-h-lock ?card ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-h-stop-4
	:parameters (?card - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (colsuccessor-copy ?cols ?ncols))
		(tal-to-col-h-lock ?card ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-h-stop-5
	:parameters (?card - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (talonplayable-copy ?card))
		(tal-to-col-h-lock ?card ?cols ?ncols))
	:effect (and
		(invalid )))

(:action tal-to-col-h-copy
	:parameters (?card - card
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(tal-to-col-h-lock ?card ?cols ?ncols)
		(king-copy ?card)
		(bottomtalon-copy ?card)
		(toptalon-copy ?card)
		(colspace-copy ?cols)
		(colsuccessor-copy ?cols ?ncols)
		(talonplayable-copy ?card))
	:effect (and
		(not (tal-to-col-h-lock ?card ?cols ?ncols))
		(unlock-origin-domain )
		(clear-copy ?card)
		(faceup-copy ?card)
		(bottomcol-copy ?card)
		(colspace-copy ?ncols)
		(not (colspace-copy ?cols))
		(not (toptalon-copy ?card))
		(not (talonplayable-copy ?card))
		(not (bottomtalon-copy ?card))))

(:action tal-to-home-stop-0
	:parameters (?card - card
		?cardabove - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (talonplayable-copy ?card))
		(tal-to-home-lock ?card ?cardabove ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-stop-1
	:parameters (?card - card
		?cardabove - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (ontalon-copy ?cardabove ?card))
		(tal-to-home-lock ?card ?cardabove ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-stop-2
	:parameters (?card - card
		?cardabove - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (ontalon-copy ?card ?cardbelow))
		(tal-to-home-lock ?card ?cardabove ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-stop-3
	:parameters (?card - card
		?cardabove - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (suit-copy ?card ?cardsuit))
		(tal-to-home-lock ?card ?cardabove ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-stop-4
	:parameters (?card - card
		?cardabove - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (suit-copy ?homecard ?cardsuit))
		(tal-to-home-lock ?card ?cardabove ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-stop-5
	:parameters (?card - card
		?cardabove - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (home-copy ?homecard))
		(tal-to-home-lock ?card ?cardabove ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-stop-6
	:parameters (?card - card
		?cardabove - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (value-copy ?card ?vcard))
		(tal-to-home-lock ?card ?cardabove ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-stop-7
	:parameters (?card - card
		?cardabove - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (value-copy ?homecard ?vhomecard))
		(tal-to-home-lock ?card ?cardabove ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-stop-8
	:parameters (?card - card
		?cardabove - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (successor-copy ?vcard ?vhomecard))
		(tal-to-home-lock ?card ?cardabove ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-copy
	:parameters (?card - card
		?cardabove - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(tal-to-home-lock ?card ?cardabove ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard)
		(talonplayable-copy ?card)
		(ontalon-copy ?cardabove ?card)
		(ontalon-copy ?card ?cardbelow)
		(suit-copy ?card ?cardsuit)
		(suit-copy ?homecard ?cardsuit)
		(home-copy ?homecard)
		(value-copy ?card ?vcard)
		(value-copy ?homecard ?vhomecard)
		(successor-copy ?vcard ?vhomecard))
	:effect (and
		(not (tal-to-home-lock ?card ?cardabove ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
		(unlock-origin-domain )
		(talonplayable-copy ?cardbelow)
		(not (talonplayable-copy ?card))
		(ontalon-copy ?cardabove ?cardbelow)
		(not (ontalon-copy ?cardabove ?card))
		(not (ontalon-copy ?card ?cardbelow))
		(home-copy ?card)
		(not (home-copy ?homecard))))

(:action tal-to-home-b-stop-0
	:parameters (?card - card
		?cardabove - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (talonplayable-copy ?card))
		(tal-to-home-b-lock ?card ?cardabove ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-b-stop-1
	:parameters (?card - card
		?cardabove - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (ontalon-copy ?cardabove ?card))
		(tal-to-home-b-lock ?card ?cardabove ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-b-stop-2
	:parameters (?card - card
		?cardabove - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (bottomtalon-copy ?card))
		(tal-to-home-b-lock ?card ?cardabove ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-b-stop-3
	:parameters (?card - card
		?cardabove - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (home-copy ?homecard))
		(tal-to-home-b-lock ?card ?cardabove ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-b-stop-4
	:parameters (?card - card
		?cardabove - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (suit-copy ?card ?cardsuit))
		(tal-to-home-b-lock ?card ?cardabove ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-b-stop-5
	:parameters (?card - card
		?cardabove - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (suit-copy ?homecard ?cardsuit))
		(tal-to-home-b-lock ?card ?cardabove ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-b-stop-6
	:parameters (?card - card
		?cardabove - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (value-copy ?card ?vcard))
		(tal-to-home-b-lock ?card ?cardabove ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-b-stop-7
	:parameters (?card - card
		?cardabove - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (value-copy ?homecard ?vhomecard))
		(tal-to-home-b-lock ?card ?cardabove ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-b-stop-8
	:parameters (?card - card
		?cardabove - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (successor-copy ?vcard ?vhomecard))
		(tal-to-home-b-lock ?card ?cardabove ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-b-copy
	:parameters (?card - card
		?cardabove - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(tal-to-home-b-lock ?card ?cardabove ?homecard ?cardsuit ?vcard ?vhomecard)
		(talonplayable-copy ?card)
		(ontalon-copy ?cardabove ?card)
		(bottomtalon-copy ?card)
		(home-copy ?homecard)
		(suit-copy ?card ?cardsuit)
		(suit-copy ?homecard ?cardsuit)
		(value-copy ?card ?vcard)
		(value-copy ?homecard ?vhomecard)
		(successor-copy ?vcard ?vhomecard))
	:effect (and
		(not (tal-to-home-b-lock ?card ?cardabove ?homecard ?cardsuit ?vcard ?vhomecard))
		(unlock-origin-domain )
		(bottomtalon-copy ?cardabove)
		(talonplayable-copy ?cardabove)
		(home-copy ?card)
		(not (bottomtalon-copy ?card))
		(not (talonplayable-copy ?card))
		(not (ontalon-copy ?cardabove ?card))
		(not (home-copy ?homecard))))

(:action tal-to-home-c-stop-0
	:parameters (?card - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (ontalon-copy ?card ?cardbelow))
		(tal-to-home-c-lock ?card ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-c-stop-1
	:parameters (?card - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (talonplayable-copy ?card))
		(tal-to-home-c-lock ?card ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-c-stop-2
	:parameters (?card - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (toptalon-copy ?card))
		(tal-to-home-c-lock ?card ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-c-stop-3
	:parameters (?card - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (home-copy ?homecard))
		(tal-to-home-c-lock ?card ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-c-stop-4
	:parameters (?card - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (suit-copy ?card ?cardsuit))
		(tal-to-home-c-lock ?card ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-c-stop-5
	:parameters (?card - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (suit-copy ?homecard ?cardsuit))
		(tal-to-home-c-lock ?card ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-c-stop-6
	:parameters (?card - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (value-copy ?card ?vcard))
		(tal-to-home-c-lock ?card ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-c-stop-7
	:parameters (?card - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (value-copy ?homecard ?vhomecard))
		(tal-to-home-c-lock ?card ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-c-stop-8
	:parameters (?card - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (successor-copy ?vcard ?vhomecard))
		(tal-to-home-c-lock ?card ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-c-copy
	:parameters (?card - card
		?cardbelow - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(tal-to-home-c-lock ?card ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard)
		(ontalon-copy ?card ?cardbelow)
		(talonplayable-copy ?card)
		(toptalon-copy ?card)
		(home-copy ?homecard)
		(suit-copy ?card ?cardsuit)
		(suit-copy ?homecard ?cardsuit)
		(value-copy ?card ?vcard)
		(value-copy ?homecard ?vhomecard)
		(successor-copy ?vcard ?vhomecard))
	:effect (and
		(not (tal-to-home-c-lock ?card ?cardbelow ?homecard ?cardsuit ?vcard ?vhomecard))
		(unlock-origin-domain )
		(toptalon-copy ?cardbelow)
		(talonplayable-copy ?cardbelow)
		(home-copy ?card)
		(not (home-copy ?homecard))
		(not (toptalon-copy ?card))
		(not (talonplayable-copy ?card))
		(not (ontalon-copy ?card ?cardbelow))))

(:action tal-to-home-d-stop-0
	:parameters (?card - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (bottomtalon-copy ?card))
		(tal-to-home-d-lock ?card ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-d-stop-1
	:parameters (?card - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (toptalon-copy ?card))
		(tal-to-home-d-lock ?card ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-d-stop-2
	:parameters (?card - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (talonplayable-copy ?card))
		(tal-to-home-d-lock ?card ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-d-stop-3
	:parameters (?card - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (home-copy ?homecard))
		(tal-to-home-d-lock ?card ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-d-stop-4
	:parameters (?card - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (suit-copy ?card ?cardsuit))
		(tal-to-home-d-lock ?card ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-d-stop-5
	:parameters (?card - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (suit-copy ?homecard ?cardsuit))
		(tal-to-home-d-lock ?card ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-d-stop-6
	:parameters (?card - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (value-copy ?card ?vcard))
		(tal-to-home-d-lock ?card ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-d-stop-7
	:parameters (?card - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (value-copy ?homecard ?vhomecard))
		(tal-to-home-d-lock ?card ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-d-stop-8
	:parameters (?card - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(not (successor-copy ?vcard ?vhomecard))
		(tal-to-home-d-lock ?card ?homecard ?cardsuit ?vcard ?vhomecard))
	:effect (and
		(invalid )))

(:action tal-to-home-d-copy
	:parameters (?card - card
		?homecard - card
		?cardsuit - suittype
		?vcard - num
		?vhomecard - num)
	:precondition (and
		(tal-to-home-d-lock ?card ?homecard ?cardsuit ?vcard ?vhomecard)
		(bottomtalon-copy ?card)
		(toptalon-copy ?card)
		(talonplayable-copy ?card)
		(home-copy ?homecard)
		(suit-copy ?card ?cardsuit)
		(suit-copy ?homecard ?cardsuit)
		(value-copy ?card ?vcard)
		(value-copy ?homecard ?vhomecard)
		(successor-copy ?vcard ?vhomecard))
	:effect (and
		(not (tal-to-home-d-lock ?card ?homecard ?cardsuit ?vcard ?vhomecard))
		(unlock-origin-domain )
		(home-copy ?card)
		(not (home-copy ?homecard))
		(not (toptalon-copy ?card))
		(not (talonplayable-copy ?card))
		(not (bottomtalon-copy ?card))))

(:action home-to-col-stop-0
	:parameters (?card - card
		?cardbelow - card
		?newcard - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num)
	:precondition (and
		(not (home-copy ?card))
		(home-to-col-lock ?card ?cardbelow ?newcard ?cardsuit ?vcard ?vcardbelow))
	:effect (and
		(invalid )))

(:action home-to-col-stop-1
	:parameters (?card - card
		?cardbelow - card
		?newcard - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num)
	:precondition (and
		(not (suit-copy ?card ?cardsuit))
		(home-to-col-lock ?card ?cardbelow ?newcard ?cardsuit ?vcard ?vcardbelow))
	:effect (and
		(invalid )))

(:action home-to-col-stop-2
	:parameters (?card - card
		?cardbelow - card
		?newcard - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num)
	:precondition (and
		(not (suit-copy ?cardbelow ?cardsuit))
		(home-to-col-lock ?card ?cardbelow ?newcard ?cardsuit ?vcard ?vcardbelow))
	:effect (and
		(invalid )))

(:action home-to-col-stop-3
	:parameters (?card - card
		?cardbelow - card
		?newcard - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num)
	:precondition (and
		(not (value-copy ?card ?vcard))
		(home-to-col-lock ?card ?cardbelow ?newcard ?cardsuit ?vcard ?vcardbelow))
	:effect (and
		(invalid )))

(:action home-to-col-stop-4
	:parameters (?card - card
		?cardbelow - card
		?newcard - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num)
	:precondition (and
		(not (value-copy ?cardbelow ?vcardbelow))
		(home-to-col-lock ?card ?cardbelow ?newcard ?cardsuit ?vcard ?vcardbelow))
	:effect (and
		(invalid )))

(:action home-to-col-stop-5
	:parameters (?card - card
		?cardbelow - card
		?newcard - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num)
	:precondition (and
		(not (successor-copy ?vcard ?vcardbelow))
		(home-to-col-lock ?card ?cardbelow ?newcard ?cardsuit ?vcard ?vcardbelow))
	:effect (and
		(invalid )))

(:action home-to-col-stop-6
	:parameters (?card - card
		?cardbelow - card
		?newcard - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num)
	:precondition (and
		(not (canstack-copy ?card ?newcard))
		(home-to-col-lock ?card ?cardbelow ?newcard ?cardsuit ?vcard ?vcardbelow))
	:effect (and
		(invalid )))

(:action home-to-col-stop-7
	:parameters (?card - card
		?cardbelow - card
		?newcard - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num)
	:precondition (and
		(not (clear-copy ?newcard))
		(home-to-col-lock ?card ?cardbelow ?newcard ?cardsuit ?vcard ?vcardbelow))
	:effect (and
		(invalid )))

(:action home-to-col-copy
	:parameters (?card - card
		?cardbelow - card
		?newcard - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num)
	:precondition (and
		(home-to-col-lock ?card ?cardbelow ?newcard ?cardsuit ?vcard ?vcardbelow)
		(home-copy ?card)
		(suit-copy ?card ?cardsuit)
		(suit-copy ?cardbelow ?cardsuit)
		(value-copy ?card ?vcard)
		(value-copy ?cardbelow ?vcardbelow)
		(successor-copy ?vcard ?vcardbelow)
		(canstack-copy ?card ?newcard)
		(clear-copy ?newcard))
	:effect (and
		(not (home-to-col-lock ?card ?cardbelow ?newcard ?cardsuit ?vcard ?vcardbelow))
		(unlock-origin-domain )
		(clear-copy ?card)
		(faceup-copy ?card)
		(home-copy ?cardbelow)
		(on-copy ?card ?newcard)
		(not (home-copy ?card))
		(not (clear-copy ?newcard))))

(:action home-to-col-a-stop-0
	:parameters (?card - card
		?cardbelow - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (home-copy ?card))
		(home-to-col-a-lock ?card ?cardbelow ?cardsuit ?vcard ?vcardbelow ?cols ?ncols))
	:effect (and
		(invalid )))

(:action home-to-col-a-stop-1
	:parameters (?card - card
		?cardbelow - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (king-copy ?card))
		(home-to-col-a-lock ?card ?cardbelow ?cardsuit ?vcard ?vcardbelow ?cols ?ncols))
	:effect (and
		(invalid )))

(:action home-to-col-a-stop-2
	:parameters (?card - card
		?cardbelow - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (suit-copy ?card ?cardsuit))
		(home-to-col-a-lock ?card ?cardbelow ?cardsuit ?vcard ?vcardbelow ?cols ?ncols))
	:effect (and
		(invalid )))

(:action home-to-col-a-stop-3
	:parameters (?card - card
		?cardbelow - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (suit-copy ?cardbelow ?cardsuit))
		(home-to-col-a-lock ?card ?cardbelow ?cardsuit ?vcard ?vcardbelow ?cols ?ncols))
	:effect (and
		(invalid )))

(:action home-to-col-a-stop-4
	:parameters (?card - card
		?cardbelow - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (value-copy ?card ?vcard))
		(home-to-col-a-lock ?card ?cardbelow ?cardsuit ?vcard ?vcardbelow ?cols ?ncols))
	:effect (and
		(invalid )))

(:action home-to-col-a-stop-5
	:parameters (?card - card
		?cardbelow - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (value-copy ?cardbelow ?vcardbelow))
		(home-to-col-a-lock ?card ?cardbelow ?cardsuit ?vcard ?vcardbelow ?cols ?ncols))
	:effect (and
		(invalid )))

(:action home-to-col-a-stop-6
	:parameters (?card - card
		?cardbelow - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (successor-copy ?vcard ?vcardbelow))
		(home-to-col-a-lock ?card ?cardbelow ?cardsuit ?vcard ?vcardbelow ?cols ?ncols))
	:effect (and
		(invalid )))

(:action home-to-col-a-stop-7
	:parameters (?card - card
		?cardbelow - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (colspace-copy ?cols))
		(home-to-col-a-lock ?card ?cardbelow ?cardsuit ?vcard ?vcardbelow ?cols ?ncols))
	:effect (and
		(invalid )))

(:action home-to-col-a-stop-8
	:parameters (?card - card
		?cardbelow - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(not (colsuccessor-copy ?cols ?ncols))
		(home-to-col-a-lock ?card ?cardbelow ?cardsuit ?vcard ?vcardbelow ?cols ?ncols))
	:effect (and
		(invalid )))

(:action home-to-col-a-copy
	:parameters (?card - card
		?cardbelow - card
		?cardsuit - suittype
		?vcard - num
		?vcardbelow - num
		?cols - colnum
		?ncols - colnum)
	:precondition (and
		(home-to-col-a-lock ?card ?cardbelow ?cardsuit ?vcard ?vcardbelow ?cols ?ncols)
		(home-copy ?card)
		(king-copy ?card)
		(suit-copy ?card ?cardsuit)
		(suit-copy ?cardbelow ?cardsuit)
		(value-copy ?card ?vcard)
		(value-copy ?cardbelow ?vcardbelow)
		(successor-copy ?vcard ?vcardbelow)
		(colspace-copy ?cols)
		(colsuccessor-copy ?cols ?ncols))
	:effect (and
		(not (home-to-col-a-lock ?card ?cardbelow ?cardsuit ?vcard ?vcardbelow ?cols ?ncols))
		(unlock-origin-domain )
		(home-copy ?cardbelow)
		(bottomcol-copy ?card)
		(clear-copy ?card)
		(faceup-copy ?card)
		(colspace-copy ?ncols)
		(not (colspace-copy ?cols))
		(not (home-copy ?card))))

(:action turn-deck-stop-0
	:parameters (?card - card
		?c1 - card)
	:precondition (and
		(not (talonplayable-copy ?card))
		(turn-deck-lock ?card ?c1))
	:effect (and
		(invalid )))

(:action turn-deck-stop-1
	:parameters (?card - card
		?c1 - card)
	:precondition (and
		(not (ontalon-copy ?c1 ?card))
		(turn-deck-lock ?card ?c1))
	:effect (and
		(invalid )))

(:action turn-deck-copy
	:parameters (?card - card
		?c1 - card)
	:precondition (and
		(turn-deck-lock ?card ?c1)
		(talonplayable-copy ?card)
		(ontalon-copy ?c1 ?card))
	:effect (and
		(not (turn-deck-lock ?card ?c1))
		(unlock-origin-domain )
		(talonplayable-copy ?c1)
		(not (talonplayable-copy ?card))))

(:action turn-deck-a-stop-0
	:parameters (?card - card
		?c1 - card)
	:precondition (and
		(not (talonplayable-copy ?card))
		(turn-deck-a-lock ?card ?c1))
	:effect (and
		(invalid )))

(:action turn-deck-a-stop-1
	:parameters (?card - card
		?c1 - card)
	:precondition (and
		(not (toptalon-copy ?card))
		(turn-deck-a-lock ?card ?c1))
	:effect (and
		(invalid )))

(:action turn-deck-a-stop-2
	:parameters (?card - card
		?c1 - card)
	:precondition (and
		(not (bottomtalon-copy ?c1))
		(turn-deck-a-lock ?card ?c1))
	:effect (and
		(invalid )))

(:action turn-deck-a-copy
	:parameters (?card - card
		?c1 - card)
	:precondition (and
		(turn-deck-a-lock ?card ?c1)
		(talonplayable-copy ?card)
		(toptalon-copy ?card)
		(bottomtalon-copy ?c1))
	:effect (and
		(not (turn-deck-a-lock ?card ?c1))
		(unlock-origin-domain )
		(talonplayable-copy ?c1)
		(not (talonplayable-copy ?card))))

(:action turning
	:parameters ()
	:precondition (and
		(invalid ))
	:effect (and
		(unlock-origin-domain ))) )