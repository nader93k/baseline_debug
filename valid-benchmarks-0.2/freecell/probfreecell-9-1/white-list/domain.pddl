(define (domain freecell)
(:requirements :strips)
(:types
	object)
(:constants )
(:predicates
	(on ?c1 - object ?c2 - object)
	(incell ?c - object)
	(clear ?c - object)
	(cellspace ?n - object)
	(colspace ?n - object)
	(home ?c - object)
	(bottomcol ?c - object)
	(canstack ?c1 - object ?c2 - object)
	(suit ?c - object ?s - object)
	(value ?c - object ?v - object)
	(successor ?n1 - object ?n0 - object)
	(= ?x - object ?y - object)
	(on-copy ?c1 - object ?c2 - object)
	(incell-copy ?c - object)
	(clear-copy ?c - object)
	(cellspace-copy ?n - object)
	(colspace-copy ?n - object)
	(home-copy ?c - object)
	(bottomcol-copy ?c - object)
	(canstack-copy ?c1 - object ?c2 - object)
	(suit-copy ?c - object ?s - object)
	(value-copy ?c - object ?v - object)
	(successor-copy ?n1 - object ?n0 - object)
	(=-copy ?x - object ?y - object)
	(invalid )
	(unlock-origin-domain )
	(move-lock ?card - object ?oldcard - object ?newcard - object)
	(move-b-lock ?card - object ?newcard - object ?cols - object ?ncols - object)
	(sendtofree-lock ?card - object ?oldcard - object ?cells - object ?ncells - object)
	(sendtofree-b-lock ?card - object ?cells - object ?ncells - object ?cols - object ?ncols - object)
	(sendtonewcol-lock ?card - object ?oldcard - object ?cols - object ?ncols - object)
	(sendtohome-lock ?card - object ?oldcard - object ?suit - object ?vcard - object ?homecard - object ?vhomecard - object)
	(sendtohome-b-lock ?card - object ?suit - object ?vcard - object ?homecard - object ?vhomecard - object ?cols - object ?ncols - object)
	(homefromfreecell-lock ?card - object ?suit - object ?vcard - object ?homecard - object ?vhomecard - object ?cells - object ?ncells - object)
	(colfromfreecell-lock ?card - object ?newcard - object ?cells - object ?ncells - object)
	(newcolfromfreecell-lock ?card - object ?cols - object ?ncols - object ?cells - object ?ncells - object))
(:functions )
(:action move
	:parameters (?card - object
		?oldcard - object
		?newcard - object)
	:precondition (and
		(clear ?card)
		(clear ?newcard)
		(canstack ?card ?newcard)
		(on ?card ?oldcard)
		(unlock-origin-domain ))
	:effect (and
		(on ?card ?newcard)
		(clear ?oldcard)
		(not (on ?card ?oldcard))
		(not (clear ?newcard))
		(move-lock ?card ?oldcard ?newcard)
		(not (unlock-origin-domain ))))

(:action move-b
	:parameters (?card - object
		?newcard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(clear ?card)
		(bottomcol ?card)
		(clear ?newcard)
		(canstack ?card ?newcard)
		(colspace ?cols)
		(successor ?ncols ?cols)
		(unlock-origin-domain ))
	:effect (and
		(on ?card ?newcard)
		(colspace ?ncols)
		(not (bottomcol ?card))
		(not (clear ?newcard))
		(not (colspace ?cols))
		(move-b-lock ?card ?newcard ?cols ?ncols)
		(not (unlock-origin-domain ))))

(:action sendtofree
	:parameters (?card - object
		?oldcard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(clear ?card)
		(on ?card ?oldcard)
		(cellspace ?cells)
		(successor ?cells ?ncells)
		(unlock-origin-domain ))
	:effect (and
		(incell ?card)
		(clear ?oldcard)
		(cellspace ?ncells)
		(not (on ?card ?oldcard))
		(not (clear ?card))
		(not (cellspace ?cells))
		(sendtofree-lock ?card ?oldcard ?cells ?ncells)
		(not (unlock-origin-domain ))))

(:action sendtofree-b
	:parameters (?card - object
		?cells - object
		?ncells - object
		?cols - object
		?ncols - object)
	:precondition (and
		(clear ?card)
		(bottomcol ?card)
		(cellspace ?cells)
		(successor ?cells ?ncells)
		(colspace ?cols)
		(successor ?ncols ?cols)
		(unlock-origin-domain ))
	:effect (and
		(incell ?card)
		(colspace ?ncols)
		(cellspace ?ncells)
		(not (bottomcol ?card))
		(not (clear ?card))
		(not (colspace ?cols))
		(not (cellspace ?cells))
		(sendtofree-b-lock ?card ?cells ?ncells ?cols ?ncols)
		(not (unlock-origin-domain ))))

(:action sendtonewcol
	:parameters (?card - object
		?oldcard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(clear ?card)
		(colspace ?cols)
		(successor ?cols ?ncols)
		(on ?card ?oldcard)
		(unlock-origin-domain ))
	:effect (and
		(bottomcol ?card)
		(clear ?oldcard)
		(colspace ?ncols)
		(not (on ?card ?oldcard))
		(not (colspace ?cols))
		(sendtonewcol-lock ?card ?oldcard ?cols ?ncols)
		(not (unlock-origin-domain ))))

(:action sendtohome
	:parameters (?card - object
		?oldcard - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object)
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
		(not (on ?card ?oldcard))
		(not (home ?homecard))
		(not (clear ?card))
		(sendtohome-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard)
		(not (unlock-origin-domain ))))

(:action sendtohome-b
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cols - object
		?ncols - object)
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
		(successor ?ncols ?cols)
		(unlock-origin-domain ))
	:effect (and
		(home ?card)
		(colspace ?ncols)
		(not (home ?homecard))
		(not (clear ?card))
		(not (bottomcol ?card))
		(not (colspace ?cols))
		(sendtohome-b-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cols ?ncols)
		(not (unlock-origin-domain ))))

(:action homefromfreecell
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(incell ?card)
		(home ?homecard)
		(suit ?card ?suit)
		(suit ?homecard ?suit)
		(value ?card ?vcard)
		(value ?homecard ?vhomecard)
		(successor ?vcard ?vhomecard)
		(cellspace ?cells)
		(successor ?ncells ?cells)
		(unlock-origin-domain ))
	:effect (and
		(home ?card)
		(cellspace ?ncells)
		(not (incell ?card))
		(not (cellspace ?cells))
		(not (home ?homecard))
		(homefromfreecell-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cells ?ncells)
		(not (unlock-origin-domain ))))

(:action colfromfreecell
	:parameters (?card - object
		?newcard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(incell ?card)
		(clear ?newcard)
		(canstack ?card ?newcard)
		(cellspace ?cells)
		(successor ?ncells ?cells)
		(unlock-origin-domain ))
	:effect (and
		(cellspace ?ncells)
		(clear ?card)
		(on ?card ?newcard)
		(not (incell ?card))
		(not (cellspace ?cells))
		(not (clear ?newcard))
		(colfromfreecell-lock ?card ?newcard ?cells ?ncells)
		(not (unlock-origin-domain ))))

(:action newcolfromfreecell
	:parameters (?card - object
		?cols - object
		?ncols - object
		?cells - object
		?ncells - object)
	:precondition (and
		(incell ?card)
		(colspace ?cols)
		(cellspace ?cells)
		(successor ?cols ?ncols)
		(successor ?ncells ?cells)
		(unlock-origin-domain ))
	:effect (and
		(bottomcol ?card)
		(clear ?card)
		(colspace ?ncols)
		(cellspace ?ncells)
		(not (incell ?card))
		(not (colspace ?cols))
		(not (cellspace ?cells))
		(newcolfromfreecell-lock ?card ?cols ?ncols ?cells ?ncells)
		(not (unlock-origin-domain ))))

(:action move-stop-0
	:parameters (?card - object
		?oldcard - object
		?newcard - object)
	:precondition (and
		(not (clear-copy ?card))
		(move-lock ?card ?oldcard ?newcard))
	:effect (and
		(invalid )))

(:action move-stop-1
	:parameters (?card - object
		?oldcard - object
		?newcard - object)
	:precondition (and
		(not (clear-copy ?newcard))
		(move-lock ?card ?oldcard ?newcard))
	:effect (and
		(invalid )))

(:action move-stop-2
	:parameters (?card - object
		?oldcard - object
		?newcard - object)
	:precondition (and
		(not (canstack-copy ?card ?newcard))
		(move-lock ?card ?oldcard ?newcard))
	:effect (and
		(invalid )))

(:action move-stop-3
	:parameters (?card - object
		?oldcard - object
		?newcard - object)
	:precondition (and
		(not (on-copy ?card ?oldcard))
		(move-lock ?card ?oldcard ?newcard))
	:effect (and
		(invalid )))

(:action move-stop-4
	:parameters (?card - object
		?oldcard - object
		?newcard - object)
	:precondition (and
		(not (suit-copy ?oldcard ?card))
		(move-lock ?card ?oldcard ?newcard))
	:effect (and
		(invalid )))

(:action move-copy
	:parameters (?card - object
		?oldcard - object
		?newcard - object)
	:precondition (and
		(move-lock ?card ?oldcard ?newcard)
		(clear-copy ?card)
		(clear-copy ?newcard)
		(canstack-copy ?card ?newcard)
		(on-copy ?card ?oldcard)
		(suit-copy ?oldcard ?card))
	:effect (and
		(not (move-lock ?card ?oldcard ?newcard))
		(unlock-origin-domain )
		(on-copy ?card ?newcard)
		(clear-copy ?oldcard)
		(not (on-copy ?card ?oldcard))
		(not (clear-copy ?newcard))
		(suit-copy ?card ?card)))

(:action move-b-stop-0
	:parameters (?card - object
		?newcard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (clear-copy ?card))
		(move-b-lock ?card ?newcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action move-b-stop-1
	:parameters (?card - object
		?newcard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (bottomcol-copy ?card))
		(move-b-lock ?card ?newcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action move-b-stop-2
	:parameters (?card - object
		?newcard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (clear-copy ?newcard))
		(move-b-lock ?card ?newcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action move-b-stop-3
	:parameters (?card - object
		?newcard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (canstack-copy ?card ?newcard))
		(move-b-lock ?card ?newcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action move-b-stop-4
	:parameters (?card - object
		?newcard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (colspace-copy ?cols))
		(move-b-lock ?card ?newcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action move-b-stop-5
	:parameters (?card - object
		?newcard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (successor-copy ?ncols ?cols))
		(move-b-lock ?card ?newcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action move-b-copy
	:parameters (?card - object
		?newcard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(move-b-lock ?card ?newcard ?cols ?ncols)
		(clear-copy ?card)
		(bottomcol-copy ?card)
		(clear-copy ?newcard)
		(canstack-copy ?card ?newcard)
		(colspace-copy ?cols)
		(successor-copy ?ncols ?cols))
	:effect (and
		(not (move-b-lock ?card ?newcard ?cols ?ncols))
		(unlock-origin-domain )
		(on-copy ?card ?newcard)
		(colspace-copy ?ncols)
		(not (bottomcol-copy ?card))
		(not (clear-copy ?newcard))
		(not (colspace-copy ?cols))))

(:action sendtofree-stop-0
	:parameters (?card - object
		?oldcard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (clear-copy ?card))
		(sendtofree-lock ?card ?oldcard ?cells ?ncells))
	:effect (and
		(invalid )))

(:action sendtofree-stop-1
	:parameters (?card - object
		?oldcard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (on-copy ?card ?oldcard))
		(sendtofree-lock ?card ?oldcard ?cells ?ncells))
	:effect (and
		(invalid )))

(:action sendtofree-stop-2
	:parameters (?card - object
		?oldcard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (cellspace-copy ?cells))
		(sendtofree-lock ?card ?oldcard ?cells ?ncells))
	:effect (and
		(invalid )))

(:action sendtofree-stop-3
	:parameters (?card - object
		?oldcard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (successor-copy ?cells ?ncells))
		(sendtofree-lock ?card ?oldcard ?cells ?ncells))
	:effect (and
		(invalid )))

(:action sendtofree-copy
	:parameters (?card - object
		?oldcard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(sendtofree-lock ?card ?oldcard ?cells ?ncells)
		(clear-copy ?card)
		(on-copy ?card ?oldcard)
		(cellspace-copy ?cells)
		(successor-copy ?cells ?ncells))
	:effect (and
		(not (sendtofree-lock ?card ?oldcard ?cells ?ncells))
		(unlock-origin-domain )
		(incell-copy ?card)
		(clear-copy ?oldcard)
		(cellspace-copy ?ncells)
		(not (on-copy ?card ?oldcard))
		(not (clear-copy ?card))
		(not (cellspace-copy ?cells))))

(:action sendtofree-b-stop-0
	:parameters (?card - object
		?cells - object
		?ncells - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (clear-copy ?card))
		(sendtofree-b-lock ?card ?cells ?ncells ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtofree-b-stop-1
	:parameters (?card - object
		?cells - object
		?ncells - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (bottomcol-copy ?card))
		(sendtofree-b-lock ?card ?cells ?ncells ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtofree-b-stop-2
	:parameters (?card - object
		?cells - object
		?ncells - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (cellspace-copy ?cells))
		(sendtofree-b-lock ?card ?cells ?ncells ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtofree-b-stop-3
	:parameters (?card - object
		?cells - object
		?ncells - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (successor-copy ?cells ?ncells))
		(sendtofree-b-lock ?card ?cells ?ncells ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtofree-b-stop-4
	:parameters (?card - object
		?cells - object
		?ncells - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (colspace-copy ?cols))
		(sendtofree-b-lock ?card ?cells ?ncells ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtofree-b-stop-5
	:parameters (?card - object
		?cells - object
		?ncells - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (successor-copy ?ncols ?cols))
		(sendtofree-b-lock ?card ?cells ?ncells ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtofree-b-copy
	:parameters (?card - object
		?cells - object
		?ncells - object
		?cols - object
		?ncols - object)
	:precondition (and
		(sendtofree-b-lock ?card ?cells ?ncells ?cols ?ncols)
		(clear-copy ?card)
		(bottomcol-copy ?card)
		(cellspace-copy ?cells)
		(successor-copy ?cells ?ncells)
		(colspace-copy ?cols)
		(successor-copy ?ncols ?cols))
	:effect (and
		(not (sendtofree-b-lock ?card ?cells ?ncells ?cols ?ncols))
		(unlock-origin-domain )
		(incell-copy ?card)
		(colspace-copy ?ncols)
		(cellspace-copy ?ncells)
		(not (bottomcol-copy ?card))
		(not (clear-copy ?card))
		(not (colspace-copy ?cols))))

(:action sendtonewcol-stop-0
	:parameters (?card - object
		?oldcard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (clear-copy ?card))
		(sendtonewcol-lock ?card ?oldcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtonewcol-stop-1
	:parameters (?card - object
		?oldcard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (colspace-copy ?cols))
		(sendtonewcol-lock ?card ?oldcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtonewcol-stop-2
	:parameters (?card - object
		?oldcard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (successor-copy ?cols ?ncols))
		(sendtonewcol-lock ?card ?oldcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtonewcol-stop-3
	:parameters (?card - object
		?oldcard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (on-copy ?card ?oldcard))
		(sendtonewcol-lock ?card ?oldcard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtonewcol-copy
	:parameters (?card - object
		?oldcard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(sendtonewcol-lock ?card ?oldcard ?cols ?ncols)
		(clear-copy ?card)
		(colspace-copy ?cols)
		(successor-copy ?cols ?ncols)
		(on-copy ?card ?oldcard))
	:effect (and
		(not (sendtonewcol-lock ?card ?oldcard ?cols ?ncols))
		(unlock-origin-domain )
		(bottomcol-copy ?card)
		(clear-copy ?oldcard)
		(colspace-copy ?ncols)
		(not (on-copy ?card ?oldcard))
		(not (colspace-copy ?cols))))

(:action sendtohome-stop-0
	:parameters (?card - object
		?oldcard - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object)
	:precondition (and
		(not (clear-copy ?card))
		(sendtohome-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard))
	:effect (and
		(invalid )))

(:action sendtohome-stop-1
	:parameters (?card - object
		?oldcard - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object)
	:precondition (and
		(not (on-copy ?card ?oldcard))
		(sendtohome-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard))
	:effect (and
		(invalid )))

(:action sendtohome-stop-2
	:parameters (?card - object
		?oldcard - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object)
	:precondition (and
		(not (home-copy ?homecard))
		(sendtohome-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard))
	:effect (and
		(invalid )))

(:action sendtohome-stop-3
	:parameters (?card - object
		?oldcard - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object)
	:precondition (and
		(not (suit-copy ?card ?suit))
		(sendtohome-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard))
	:effect (and
		(invalid )))

(:action sendtohome-stop-4
	:parameters (?card - object
		?oldcard - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object)
	:precondition (and
		(not (suit-copy ?homecard ?suit))
		(sendtohome-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard))
	:effect (and
		(invalid )))

(:action sendtohome-stop-5
	:parameters (?card - object
		?oldcard - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object)
	:precondition (and
		(not (value-copy ?card ?vcard))
		(sendtohome-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard))
	:effect (and
		(invalid )))

(:action sendtohome-stop-6
	:parameters (?card - object
		?oldcard - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object)
	:precondition (and
		(not (value-copy ?homecard ?vhomecard))
		(sendtohome-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard))
	:effect (and
		(invalid )))

(:action sendtohome-stop-7
	:parameters (?card - object
		?oldcard - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object)
	:precondition (and
		(not (successor-copy ?vcard ?vhomecard))
		(sendtohome-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard))
	:effect (and
		(invalid )))

(:action sendtohome-copy
	:parameters (?card - object
		?oldcard - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object)
	:precondition (and
		(sendtohome-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard)
		(clear-copy ?card)
		(on-copy ?card ?oldcard)
		(home-copy ?homecard)
		(suit-copy ?card ?suit)
		(suit-copy ?homecard ?suit)
		(value-copy ?card ?vcard)
		(value-copy ?homecard ?vhomecard)
		(successor-copy ?vcard ?vhomecard))
	:effect (and
		(not (sendtohome-lock ?card ?oldcard ?suit ?vcard ?homecard ?vhomecard))
		(unlock-origin-domain )
		(home-copy ?card)
		(clear-copy ?oldcard)
		(not (on-copy ?card ?oldcard))
		(not (home-copy ?homecard))
		(not (clear-copy ?card))))

(:action sendtohome-b-stop-0
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (clear-copy ?card))
		(sendtohome-b-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtohome-b-stop-1
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (bottomcol-copy ?card))
		(sendtohome-b-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtohome-b-stop-2
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (home-copy ?homecard))
		(sendtohome-b-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtohome-b-stop-3
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (suit-copy ?card ?suit))
		(sendtohome-b-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtohome-b-stop-4
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (suit-copy ?homecard ?suit))
		(sendtohome-b-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtohome-b-stop-5
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (value-copy ?card ?vcard))
		(sendtohome-b-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtohome-b-stop-6
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (value-copy ?homecard ?vhomecard))
		(sendtohome-b-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtohome-b-stop-7
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (successor-copy ?vcard ?vhomecard))
		(sendtohome-b-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtohome-b-stop-8
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (colspace-copy ?cols))
		(sendtohome-b-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtohome-b-stop-9
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(not (successor-copy ?ncols ?cols))
		(sendtohome-b-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cols ?ncols))
	:effect (and
		(invalid )))

(:action sendtohome-b-copy
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cols - object
		?ncols - object)
	:precondition (and
		(sendtohome-b-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cols ?ncols)
		(clear-copy ?card)
		(bottomcol-copy ?card)
		(home-copy ?homecard)
		(suit-copy ?card ?suit)
		(suit-copy ?homecard ?suit)
		(value-copy ?card ?vcard)
		(value-copy ?homecard ?vhomecard)
		(successor-copy ?vcard ?vhomecard)
		(colspace-copy ?cols)
		(successor-copy ?ncols ?cols))
	:effect (and
		(not (sendtohome-b-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cols ?ncols))
		(unlock-origin-domain )
		(home-copy ?card)
		(colspace-copy ?ncols)
		(not (home-copy ?homecard))
		(not (clear-copy ?card))
		(not (bottomcol-copy ?card))
		(not (colspace-copy ?cols))))

(:action homefromfreecell-stop-0
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (incell-copy ?card))
		(homefromfreecell-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cells ?ncells))
	:effect (and
		(invalid )))

(:action homefromfreecell-stop-1
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (home-copy ?homecard))
		(homefromfreecell-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cells ?ncells))
	:effect (and
		(invalid )))

(:action homefromfreecell-stop-2
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (suit-copy ?card ?suit))
		(homefromfreecell-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cells ?ncells))
	:effect (and
		(invalid )))

(:action homefromfreecell-stop-3
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (suit-copy ?homecard ?suit))
		(homefromfreecell-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cells ?ncells))
	:effect (and
		(invalid )))

(:action homefromfreecell-stop-4
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (value-copy ?card ?vcard))
		(homefromfreecell-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cells ?ncells))
	:effect (and
		(invalid )))

(:action homefromfreecell-stop-5
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (value-copy ?homecard ?vhomecard))
		(homefromfreecell-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cells ?ncells))
	:effect (and
		(invalid )))

(:action homefromfreecell-stop-6
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (successor-copy ?vcard ?vhomecard))
		(homefromfreecell-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cells ?ncells))
	:effect (and
		(invalid )))

(:action homefromfreecell-stop-7
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (cellspace-copy ?cells))
		(homefromfreecell-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cells ?ncells))
	:effect (and
		(invalid )))

(:action homefromfreecell-stop-8
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (successor-copy ?ncells ?cells))
		(homefromfreecell-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cells ?ncells))
	:effect (and
		(invalid )))

(:action homefromfreecell-copy
	:parameters (?card - object
		?suit - object
		?vcard - object
		?homecard - object
		?vhomecard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(homefromfreecell-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cells ?ncells)
		(incell-copy ?card)
		(home-copy ?homecard)
		(suit-copy ?card ?suit)
		(suit-copy ?homecard ?suit)
		(value-copy ?card ?vcard)
		(value-copy ?homecard ?vhomecard)
		(successor-copy ?vcard ?vhomecard)
		(cellspace-copy ?cells)
		(successor-copy ?ncells ?cells))
	:effect (and
		(not (homefromfreecell-lock ?card ?suit ?vcard ?homecard ?vhomecard ?cells ?ncells))
		(unlock-origin-domain )
		(home-copy ?card)
		(cellspace-copy ?ncells)
		(not (incell-copy ?card))
		(not (cellspace-copy ?cells))
		(not (home-copy ?homecard))))

(:action colfromfreecell-stop-0
	:parameters (?card - object
		?newcard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (incell-copy ?card))
		(colfromfreecell-lock ?card ?newcard ?cells ?ncells))
	:effect (and
		(invalid )))

(:action colfromfreecell-stop-1
	:parameters (?card - object
		?newcard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (clear-copy ?newcard))
		(colfromfreecell-lock ?card ?newcard ?cells ?ncells))
	:effect (and
		(invalid )))

(:action colfromfreecell-stop-2
	:parameters (?card - object
		?newcard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (canstack-copy ?card ?newcard))
		(colfromfreecell-lock ?card ?newcard ?cells ?ncells))
	:effect (and
		(invalid )))

(:action colfromfreecell-stop-3
	:parameters (?card - object
		?newcard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (cellspace-copy ?cells))
		(colfromfreecell-lock ?card ?newcard ?cells ?ncells))
	:effect (and
		(invalid )))

(:action colfromfreecell-stop-4
	:parameters (?card - object
		?newcard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (successor-copy ?ncells ?cells))
		(colfromfreecell-lock ?card ?newcard ?cells ?ncells))
	:effect (and
		(invalid )))

(:action colfromfreecell-copy
	:parameters (?card - object
		?newcard - object
		?cells - object
		?ncells - object)
	:precondition (and
		(colfromfreecell-lock ?card ?newcard ?cells ?ncells)
		(incell-copy ?card)
		(clear-copy ?newcard)
		(canstack-copy ?card ?newcard)
		(cellspace-copy ?cells)
		(successor-copy ?ncells ?cells))
	:effect (and
		(not (colfromfreecell-lock ?card ?newcard ?cells ?ncells))
		(unlock-origin-domain )
		(clear-copy ?card)
		(on-copy ?card ?newcard)
		(not (incell-copy ?card))
		(not (cellspace-copy ?cells))
		(not (clear-copy ?newcard))))

(:action newcolfromfreecell-stop-0
	:parameters (?card - object
		?cols - object
		?ncols - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (incell-copy ?card))
		(newcolfromfreecell-lock ?card ?cols ?ncols ?cells ?ncells))
	:effect (and
		(invalid )))

(:action newcolfromfreecell-stop-1
	:parameters (?card - object
		?cols - object
		?ncols - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (colspace-copy ?cols))
		(newcolfromfreecell-lock ?card ?cols ?ncols ?cells ?ncells))
	:effect (and
		(invalid )))

(:action newcolfromfreecell-stop-2
	:parameters (?card - object
		?cols - object
		?ncols - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (cellspace-copy ?cells))
		(newcolfromfreecell-lock ?card ?cols ?ncols ?cells ?ncells))
	:effect (and
		(invalid )))

(:action newcolfromfreecell-stop-3
	:parameters (?card - object
		?cols - object
		?ncols - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (successor-copy ?cols ?ncols))
		(newcolfromfreecell-lock ?card ?cols ?ncols ?cells ?ncells))
	:effect (and
		(invalid )))

(:action newcolfromfreecell-stop-4
	:parameters (?card - object
		?cols - object
		?ncols - object
		?cells - object
		?ncells - object)
	:precondition (and
		(not (successor-copy ?ncells ?cells))
		(newcolfromfreecell-lock ?card ?cols ?ncols ?cells ?ncells))
	:effect (and
		(invalid )))

(:action newcolfromfreecell-copy
	:parameters (?card - object
		?cols - object
		?ncols - object
		?cells - object
		?ncells - object)
	:precondition (and
		(newcolfromfreecell-lock ?card ?cols ?ncols ?cells ?ncells)
		(incell-copy ?card)
		(colspace-copy ?cols)
		(cellspace-copy ?cells)
		(successor-copy ?cols ?ncols)
		(successor-copy ?ncells ?cells))
	:effect (and
		(not (newcolfromfreecell-lock ?card ?cols ?ncols ?cells ?ncells))
		(unlock-origin-domain )
		(bottomcol-copy ?card)
		(clear-copy ?card)
		(colspace-copy ?ncols)
		(cellspace-copy ?ncells)
		(not (incell-copy ?card))
		(not (colspace-copy ?cols))
		(not (cellspace-copy ?cells))))

(:action turning
	:parameters ()
	:precondition (and
		(invalid ))
	:effect (and
		(unlock-origin-domain ))) )