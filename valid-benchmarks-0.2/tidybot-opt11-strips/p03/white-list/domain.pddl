(define (domain tidybot)
(:requirements :strips :typing :equality)
(:types
	object
	robot - object
	cart - object
	object - object
	xc - object
	yc - object
	xrel - object
	yrel - object)
(:constants )
(:predicates
	(leftof ?x1 - xc ?x2 - xc)
	(above ?y1 - yc ?y2 - yc)
	(leftof-rel ?x1 - xrel ?x2 - xrel)
	(above-rel ?y1 - yrel ?y2 - yrel)
	(sum-x ?x - xc ?xr - xrel ?xsum - xc)
	(sum-y ?y - yc ?yr - yrel ?ysum - yc)
	(zerox-rel ?x - xrel)
	(zeroy-rel ?y - yrel)
	(object-goal ?o - object ?x - xc ?y - yc)
	(parked ?r - robot)
	(base-pos ?r - robot ?x - xc ?y - yc)
	(base-obstacle ?x - xc ?y - yc)
	(object-pos ?o - object ?x - xc ?y - yc)
	(object-done ?o - object)
	(surface ?x - xc ?y - yc)
	(holding ?r - robot ?o - object)
	(gripper-empty ?r - robot)
	(gripper-rel ?r - robot ?x - xrel ?y - yrel)
	(gripper-obstacle ?x - xc ?y - yc)
	(pushing ?r - robot ?c - cart)
	(not-pushing ?r - robot)
	(not-pushed ?c - cart)
	(cart-pos ?c - cart ?x - xc ?y - yc)
	(on-cart ?o - object ?c - cart)
	(= ?x - object ?y - object)
	(leftof-copy ?x1 - xc ?x2 - xc)
	(above-copy ?y1 - yc ?y2 - yc)
	(leftof-rel-copy ?x1 - xrel ?x2 - xrel)
	(above-rel-copy ?y1 - yrel ?y2 - yrel)
	(sum-x-copy ?x - xc ?xr - xrel ?xsum - xc)
	(sum-y-copy ?y - yc ?yr - yrel ?ysum - yc)
	(zerox-rel-copy ?x - xrel)
	(zeroy-rel-copy ?y - yrel)
	(object-goal-copy ?o - object ?x - xc ?y - yc)
	(parked-copy ?r - robot)
	(base-pos-copy ?r - robot ?x - xc ?y - yc)
	(base-obstacle-copy ?x - xc ?y - yc)
	(object-pos-copy ?o - object ?x - xc ?y - yc)
	(object-done-copy ?o - object)
	(surface-copy ?x - xc ?y - yc)
	(holding-copy ?r - robot ?o - object)
	(gripper-empty-copy ?r - robot)
	(gripper-rel-copy ?r - robot ?x - xrel ?y - yrel)
	(gripper-obstacle-copy ?x - xc ?y - yc)
	(pushing-copy ?r - robot ?c - cart)
	(not-pushing-copy ?r - robot)
	(not-pushed-copy ?c - cart)
	(cart-pos-copy ?c - cart ?x - xc ?y - yc)
	(on-cart-copy ?o - object ?c - cart)
	(=-copy ?x - object ?y - object)
	(invalid )
	(unlock-origin-domain )
	(unpark-lock ?r - robot ?x - xrel ?y - yrel)
	(park-lock ?r - robot)
	(base-left-lock ?r - robot ?cx - xc ?dx - xc ?y - yc)
	(base-right-lock ?r - robot ?cx - xc ?dx - xc ?y - yc)
	(base-up-lock ?r - robot ?x - xc ?cy - yc ?dy - yc)
	(base-down-lock ?r - robot ?x - xc ?cy - yc ?dy - yc)
	(base-cart-left-lock ?r - robot ?c - cart ?x1 - xc ?x2 - xc ?y - yc ?cx1 - xc ?cx2 - xc ?cy - yc)
	(base-cart-right-lock ?r - robot ?c - cart ?x1 - xc ?x2 - xc ?y - yc ?cx1 - xc ?cx2 - xc ?cy - yc)
	(base-cart-up-lock ?r - robot ?c - cart ?x - xc ?y1 - yc ?y2 - yc ?cx - xc ?cy1 - yc ?cy2 - yc)
	(base-cart-down-lock ?r - robot ?c - cart ?x - xc ?y1 - yc ?y2 - yc ?cx - xc ?cy1 - yc ?cy2 - yc)
	(gripper-left-lock ?r - robot ?basex - xc ?basey - yc ?cgxrel - xrel ?dgxrel - xrel ?cgxabs - xc ?dgxabs - xc ?gyrel - yrel ?gyabs - yc)
	(gripper-right-lock ?r - robot ?basex - xc ?basey - yc ?cgxrel - xrel ?dgxrel - xrel ?cgxabs - xc ?dgxabs - xc ?gyrel - yrel ?gyabs - yc)
	(gripper-up-lock ?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?cgyrel - yrel ?dgyrel - yrel ?cgyabs - yc ?dgyabs - yc)
	(gripper-down-lock ?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?cgyrel - yrel ?dgyrel - yrel ?cgyabs - yc ?dgyabs - yc)
	(grasp-cart-left-lock ?r - robot ?c - cart ?x - xc ?y - yc ?cx - xc)
	(grasp-cart-right-lock ?r - robot ?c - cart ?x - xc ?y - yc ?cx - xc)
	(grasp-cart-above-lock ?r - robot ?c - cart ?x - xc ?y - yc ?cy - yc)
	(grasp-cart-below-lock ?r - robot ?c - cart ?x - xc ?y - yc ?cy - yc)
	(ungrasp-cart-lock ?r - robot ?c - cart)
	(get-left-lock ?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?gyrel - yrel ?gyabs - yc ?o - object ?ox - xc)
	(get-right-lock ?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?gyrel - yrel ?gyabs - yc ?o - object ?ox - xc)
	(get-up-lock ?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?gyrel - yrel ?gyabs - yc ?o - object ?oy - yc)
	(get-down-lock ?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?gyrel - yrel ?gyabs - yc ?o - object ?oy - yc)
	(get-from-cart-lock ?r - robot ?x - xc ?y - yc ?gxrel - xrel ?gyrel - yrel ?o - object ?c - cart ?cx - xc ?cy - yc)
	(put-left-lock ?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?gyrel - yrel ?gyabs - yc ?o - object ?ox - xc)
	(put-right-lock ?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?gyrel - yrel ?gyabs - yc ?o - object ?ox - xc)
	(put-up-lock ?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?gyrel - yrel ?gyabs - yc ?o - object ?oy - yc)
	(put-down-lock ?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?gyrel - yrel ?gyabs - yc ?o - object ?oy - yc)
	(put-on-cart-lock ?r - robot ?x - xc ?y - yc ?gxrel - xrel ?gyrel - yrel ?o - object ?c - cart ?cx - xc ?cy - yc)
	(finish-object-lock ?o - object ?x - xc ?y - yc))
(:functions )
(:action unpark
	:parameters (?r - robot
		?x - xrel
		?y - yrel)
	:precondition (and
		(parked ?r)
		(gripper-rel ?r ?x ?y)
		(zerox-rel ?x)
		(zeroy-rel ?y)
		(unlock-origin-domain ))
	:effect (and
		(not (parked ?r))
		(unpark-lock ?r ?x ?y)
		(not (unlock-origin-domain ))))

(:action park
	:parameters (?r - robot)
	:precondition (and
		(not (parked ?r))
		(not-pushing ?r)
		(unlock-origin-domain ))
	:effect (and
		(parked ?r)
		(park-lock ?r)
		(not (unlock-origin-domain ))))

(:action base-left
	:parameters (?r - robot
		?cx - xc
		?dx - xc
		?y - yc)
	:precondition (and
		(not (parked ?r))
		(not-pushing ?r)
		(leftof ?dx ?cx)
		(base-pos ?r ?cx ?y)
		(not (base-obstacle ?dx ?y))
		(unlock-origin-domain ))
	:effect (and
		(not (base-pos ?r ?cx ?y))
		(base-pos ?r ?dx ?y)
		(not (base-obstacle ?cx ?y))
		(base-obstacle ?dx ?y)
		(base-left-lock ?r ?cx ?dx ?y)
		(not (unlock-origin-domain ))))

(:action base-right
	:parameters (?r - robot
		?cx - xc
		?dx - xc
		?y - yc)
	:precondition (and
		(not (parked ?r))
		(not-pushing ?r)
		(leftof ?cx ?dx)
		(base-pos ?r ?cx ?y)
		(not (base-obstacle ?dx ?y))
		(unlock-origin-domain ))
	:effect (and
		(not (base-pos ?r ?cx ?y))
		(base-pos ?r ?dx ?y)
		(not (base-obstacle ?cx ?y))
		(base-obstacle ?dx ?y)
		(base-right-lock ?r ?cx ?dx ?y)
		(not (unlock-origin-domain ))))

(:action base-up
	:parameters (?r - robot
		?x - xc
		?cy - yc
		?dy - yc)
	:precondition (and
		(not (parked ?r))
		(not-pushing ?r)
		(above ?dy ?cy)
		(base-pos ?r ?x ?cy)
		(not (base-obstacle ?x ?dy))
		(unlock-origin-domain ))
	:effect (and
		(not (base-pos ?r ?x ?cy))
		(base-pos ?r ?x ?dy)
		(not (base-obstacle ?x ?cy))
		(base-obstacle ?x ?dy)
		(base-up-lock ?r ?x ?cy ?dy)
		(not (unlock-origin-domain ))))

(:action base-down
	:parameters (?r - robot
		?x - xc
		?cy - yc
		?dy - yc)
	:precondition (and
		(not (parked ?r))
		(not-pushing ?r)
		(above ?cy ?dy)
		(base-pos ?r ?x ?cy)
		(not (base-obstacle ?x ?dy))
		(unlock-origin-domain ))
	:effect (and
		(not (base-pos ?r ?x ?cy))
		(base-pos ?r ?x ?dy)
		(not (base-obstacle ?x ?cy))
		(base-obstacle ?x ?dy)
		(base-down-lock ?r ?x ?cy ?dy)
		(not (unlock-origin-domain ))))

(:action base-cart-left
	:parameters (?r - robot
		?c - cart
		?x1 - xc
		?x2 - xc
		?y - yc
		?cx1 - xc
		?cx2 - xc
		?cy - yc)
	:precondition (and
		(pushing ?r ?c)
		(leftof ?x2 ?x1)
		(leftof ?cx2 ?cx1)
		(base-pos ?r ?x1 ?y)
		(cart-pos ?c ?cx1 ?cy)
		(not (base-obstacle ?x2 ?y))
		(not (base-obstacle ?cx2 ?cy))
		(unlock-origin-domain ))
	:effect (and
		(not (base-pos ?r ?x1 ?y))
		(base-pos ?r ?x2 ?y)
		(not (cart-pos ?c ?cx1 ?cy))
		(cart-pos ?c ?cx2 ?cy)
		(not (base-obstacle ?x1 ?y))
		(base-obstacle ?x2 ?y)
		(not (base-obstacle ?cx1 ?cy))
		(base-obstacle ?cx2 ?cy)
		(base-cart-left-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy)
		(not (unlock-origin-domain ))))

(:action base-cart-right
	:parameters (?r - robot
		?c - cart
		?x1 - xc
		?x2 - xc
		?y - yc
		?cx1 - xc
		?cx2 - xc
		?cy - yc)
	:precondition (and
		(pushing ?r ?c)
		(leftof ?x1 ?x2)
		(leftof ?cx1 ?cx2)
		(base-pos ?r ?x1 ?y)
		(cart-pos ?c ?cx1 ?cy)
		(not (base-obstacle ?x2 ?y))
		(not (base-obstacle ?cx2 ?cy))
		(unlock-origin-domain ))
	:effect (and
		(not (base-pos ?r ?x1 ?y))
		(base-pos ?r ?x2 ?y)
		(not (cart-pos ?c ?cx1 ?cy))
		(cart-pos ?c ?cx2 ?cy)
		(not (base-obstacle ?x1 ?y))
		(base-obstacle ?x2 ?y)
		(not (base-obstacle ?cx1 ?cy))
		(base-obstacle ?cx2 ?cy)
		(base-cart-right-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy)
		(not (unlock-origin-domain ))))

(:action base-cart-up
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(pushing ?r ?c)
		(above ?y2 ?y1)
		(above ?cy2 ?cy1)
		(base-pos ?r ?x ?y1)
		(cart-pos ?c ?cx ?cy1)
		(not (base-obstacle ?x ?y2))
		(not (base-obstacle ?cx ?cy2))
		(unlock-origin-domain ))
	:effect (and
		(not (base-pos ?r ?x ?y1))
		(base-pos ?r ?x ?y2)
		(not (cart-pos ?c ?cx ?cy1))
		(cart-pos ?c ?cx ?cy2)
		(not (base-obstacle ?x ?y1))
		(base-obstacle ?x ?y2)
		(base-obstacle ?cx ?cy2)
		(base-cart-up-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2)
		(not (unlock-origin-domain ))))

(:action base-cart-down
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(pushing ?r ?c)
		(above ?y1 ?y2)
		(above ?cy1 ?cy2)
		(base-pos ?r ?x ?y1)
		(cart-pos ?c ?cx ?cy1)
		(not (base-obstacle ?x ?y2))
		(not (base-obstacle ?cx ?cy2))
		(unlock-origin-domain ))
	:effect (and
		(not (base-pos ?r ?x ?y1))
		(base-pos ?r ?x ?y2)
		(not (cart-pos ?c ?cx ?cy1))
		(cart-pos ?c ?cx ?cy2)
		(not (base-obstacle ?x ?y1))
		(base-obstacle ?x ?y2)
		(base-obstacle ?cx ?cy2)
		(base-cart-down-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2)
		(not (unlock-origin-domain ))))

(:action gripper-left
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(parked ?r)
		(base-pos ?r ?basex ?basey)
		(gripper-rel ?r ?cgxrel ?gyrel)
		(leftof-rel ?dgxrel ?cgxrel)
		(sum-x ?basex ?cgxrel ?cgxabs)
		(sum-x ?basex ?dgxrel ?dgxabs)
		(sum-y ?basey ?gyrel ?gyabs)
		(not (gripper-obstacle ?dgxabs ?gyabs))
		(unlock-origin-domain ))
	:effect (and
		(not (gripper-rel ?r ?cgxrel ?gyrel))
		(gripper-rel ?r ?dgxrel ?gyrel)
		(not (gripper-obstacle ?cgxabs ?gyabs))
		(gripper-obstacle ?dgxabs ?gyabs)
		(gripper-left-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs)
		(not (unlock-origin-domain ))))

(:action gripper-right
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(parked ?r)
		(base-pos ?r ?basex ?basey)
		(gripper-rel ?r ?cgxrel ?gyrel)
		(leftof-rel ?cgxrel ?dgxrel)
		(sum-x ?basex ?cgxrel ?cgxabs)
		(sum-x ?basex ?dgxrel ?dgxabs)
		(sum-y ?basey ?gyrel ?gyabs)
		(not (gripper-obstacle ?dgxabs ?gyabs))
		(unlock-origin-domain ))
	:effect (and
		(not (gripper-rel ?r ?cgxrel ?gyrel))
		(gripper-rel ?r ?dgxrel ?gyrel)
		(not (gripper-obstacle ?cgxabs ?gyabs))
		(gripper-obstacle ?dgxabs ?gyabs)
		(gripper-right-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs)
		(not (unlock-origin-domain ))))

(:action gripper-up
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(parked ?r)
		(base-pos ?r ?basex ?basey)
		(gripper-rel ?r ?gxrel ?cgyrel)
		(above-rel ?dgyrel ?cgyrel)
		(sum-x ?basex ?gxrel ?gxabs)
		(sum-y ?basey ?cgyrel ?cgyabs)
		(sum-y ?basey ?dgyrel ?dgyabs)
		(not (gripper-obstacle ?gxabs ?dgyabs))
		(unlock-origin-domain ))
	:effect (and
		(not (gripper-rel ?r ?gxrel ?cgyrel))
		(gripper-rel ?r ?gxrel ?dgyrel)
		(not (gripper-obstacle ?gxabs ?cgyabs))
		(gripper-obstacle ?gxabs ?dgyabs)
		(gripper-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs)
		(not (unlock-origin-domain ))))

(:action gripper-down
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(parked ?r)
		(base-pos ?r ?basex ?basey)
		(gripper-rel ?r ?gxrel ?cgyrel)
		(above-rel ?cgyrel ?dgyrel)
		(sum-x ?basex ?gxrel ?gxabs)
		(sum-y ?basey ?cgyrel ?cgyabs)
		(sum-y ?basey ?dgyrel ?dgyabs)
		(not (gripper-obstacle ?gxabs ?dgyabs))
		(unlock-origin-domain ))
	:effect (and
		(not (gripper-rel ?r ?gxrel ?cgyrel))
		(gripper-rel ?r ?gxrel ?dgyrel)
		(not (gripper-obstacle ?gxabs ?cgyabs))
		(gripper-obstacle ?gxabs ?dgyabs)
		(gripper-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs)
		(not (unlock-origin-domain ))))

(:action grasp-cart-left
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cx - xc)
	:precondition (and
		(not (parked ?r))
		(not-pushed ?c)
		(base-pos ?r ?x ?y)
		(cart-pos ?c ?cx ?y)
		(leftof ?cx ?x)
		(not-pushing ?r)
		(unlock-origin-domain ))
	:effect (and
		(pushing ?r ?c)
		(not (not-pushing ?r))
		(not (not-pushed ?c))
		(grasp-cart-left-lock ?r ?c ?x ?y ?cx)
		(not (unlock-origin-domain ))))

(:action grasp-cart-right
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cx - xc)
	:precondition (and
		(not (parked ?r))
		(not-pushed ?c)
		(base-pos ?r ?x ?y)
		(cart-pos ?c ?cx ?y)
		(leftof ?x ?cx)
		(not-pushing ?r)
		(unlock-origin-domain ))
	:effect (and
		(pushing ?r ?c)
		(not (not-pushing ?r))
		(not (not-pushed ?c))
		(grasp-cart-right-lock ?r ?c ?x ?y ?cx)
		(not (unlock-origin-domain ))))

(:action grasp-cart-above
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cy - yc)
	:precondition (and
		(not (parked ?r))
		(not-pushed ?c)
		(base-pos ?r ?x ?y)
		(cart-pos ?c ?x ?cy)
		(above ?cy ?y)
		(not-pushing ?r)
		(unlock-origin-domain ))
	:effect (and
		(pushing ?r ?c)
		(not (not-pushing ?r))
		(not (not-pushed ?c))
		(grasp-cart-above-lock ?r ?c ?x ?y ?cy)
		(not (unlock-origin-domain ))))

(:action grasp-cart-below
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cy - yc)
	:precondition (and
		(not (parked ?r))
		(not-pushed ?c)
		(base-pos ?r ?x ?y)
		(cart-pos ?c ?x ?cy)
		(above ?y ?cy)
		(not-pushing ?r)
		(unlock-origin-domain ))
	:effect (and
		(pushing ?r ?c)
		(not (not-pushing ?r))
		(not (not-pushed ?c))
		(grasp-cart-below-lock ?r ?c ?x ?y ?cy)
		(not (unlock-origin-domain ))))

(:action ungrasp-cart
	:parameters (?r - robot
		?c - cart)
	:precondition (and
		(pushing ?r ?c)
		(unlock-origin-domain ))
	:effect (and
		(not (pushing ?r ?c))
		(not-pushing ?r)
		(not-pushed ?c)
		(ungrasp-cart-lock ?r ?c)
		(not (unlock-origin-domain ))))

(:action get-left
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(parked ?r)
		(base-pos ?r ?basex ?basey)
		(gripper-rel ?r ?gxrel ?gyrel)
		(sum-x ?basex ?gxrel ?gxabs)
		(sum-y ?basey ?gyrel ?gyabs)
		(gripper-empty ?r)
		(leftof ?ox ?gxabs)
		(not (object-done ?o))
		(object-pos ?o ?ox ?gyabs)
		(unlock-origin-domain ))
	:effect (and
		(not (object-pos ?o ?ox ?gyabs))
		(not (gripper-obstacle ?ox ?gyabs))
		(not (gripper-empty ?r))
		(holding ?r ?o)
		(get-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox)
		(not (unlock-origin-domain ))))

(:action get-right
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(parked ?r)
		(base-pos ?r ?basex ?basey)
		(gripper-rel ?r ?gxrel ?gyrel)
		(sum-x ?basex ?gxrel ?gxabs)
		(sum-y ?basey ?gyrel ?gyabs)
		(gripper-empty ?r)
		(leftof ?gxabs ?ox)
		(not (object-done ?o))
		(object-pos ?o ?ox ?gyabs)
		(unlock-origin-domain ))
	:effect (and
		(not (object-pos ?o ?ox ?gyabs))
		(not (gripper-obstacle ?ox ?gyabs))
		(not (gripper-empty ?r))
		(holding ?r ?o)
		(get-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox)
		(not (unlock-origin-domain ))))

(:action get-up
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(parked ?r)
		(base-pos ?r ?basex ?basey)
		(gripper-rel ?r ?gxrel ?gyrel)
		(sum-x ?basex ?gxrel ?gxabs)
		(sum-y ?basey ?gyrel ?gyabs)
		(gripper-empty ?r)
		(above ?oy ?gyabs)
		(not (object-done ?o))
		(object-pos ?o ?gxabs ?oy)
		(unlock-origin-domain ))
	:effect (and
		(not (object-pos ?o ?gxabs ?oy))
		(not (gripper-obstacle ?gxabs ?oy))
		(not (gripper-empty ?r))
		(holding ?r ?o)
		(get-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy)
		(not (unlock-origin-domain ))))

(:action get-down
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(parked ?r)
		(base-pos ?r ?basex ?basey)
		(gripper-rel ?r ?gxrel ?gyrel)
		(sum-x ?basex ?gxrel ?gxabs)
		(sum-y ?basey ?gyrel ?gyabs)
		(gripper-empty ?r)
		(above ?gyabs ?oy)
		(not (object-done ?o))
		(object-pos ?o ?gxabs ?oy)
		(unlock-origin-domain ))
	:effect (and
		(not (object-pos ?o ?gxabs ?oy))
		(not (gripper-obstacle ?gxabs ?oy))
		(not (gripper-empty ?r))
		(holding ?r ?o)
		(get-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy)
		(not (unlock-origin-domain ))))

(:action get-from-cart
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(parked ?r)
		(base-pos ?r ?x ?y)
		(gripper-rel ?r ?gxrel ?gyrel)
		(sum-x ?x ?gxrel ?cx)
		(sum-y ?y ?gyrel ?cy)
		(gripper-empty ?r)
		(cart-pos ?c ?cx ?cy)
		(on-cart ?o ?c)
		(unlock-origin-domain ))
	:effect (and
		(holding ?r ?o)
		(not (gripper-empty ?r))
		(not (on-cart ?o ?c))
		(get-from-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy)
		(not (unlock-origin-domain ))))

(:action put-left
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(parked ?r)
		(base-pos ?r ?basex ?basey)
		(gripper-rel ?r ?gxrel ?gyrel)
		(sum-x ?basex ?gxrel ?gxabs)
		(sum-y ?basey ?gyrel ?gyabs)
		(holding ?r ?o)
		(leftof ?ox ?gxabs)
		(not (gripper-obstacle ?ox ?gyabs))
		(surface ?ox ?gyabs)
		(unlock-origin-domain ))
	:effect (and
		(not (holding ?r ?o))
		(object-pos ?o ?ox ?gyabs)
		(gripper-obstacle ?ox ?gyabs)
		(gripper-empty ?r)
		(put-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox)
		(not (unlock-origin-domain ))))

(:action put-right
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(parked ?r)
		(base-pos ?r ?basex ?basey)
		(gripper-rel ?r ?gxrel ?gyrel)
		(sum-x ?basex ?gxrel ?gxabs)
		(sum-y ?basey ?gyrel ?gyabs)
		(holding ?r ?o)
		(leftof ?gxabs ?ox)
		(not (gripper-obstacle ?ox ?gyabs))
		(surface ?ox ?gyabs)
		(unlock-origin-domain ))
	:effect (and
		(not (holding ?r ?o))
		(object-pos ?o ?ox ?gyabs)
		(gripper-obstacle ?ox ?gyabs)
		(gripper-empty ?r)
		(put-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox)
		(not (unlock-origin-domain ))))

(:action put-up
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(parked ?r)
		(base-pos ?r ?basex ?basey)
		(gripper-rel ?r ?gxrel ?gyrel)
		(sum-x ?basex ?gxrel ?gxabs)
		(sum-y ?basey ?gyrel ?gyabs)
		(holding ?r ?o)
		(above ?oy ?gyabs)
		(not (gripper-obstacle ?gxabs ?oy))
		(surface ?gxabs ?oy)
		(unlock-origin-domain ))
	:effect (and
		(not (holding ?r ?o))
		(object-pos ?o ?gxabs ?oy)
		(gripper-obstacle ?gxabs ?oy)
		(gripper-empty ?r)
		(put-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy)
		(not (unlock-origin-domain ))))

(:action put-down
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(parked ?r)
		(base-pos ?r ?basex ?basey)
		(gripper-rel ?r ?gxrel ?gyrel)
		(sum-x ?basex ?gxrel ?gxabs)
		(sum-y ?basey ?gyrel ?gyabs)
		(holding ?r ?o)
		(above ?gyabs ?oy)
		(not (gripper-obstacle ?gxabs ?oy))
		(surface ?gxabs ?oy)
		(unlock-origin-domain ))
	:effect (and
		(not (holding ?r ?o))
		(object-pos ?o ?gxabs ?oy)
		(gripper-obstacle ?gxabs ?oy)
		(gripper-empty ?r)
		(put-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy)
		(not (unlock-origin-domain ))))

(:action put-on-cart
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(parked ?r)
		(base-pos ?r ?x ?y)
		(gripper-rel ?r ?gxrel ?gyrel)
		(sum-x ?x ?gxrel ?cx)
		(sum-y ?y ?gyrel ?cy)
		(cart-pos ?c ?cx ?cy)
		(holding ?r ?o)
		(unlock-origin-domain ))
	:effect (and
		(not (holding ?r ?o))
		(on-cart ?o ?c)
		(gripper-empty ?r)
		(put-on-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy)
		(not (unlock-origin-domain ))))

(:action finish-object
	:parameters (?o - object
		?x - xc
		?y - yc)
	:precondition (and
		(not (object-done ?o))
		(object-pos ?o ?x ?y)
		(object-goal ?o ?x ?y)
		(unlock-origin-domain ))
	:effect (and
		(object-done ?o)
		(finish-object-lock ?o ?x ?y)
		(not (unlock-origin-domain ))))

(:action unpark-stop-0
	:parameters (?r - robot
		?x - xrel
		?y - yrel)
	:precondition (and
		(not (parked-copy ?r))
		(unpark-lock ?r ?x ?y))
	:effect (and
		(invalid )))

(:action unpark-stop-1
	:parameters (?r - robot
		?x - xrel
		?y - yrel)
	:precondition (and
		(not (gripper-rel-copy ?r ?x ?y))
		(unpark-lock ?r ?x ?y))
	:effect (and
		(invalid )))

(:action unpark-stop-2
	:parameters (?r - robot
		?x - xrel
		?y - yrel)
	:precondition (and
		(not (zerox-rel-copy ?x))
		(unpark-lock ?r ?x ?y))
	:effect (and
		(invalid )))

(:action unpark-stop-3
	:parameters (?r - robot
		?x - xrel
		?y - yrel)
	:precondition (and
		(not (zeroy-rel-copy ?y))
		(unpark-lock ?r ?x ?y))
	:effect (and
		(invalid )))

(:action unpark-copy
	:parameters (?r - robot
		?x - xrel
		?y - yrel)
	:precondition (and
		(unpark-lock ?r ?x ?y)
		(parked-copy ?r)
		(gripper-rel-copy ?r ?x ?y)
		(zerox-rel-copy ?x)
		(zeroy-rel-copy ?y))
	:effect (and
		(not (unpark-lock ?r ?x ?y))
		(unlock-origin-domain )
		(not (parked-copy ?r))))

(:action park-stop-0
	:parameters (?r - robot)
	:precondition (and
		(parked-copy ?r)
		(park-lock ?r))
	:effect (and
		(invalid )))

(:action park-stop-1
	:parameters (?r - robot)
	:precondition (and
		(not (not-pushing-copy ?r))
		(park-lock ?r))
	:effect (and
		(invalid )))

(:action park-copy
	:parameters (?r - robot)
	:precondition (and
		(park-lock ?r)
		(not (parked-copy ?r))
		(not-pushing-copy ?r))
	:effect (and
		(not (park-lock ?r))
		(unlock-origin-domain )
		(parked-copy ?r)))

(:action base-left-stop-0
	:parameters (?r - robot
		?cx - xc
		?dx - xc
		?y - yc)
	:precondition (and
		(parked-copy ?r)
		(base-left-lock ?r ?cx ?dx ?y))
	:effect (and
		(invalid )))

(:action base-left-stop-1
	:parameters (?r - robot
		?cx - xc
		?dx - xc
		?y - yc)
	:precondition (and
		(not (not-pushing-copy ?r))
		(base-left-lock ?r ?cx ?dx ?y))
	:effect (and
		(invalid )))

(:action base-left-stop-2
	:parameters (?r - robot
		?cx - xc
		?dx - xc
		?y - yc)
	:precondition (and
		(not (leftof-copy ?dx ?cx))
		(base-left-lock ?r ?cx ?dx ?y))
	:effect (and
		(invalid )))

(:action base-left-stop-3
	:parameters (?r - robot
		?cx - xc
		?dx - xc
		?y - yc)
	:precondition (and
		(not (base-pos-copy ?r ?cx ?y))
		(base-left-lock ?r ?cx ?dx ?y))
	:effect (and
		(invalid )))

(:action base-left-stop-4
	:parameters (?r - robot
		?cx - xc
		?dx - xc
		?y - yc)
	:precondition (and
		(base-obstacle-copy ?dx ?y)
		(base-left-lock ?r ?cx ?dx ?y))
	:effect (and
		(invalid )))

(:action base-left-copy
	:parameters (?r - robot
		?cx - xc
		?dx - xc
		?y - yc)
	:precondition (and
		(base-left-lock ?r ?cx ?dx ?y)
		(not (parked-copy ?r))
		(not-pushing-copy ?r)
		(leftof-copy ?dx ?cx)
		(base-pos-copy ?r ?cx ?y)
		(not (base-obstacle-copy ?dx ?y)))
	:effect (and
		(not (base-left-lock ?r ?cx ?dx ?y))
		(unlock-origin-domain )
		(not (base-pos-copy ?r ?cx ?y))
		(base-pos-copy ?r ?dx ?y)
		(not (base-obstacle-copy ?cx ?y))
		(base-obstacle-copy ?dx ?y)))

(:action base-right-stop-0
	:parameters (?r - robot
		?cx - xc
		?dx - xc
		?y - yc)
	:precondition (and
		(parked-copy ?r)
		(base-right-lock ?r ?cx ?dx ?y))
	:effect (and
		(invalid )))

(:action base-right-stop-1
	:parameters (?r - robot
		?cx - xc
		?dx - xc
		?y - yc)
	:precondition (and
		(not (not-pushing-copy ?r))
		(base-right-lock ?r ?cx ?dx ?y))
	:effect (and
		(invalid )))

(:action base-right-stop-2
	:parameters (?r - robot
		?cx - xc
		?dx - xc
		?y - yc)
	:precondition (and
		(not (leftof-copy ?cx ?dx))
		(base-right-lock ?r ?cx ?dx ?y))
	:effect (and
		(invalid )))

(:action base-right-stop-3
	:parameters (?r - robot
		?cx - xc
		?dx - xc
		?y - yc)
	:precondition (and
		(not (base-pos-copy ?r ?cx ?y))
		(base-right-lock ?r ?cx ?dx ?y))
	:effect (and
		(invalid )))

(:action base-right-stop-4
	:parameters (?r - robot
		?cx - xc
		?dx - xc
		?y - yc)
	:precondition (and
		(base-obstacle-copy ?dx ?y)
		(base-right-lock ?r ?cx ?dx ?y))
	:effect (and
		(invalid )))

(:action base-right-copy
	:parameters (?r - robot
		?cx - xc
		?dx - xc
		?y - yc)
	:precondition (and
		(base-right-lock ?r ?cx ?dx ?y)
		(not (parked-copy ?r))
		(not-pushing-copy ?r)
		(leftof-copy ?cx ?dx)
		(base-pos-copy ?r ?cx ?y)
		(not (base-obstacle-copy ?dx ?y)))
	:effect (and
		(not (base-right-lock ?r ?cx ?dx ?y))
		(unlock-origin-domain )
		(not (base-pos-copy ?r ?cx ?y))
		(base-pos-copy ?r ?dx ?y)
		(not (base-obstacle-copy ?cx ?y))
		(base-obstacle-copy ?dx ?y)))

(:action base-up-stop-0
	:parameters (?r - robot
		?x - xc
		?cy - yc
		?dy - yc)
	:precondition (and
		(parked-copy ?r)
		(base-up-lock ?r ?x ?cy ?dy))
	:effect (and
		(invalid )))

(:action base-up-stop-1
	:parameters (?r - robot
		?x - xc
		?cy - yc
		?dy - yc)
	:precondition (and
		(not (not-pushing-copy ?r))
		(base-up-lock ?r ?x ?cy ?dy))
	:effect (and
		(invalid )))

(:action base-up-stop-2
	:parameters (?r - robot
		?x - xc
		?cy - yc
		?dy - yc)
	:precondition (and
		(not (above-copy ?dy ?cy))
		(base-up-lock ?r ?x ?cy ?dy))
	:effect (and
		(invalid )))

(:action base-up-stop-3
	:parameters (?r - robot
		?x - xc
		?cy - yc
		?dy - yc)
	:precondition (and
		(not (base-pos-copy ?r ?x ?cy))
		(base-up-lock ?r ?x ?cy ?dy))
	:effect (and
		(invalid )))

(:action base-up-stop-4
	:parameters (?r - robot
		?x - xc
		?cy - yc
		?dy - yc)
	:precondition (and
		(base-obstacle-copy ?x ?dy)
		(base-up-lock ?r ?x ?cy ?dy))
	:effect (and
		(invalid )))

(:action base-up-copy
	:parameters (?r - robot
		?x - xc
		?cy - yc
		?dy - yc)
	:precondition (and
		(base-up-lock ?r ?x ?cy ?dy)
		(not (parked-copy ?r))
		(not-pushing-copy ?r)
		(above-copy ?dy ?cy)
		(base-pos-copy ?r ?x ?cy)
		(not (base-obstacle-copy ?x ?dy)))
	:effect (and
		(not (base-up-lock ?r ?x ?cy ?dy))
		(unlock-origin-domain )
		(not (base-pos-copy ?r ?x ?cy))
		(base-pos-copy ?r ?x ?dy)
		(not (base-obstacle-copy ?x ?cy))
		(base-obstacle-copy ?x ?dy)))

(:action base-down-stop-0
	:parameters (?r - robot
		?x - xc
		?cy - yc
		?dy - yc)
	:precondition (and
		(parked-copy ?r)
		(base-down-lock ?r ?x ?cy ?dy))
	:effect (and
		(invalid )))

(:action base-down-stop-1
	:parameters (?r - robot
		?x - xc
		?cy - yc
		?dy - yc)
	:precondition (and
		(not (not-pushing-copy ?r))
		(base-down-lock ?r ?x ?cy ?dy))
	:effect (and
		(invalid )))

(:action base-down-stop-2
	:parameters (?r - robot
		?x - xc
		?cy - yc
		?dy - yc)
	:precondition (and
		(not (above-copy ?cy ?dy))
		(base-down-lock ?r ?x ?cy ?dy))
	:effect (and
		(invalid )))

(:action base-down-stop-3
	:parameters (?r - robot
		?x - xc
		?cy - yc
		?dy - yc)
	:precondition (and
		(not (base-pos-copy ?r ?x ?cy))
		(base-down-lock ?r ?x ?cy ?dy))
	:effect (and
		(invalid )))

(:action base-down-stop-4
	:parameters (?r - robot
		?x - xc
		?cy - yc
		?dy - yc)
	:precondition (and
		(base-obstacle-copy ?x ?dy)
		(base-down-lock ?r ?x ?cy ?dy))
	:effect (and
		(invalid )))

(:action base-down-copy
	:parameters (?r - robot
		?x - xc
		?cy - yc
		?dy - yc)
	:precondition (and
		(base-down-lock ?r ?x ?cy ?dy)
		(not (parked-copy ?r))
		(not-pushing-copy ?r)
		(above-copy ?cy ?dy)
		(base-pos-copy ?r ?x ?cy)
		(not (base-obstacle-copy ?x ?dy)))
	:effect (and
		(not (base-down-lock ?r ?x ?cy ?dy))
		(unlock-origin-domain )
		(not (base-pos-copy ?r ?x ?cy))
		(base-pos-copy ?r ?x ?dy)
		(not (base-obstacle-copy ?x ?cy))))

(:action base-cart-left-stop-0
	:parameters (?r - robot
		?c - cart
		?x1 - xc
		?x2 - xc
		?y - yc
		?cx1 - xc
		?cx2 - xc
		?cy - yc)
	:precondition (and
		(not (pushing-copy ?r ?c))
		(base-cart-left-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy))
	:effect (and
		(invalid )))

(:action base-cart-left-stop-1
	:parameters (?r - robot
		?c - cart
		?x1 - xc
		?x2 - xc
		?y - yc
		?cx1 - xc
		?cx2 - xc
		?cy - yc)
	:precondition (and
		(not (leftof-copy ?x2 ?x1))
		(base-cart-left-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy))
	:effect (and
		(invalid )))

(:action base-cart-left-stop-2
	:parameters (?r - robot
		?c - cart
		?x1 - xc
		?x2 - xc
		?y - yc
		?cx1 - xc
		?cx2 - xc
		?cy - yc)
	:precondition (and
		(not (leftof-copy ?cx2 ?cx1))
		(base-cart-left-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy))
	:effect (and
		(invalid )))

(:action base-cart-left-stop-3
	:parameters (?r - robot
		?c - cart
		?x1 - xc
		?x2 - xc
		?y - yc
		?cx1 - xc
		?cx2 - xc
		?cy - yc)
	:precondition (and
		(not (base-pos-copy ?r ?x1 ?y))
		(base-cart-left-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy))
	:effect (and
		(invalid )))

(:action base-cart-left-stop-4
	:parameters (?r - robot
		?c - cart
		?x1 - xc
		?x2 - xc
		?y - yc
		?cx1 - xc
		?cx2 - xc
		?cy - yc)
	:precondition (and
		(not (cart-pos-copy ?c ?cx1 ?cy))
		(base-cart-left-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy))
	:effect (and
		(invalid )))

(:action base-cart-left-stop-5
	:parameters (?r - robot
		?c - cart
		?x1 - xc
		?x2 - xc
		?y - yc
		?cx1 - xc
		?cx2 - xc
		?cy - yc)
	:precondition (and
		(base-obstacle-copy ?x2 ?y)
		(base-cart-left-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy))
	:effect (and
		(invalid )))

(:action base-cart-left-stop-6
	:parameters (?r - robot
		?c - cart
		?x1 - xc
		?x2 - xc
		?y - yc
		?cx1 - xc
		?cx2 - xc
		?cy - yc)
	:precondition (and
		(base-obstacle-copy ?cx2 ?cy)
		(base-cart-left-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy))
	:effect (and
		(invalid )))

(:action base-cart-left-copy
	:parameters (?r - robot
		?c - cart
		?x1 - xc
		?x2 - xc
		?y - yc
		?cx1 - xc
		?cx2 - xc
		?cy - yc)
	:precondition (and
		(base-cart-left-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy)
		(pushing-copy ?r ?c)
		(leftof-copy ?x2 ?x1)
		(leftof-copy ?cx2 ?cx1)
		(base-pos-copy ?r ?x1 ?y)
		(cart-pos-copy ?c ?cx1 ?cy)
		(not (base-obstacle-copy ?x2 ?y))
		(not (base-obstacle-copy ?cx2 ?cy)))
	:effect (and
		(not (base-cart-left-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy))
		(unlock-origin-domain )
		(not (base-pos-copy ?r ?x1 ?y))
		(base-pos-copy ?r ?x2 ?y)
		(not (cart-pos-copy ?c ?cx1 ?cy))
		(cart-pos-copy ?c ?cx2 ?cy)
		(not (base-obstacle-copy ?x1 ?y))
		(base-obstacle-copy ?x2 ?y)
		(not (base-obstacle-copy ?cx1 ?cy))
		(base-obstacle-copy ?cx2 ?cy)))

(:action base-cart-right-stop-0
	:parameters (?r - robot
		?c - cart
		?x1 - xc
		?x2 - xc
		?y - yc
		?cx1 - xc
		?cx2 - xc
		?cy - yc)
	:precondition (and
		(not (pushing-copy ?r ?c))
		(base-cart-right-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy))
	:effect (and
		(invalid )))

(:action base-cart-right-stop-1
	:parameters (?r - robot
		?c - cart
		?x1 - xc
		?x2 - xc
		?y - yc
		?cx1 - xc
		?cx2 - xc
		?cy - yc)
	:precondition (and
		(not (leftof-copy ?x1 ?x2))
		(base-cart-right-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy))
	:effect (and
		(invalid )))

(:action base-cart-right-stop-2
	:parameters (?r - robot
		?c - cart
		?x1 - xc
		?x2 - xc
		?y - yc
		?cx1 - xc
		?cx2 - xc
		?cy - yc)
	:precondition (and
		(not (leftof-copy ?cx1 ?cx2))
		(base-cart-right-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy))
	:effect (and
		(invalid )))

(:action base-cart-right-stop-3
	:parameters (?r - robot
		?c - cart
		?x1 - xc
		?x2 - xc
		?y - yc
		?cx1 - xc
		?cx2 - xc
		?cy - yc)
	:precondition (and
		(not (base-pos-copy ?r ?x1 ?y))
		(base-cart-right-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy))
	:effect (and
		(invalid )))

(:action base-cart-right-stop-4
	:parameters (?r - robot
		?c - cart
		?x1 - xc
		?x2 - xc
		?y - yc
		?cx1 - xc
		?cx2 - xc
		?cy - yc)
	:precondition (and
		(not (cart-pos-copy ?c ?cx1 ?cy))
		(base-cart-right-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy))
	:effect (and
		(invalid )))

(:action base-cart-right-stop-5
	:parameters (?r - robot
		?c - cart
		?x1 - xc
		?x2 - xc
		?y - yc
		?cx1 - xc
		?cx2 - xc
		?cy - yc)
	:precondition (and
		(base-obstacle-copy ?x2 ?y)
		(base-cart-right-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy))
	:effect (and
		(invalid )))

(:action base-cart-right-stop-6
	:parameters (?r - robot
		?c - cart
		?x1 - xc
		?x2 - xc
		?y - yc
		?cx1 - xc
		?cx2 - xc
		?cy - yc)
	:precondition (and
		(base-obstacle-copy ?cx2 ?cy)
		(base-cart-right-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy))
	:effect (and
		(invalid )))

(:action base-cart-right-copy
	:parameters (?r - robot
		?c - cart
		?x1 - xc
		?x2 - xc
		?y - yc
		?cx1 - xc
		?cx2 - xc
		?cy - yc)
	:precondition (and
		(base-cart-right-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy)
		(pushing-copy ?r ?c)
		(leftof-copy ?x1 ?x2)
		(leftof-copy ?cx1 ?cx2)
		(base-pos-copy ?r ?x1 ?y)
		(cart-pos-copy ?c ?cx1 ?cy)
		(not (base-obstacle-copy ?x2 ?y))
		(not (base-obstacle-copy ?cx2 ?cy)))
	:effect (and
		(not (base-cart-right-lock ?r ?c ?x1 ?x2 ?y ?cx1 ?cx2 ?cy))
		(unlock-origin-domain )
		(not (base-pos-copy ?r ?x1 ?y))
		(base-pos-copy ?r ?x2 ?y)
		(not (cart-pos-copy ?c ?cx1 ?cy))
		(cart-pos-copy ?c ?cx2 ?cy)
		(not (base-obstacle-copy ?x1 ?y))
		(base-obstacle-copy ?x2 ?y)
		(not (base-obstacle-copy ?cx1 ?cy))
		(base-obstacle-copy ?cx2 ?cy)))

(:action base-cart-up-stop-0
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(not (pushing-copy ?r ?c))
		(base-cart-up-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2))
	:effect (and
		(invalid )))

(:action base-cart-up-stop-1
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(not (above-copy ?y2 ?y1))
		(base-cart-up-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2))
	:effect (and
		(invalid )))

(:action base-cart-up-stop-2
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(not (above-copy ?cy2 ?cy1))
		(base-cart-up-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2))
	:effect (and
		(invalid )))

(:action base-cart-up-stop-3
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(not (base-pos-copy ?r ?x ?y1))
		(base-cart-up-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2))
	:effect (and
		(invalid )))

(:action base-cart-up-stop-4
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(not (cart-pos-copy ?c ?cx ?cy1))
		(base-cart-up-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2))
	:effect (and
		(invalid )))

(:action base-cart-up-stop-5
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(base-obstacle-copy ?x ?y2)
		(base-cart-up-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2))
	:effect (and
		(invalid )))

(:action base-cart-up-stop-6
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(base-obstacle-copy ?cx ?cy2)
		(base-cart-up-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2))
	:effect (and
		(invalid )))

(:action base-cart-up-stop-7
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(surface-copy ?cx ?y1)
		(base-cart-up-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2))
	:effect (and
		(invalid )))

(:action base-cart-up-copy
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(base-cart-up-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2)
		(pushing-copy ?r ?c)
		(above-copy ?y2 ?y1)
		(above-copy ?cy2 ?cy1)
		(base-pos-copy ?r ?x ?y1)
		(cart-pos-copy ?c ?cx ?cy1)
		(not (base-obstacle-copy ?x ?y2))
		(not (base-obstacle-copy ?cx ?cy2))
		(not (surface-copy ?cx ?y1)))
	:effect (and
		(not (base-cart-up-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2))
		(unlock-origin-domain )
		(not (base-pos-copy ?r ?x ?y1))
		(base-pos-copy ?r ?x ?y2)
		(not (cart-pos-copy ?c ?cx ?cy1))
		(cart-pos-copy ?c ?cx ?cy2)
		(not (base-obstacle-copy ?x ?y1))
		(base-obstacle-copy ?x ?y2)
		(base-obstacle-copy ?cx ?cy2)))

(:action base-cart-down-stop-0
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(not (pushing-copy ?r ?c))
		(base-cart-down-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2))
	:effect (and
		(invalid )))

(:action base-cart-down-stop-1
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(not (above-copy ?y1 ?y2))
		(base-cart-down-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2))
	:effect (and
		(invalid )))

(:action base-cart-down-stop-2
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(not (above-copy ?cy1 ?cy2))
		(base-cart-down-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2))
	:effect (and
		(invalid )))

(:action base-cart-down-stop-3
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(not (base-pos-copy ?r ?x ?y1))
		(base-cart-down-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2))
	:effect (and
		(invalid )))

(:action base-cart-down-stop-4
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(not (cart-pos-copy ?c ?cx ?cy1))
		(base-cart-down-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2))
	:effect (and
		(invalid )))

(:action base-cart-down-stop-5
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(base-obstacle-copy ?x ?y2)
		(base-cart-down-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2))
	:effect (and
		(invalid )))

(:action base-cart-down-stop-6
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(base-obstacle-copy ?cx ?cy2)
		(base-cart-down-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2))
	:effect (and
		(invalid )))

(:action base-cart-down-copy
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y1 - yc
		?y2 - yc
		?cx - xc
		?cy1 - yc
		?cy2 - yc)
	:precondition (and
		(base-cart-down-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2)
		(pushing-copy ?r ?c)
		(above-copy ?y1 ?y2)
		(above-copy ?cy1 ?cy2)
		(base-pos-copy ?r ?x ?y1)
		(cart-pos-copy ?c ?cx ?cy1)
		(not (base-obstacle-copy ?x ?y2))
		(not (base-obstacle-copy ?cx ?cy2)))
	:effect (and
		(not (base-cart-down-lock ?r ?c ?x ?y1 ?y2 ?cx ?cy1 ?cy2))
		(unlock-origin-domain )
		(not (base-pos-copy ?r ?x ?y1))
		(base-pos-copy ?r ?x ?y2)
		(not (cart-pos-copy ?c ?cx ?cy1))
		(cart-pos-copy ?c ?cx ?cy2)
		(not (base-obstacle-copy ?x ?y1))
		(base-obstacle-copy ?x ?y2)
		(base-obstacle-copy ?cx ?cy2)))

(:action gripper-left-stop-0
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(not (parked-copy ?r))
		(gripper-left-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
	:effect (and
		(invalid )))

(:action gripper-left-stop-1
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(not (base-pos-copy ?r ?basex ?basey))
		(gripper-left-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
	:effect (and
		(invalid )))

(:action gripper-left-stop-2
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(not (gripper-rel-copy ?r ?cgxrel ?gyrel))
		(gripper-left-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
	:effect (and
		(invalid )))

(:action gripper-left-stop-3
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(not (leftof-rel-copy ?dgxrel ?cgxrel))
		(gripper-left-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
	:effect (and
		(invalid )))

(:action gripper-left-stop-4
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(not (sum-x-copy ?basex ?cgxrel ?cgxabs))
		(gripper-left-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
	:effect (and
		(invalid )))

(:action gripper-left-stop-5
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(not (sum-x-copy ?basex ?dgxrel ?dgxabs))
		(gripper-left-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
	:effect (and
		(invalid )))

(:action gripper-left-stop-6
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(not (sum-y-copy ?basey ?gyrel ?gyabs))
		(gripper-left-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
	:effect (and
		(invalid )))

(:action gripper-left-stop-7
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(gripper-obstacle-copy ?dgxabs ?gyabs)
		(gripper-left-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
	:effect (and
		(invalid )))

(:action gripper-left-copy
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(gripper-left-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs)
		(parked-copy ?r)
		(base-pos-copy ?r ?basex ?basey)
		(gripper-rel-copy ?r ?cgxrel ?gyrel)
		(leftof-rel-copy ?dgxrel ?cgxrel)
		(sum-x-copy ?basex ?cgxrel ?cgxabs)
		(sum-x-copy ?basex ?dgxrel ?dgxabs)
		(sum-y-copy ?basey ?gyrel ?gyabs)
		(not (gripper-obstacle-copy ?dgxabs ?gyabs)))
	:effect (and
		(not (gripper-left-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
		(unlock-origin-domain )
		(not (gripper-rel-copy ?r ?cgxrel ?gyrel))
		(gripper-rel-copy ?r ?dgxrel ?gyrel)
		(not (gripper-obstacle-copy ?cgxabs ?gyabs))
		(gripper-obstacle-copy ?dgxabs ?gyabs)))

(:action gripper-right-stop-0
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(not (parked-copy ?r))
		(gripper-right-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
	:effect (and
		(invalid )))

(:action gripper-right-stop-1
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(not (base-pos-copy ?r ?basex ?basey))
		(gripper-right-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
	:effect (and
		(invalid )))

(:action gripper-right-stop-2
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(not (gripper-rel-copy ?r ?cgxrel ?gyrel))
		(gripper-right-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
	:effect (and
		(invalid )))

(:action gripper-right-stop-3
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(not (leftof-rel-copy ?cgxrel ?dgxrel))
		(gripper-right-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
	:effect (and
		(invalid )))

(:action gripper-right-stop-4
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(not (sum-x-copy ?basex ?cgxrel ?cgxabs))
		(gripper-right-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
	:effect (and
		(invalid )))

(:action gripper-right-stop-5
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(not (sum-x-copy ?basex ?dgxrel ?dgxabs))
		(gripper-right-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
	:effect (and
		(invalid )))

(:action gripper-right-stop-6
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(not (sum-y-copy ?basey ?gyrel ?gyabs))
		(gripper-right-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
	:effect (and
		(invalid )))

(:action gripper-right-stop-7
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(gripper-obstacle-copy ?dgxabs ?gyabs)
		(gripper-right-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
	:effect (and
		(invalid )))

(:action gripper-right-stop-8
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(not (leftof-copy ?basex ?basex))
		(gripper-right-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
	:effect (and
		(invalid )))

(:action gripper-right-copy
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?cgxrel - xrel
		?dgxrel - xrel
		?cgxabs - xc
		?dgxabs - xc
		?gyrel - yrel
		?gyabs - yc)
	:precondition (and
		(gripper-right-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs)
		(parked-copy ?r)
		(base-pos-copy ?r ?basex ?basey)
		(gripper-rel-copy ?r ?cgxrel ?gyrel)
		(leftof-rel-copy ?cgxrel ?dgxrel)
		(sum-x-copy ?basex ?cgxrel ?cgxabs)
		(sum-x-copy ?basex ?dgxrel ?dgxabs)
		(sum-y-copy ?basey ?gyrel ?gyabs)
		(not (gripper-obstacle-copy ?dgxabs ?gyabs))
		(leftof-copy ?basex ?basex))
	:effect (and
		(not (gripper-right-lock ?r ?basex ?basey ?cgxrel ?dgxrel ?cgxabs ?dgxabs ?gyrel ?gyabs))
		(unlock-origin-domain )
		(gripper-rel-copy ?r ?dgxrel ?gyrel)
		(not (gripper-obstacle-copy ?cgxabs ?gyabs))
		(gripper-obstacle-copy ?dgxabs ?gyabs)))

(:action gripper-up-stop-0
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(not (parked-copy ?r))
		(gripper-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs))
	:effect (and
		(invalid )))

(:action gripper-up-stop-1
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(not (base-pos-copy ?r ?basex ?basey))
		(gripper-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs))
	:effect (and
		(invalid )))

(:action gripper-up-stop-2
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(not (gripper-rel-copy ?r ?gxrel ?cgyrel))
		(gripper-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs))
	:effect (and
		(invalid )))

(:action gripper-up-stop-3
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(not (above-rel-copy ?dgyrel ?cgyrel))
		(gripper-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs))
	:effect (and
		(invalid )))

(:action gripper-up-stop-4
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(not (sum-x-copy ?basex ?gxrel ?gxabs))
		(gripper-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs))
	:effect (and
		(invalid )))

(:action gripper-up-stop-5
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(not (sum-y-copy ?basey ?cgyrel ?cgyabs))
		(gripper-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs))
	:effect (and
		(invalid )))

(:action gripper-up-stop-6
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(not (sum-y-copy ?basey ?dgyrel ?dgyabs))
		(gripper-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs))
	:effect (and
		(invalid )))

(:action gripper-up-stop-7
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(gripper-obstacle-copy ?gxabs ?dgyabs)
		(gripper-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs))
	:effect (and
		(invalid )))

(:action gripper-up-copy
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(gripper-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs)
		(parked-copy ?r)
		(base-pos-copy ?r ?basex ?basey)
		(gripper-rel-copy ?r ?gxrel ?cgyrel)
		(above-rel-copy ?dgyrel ?cgyrel)
		(sum-x-copy ?basex ?gxrel ?gxabs)
		(sum-y-copy ?basey ?cgyrel ?cgyabs)
		(sum-y-copy ?basey ?dgyrel ?dgyabs)
		(not (gripper-obstacle-copy ?gxabs ?dgyabs)))
	:effect (and
		(not (gripper-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs))
		(unlock-origin-domain )
		(not (gripper-rel-copy ?r ?gxrel ?cgyrel))
		(gripper-rel-copy ?r ?gxrel ?dgyrel)
		(not (gripper-obstacle-copy ?gxabs ?cgyabs))
		(gripper-obstacle-copy ?gxabs ?dgyabs)))

(:action gripper-down-stop-0
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(not (parked-copy ?r))
		(gripper-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs))
	:effect (and
		(invalid )))

(:action gripper-down-stop-1
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(not (base-pos-copy ?r ?basex ?basey))
		(gripper-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs))
	:effect (and
		(invalid )))

(:action gripper-down-stop-2
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(not (gripper-rel-copy ?r ?gxrel ?cgyrel))
		(gripper-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs))
	:effect (and
		(invalid )))

(:action gripper-down-stop-3
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(not (above-rel-copy ?cgyrel ?dgyrel))
		(gripper-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs))
	:effect (and
		(invalid )))

(:action gripper-down-stop-4
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(not (sum-x-copy ?basex ?gxrel ?gxabs))
		(gripper-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs))
	:effect (and
		(invalid )))

(:action gripper-down-stop-5
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(not (sum-y-copy ?basey ?cgyrel ?cgyabs))
		(gripper-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs))
	:effect (and
		(invalid )))

(:action gripper-down-stop-6
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(not (sum-y-copy ?basey ?dgyrel ?dgyabs))
		(gripper-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs))
	:effect (and
		(invalid )))

(:action gripper-down-stop-7
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(gripper-obstacle-copy ?gxabs ?dgyabs)
		(gripper-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs))
	:effect (and
		(invalid )))

(:action gripper-down-copy
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?cgyrel - yrel
		?dgyrel - yrel
		?cgyabs - yc
		?dgyabs - yc)
	:precondition (and
		(gripper-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs)
		(parked-copy ?r)
		(base-pos-copy ?r ?basex ?basey)
		(gripper-rel-copy ?r ?gxrel ?cgyrel)
		(above-rel-copy ?cgyrel ?dgyrel)
		(sum-x-copy ?basex ?gxrel ?gxabs)
		(sum-y-copy ?basey ?cgyrel ?cgyabs)
		(sum-y-copy ?basey ?dgyrel ?dgyabs)
		(not (gripper-obstacle-copy ?gxabs ?dgyabs)))
	:effect (and
		(not (gripper-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?cgyrel ?dgyrel ?cgyabs ?dgyabs))
		(unlock-origin-domain )
		(not (gripper-rel-copy ?r ?gxrel ?cgyrel))
		(gripper-rel-copy ?r ?gxrel ?dgyrel)
		(not (gripper-obstacle-copy ?gxabs ?cgyabs))
		(gripper-obstacle-copy ?gxabs ?dgyabs)))

(:action grasp-cart-left-stop-0
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cx - xc)
	:precondition (and
		(parked-copy ?r)
		(grasp-cart-left-lock ?r ?c ?x ?y ?cx))
	:effect (and
		(invalid )))

(:action grasp-cart-left-stop-1
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cx - xc)
	:precondition (and
		(not (not-pushed-copy ?c))
		(grasp-cart-left-lock ?r ?c ?x ?y ?cx))
	:effect (and
		(invalid )))

(:action grasp-cart-left-stop-2
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cx - xc)
	:precondition (and
		(not (base-pos-copy ?r ?x ?y))
		(grasp-cart-left-lock ?r ?c ?x ?y ?cx))
	:effect (and
		(invalid )))

(:action grasp-cart-left-stop-3
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cx - xc)
	:precondition (and
		(not (cart-pos-copy ?c ?cx ?y))
		(grasp-cart-left-lock ?r ?c ?x ?y ?cx))
	:effect (and
		(invalid )))

(:action grasp-cart-left-stop-4
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cx - xc)
	:precondition (and
		(not (leftof-copy ?cx ?x))
		(grasp-cart-left-lock ?r ?c ?x ?y ?cx))
	:effect (and
		(invalid )))

(:action grasp-cart-left-stop-5
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cx - xc)
	:precondition (and
		(not (not-pushing-copy ?r))
		(grasp-cart-left-lock ?r ?c ?x ?y ?cx))
	:effect (and
		(invalid )))

(:action grasp-cart-left-copy
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cx - xc)
	:precondition (and
		(grasp-cart-left-lock ?r ?c ?x ?y ?cx)
		(not (parked-copy ?r))
		(not-pushed-copy ?c)
		(base-pos-copy ?r ?x ?y)
		(cart-pos-copy ?c ?cx ?y)
		(leftof-copy ?cx ?x)
		(not-pushing-copy ?r))
	:effect (and
		(not (grasp-cart-left-lock ?r ?c ?x ?y ?cx))
		(unlock-origin-domain )
		(pushing-copy ?r ?c)
		(not (not-pushing-copy ?r))
		(not (not-pushed-copy ?c))
		(surface-copy ?cx ?y)))

(:action grasp-cart-right-stop-0
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cx - xc)
	:precondition (and
		(parked-copy ?r)
		(grasp-cart-right-lock ?r ?c ?x ?y ?cx))
	:effect (and
		(invalid )))

(:action grasp-cart-right-stop-1
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cx - xc)
	:precondition (and
		(not (not-pushed-copy ?c))
		(grasp-cart-right-lock ?r ?c ?x ?y ?cx))
	:effect (and
		(invalid )))

(:action grasp-cart-right-stop-2
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cx - xc)
	:precondition (and
		(not (base-pos-copy ?r ?x ?y))
		(grasp-cart-right-lock ?r ?c ?x ?y ?cx))
	:effect (and
		(invalid )))

(:action grasp-cart-right-stop-3
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cx - xc)
	:precondition (and
		(not (cart-pos-copy ?c ?cx ?y))
		(grasp-cart-right-lock ?r ?c ?x ?y ?cx))
	:effect (and
		(invalid )))

(:action grasp-cart-right-stop-4
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cx - xc)
	:precondition (and
		(not (leftof-copy ?x ?cx))
		(grasp-cart-right-lock ?r ?c ?x ?y ?cx))
	:effect (and
		(invalid )))

(:action grasp-cart-right-stop-5
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cx - xc)
	:precondition (and
		(not (not-pushing-copy ?r))
		(grasp-cart-right-lock ?r ?c ?x ?y ?cx))
	:effect (and
		(invalid )))

(:action grasp-cart-right-copy
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cx - xc)
	:precondition (and
		(grasp-cart-right-lock ?r ?c ?x ?y ?cx)
		(not (parked-copy ?r))
		(not-pushed-copy ?c)
		(base-pos-copy ?r ?x ?y)
		(cart-pos-copy ?c ?cx ?y)
		(leftof-copy ?x ?cx)
		(not-pushing-copy ?r))
	:effect (and
		(not (grasp-cart-right-lock ?r ?c ?x ?y ?cx))
		(unlock-origin-domain )
		(pushing-copy ?r ?c)
		(not (not-pushing-copy ?r))
		(not (not-pushed-copy ?c))
		(not (gripper-obstacle-copy ?cx ?y))
		(cart-pos-copy ?c ?x ?y)))

(:action grasp-cart-above-stop-0
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cy - yc)
	:precondition (and
		(parked-copy ?r)
		(grasp-cart-above-lock ?r ?c ?x ?y ?cy))
	:effect (and
		(invalid )))

(:action grasp-cart-above-stop-1
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cy - yc)
	:precondition (and
		(not (not-pushed-copy ?c))
		(grasp-cart-above-lock ?r ?c ?x ?y ?cy))
	:effect (and
		(invalid )))

(:action grasp-cart-above-stop-2
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cy - yc)
	:precondition (and
		(not (base-pos-copy ?r ?x ?y))
		(grasp-cart-above-lock ?r ?c ?x ?y ?cy))
	:effect (and
		(invalid )))

(:action grasp-cart-above-stop-3
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cy - yc)
	:precondition (and
		(not (cart-pos-copy ?c ?x ?cy))
		(grasp-cart-above-lock ?r ?c ?x ?y ?cy))
	:effect (and
		(invalid )))

(:action grasp-cart-above-stop-4
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cy - yc)
	:precondition (and
		(not (above-copy ?cy ?y))
		(grasp-cart-above-lock ?r ?c ?x ?y ?cy))
	:effect (and
		(invalid )))

(:action grasp-cart-above-stop-5
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cy - yc)
	:precondition (and
		(not (not-pushing-copy ?r))
		(grasp-cart-above-lock ?r ?c ?x ?y ?cy))
	:effect (and
		(invalid )))

(:action grasp-cart-above-copy
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cy - yc)
	:precondition (and
		(grasp-cart-above-lock ?r ?c ?x ?y ?cy)
		(not (parked-copy ?r))
		(not-pushed-copy ?c)
		(base-pos-copy ?r ?x ?y)
		(cart-pos-copy ?c ?x ?cy)
		(above-copy ?cy ?y)
		(not-pushing-copy ?r))
	:effect (and
		(not (grasp-cart-above-lock ?r ?c ?x ?y ?cy))
		(unlock-origin-domain )
		(pushing-copy ?r ?c)
		(not (not-pushing-copy ?r))
		(not (base-pos-copy ?r ?x ?y))))

(:action grasp-cart-below-stop-0
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cy - yc)
	:precondition (and
		(parked-copy ?r)
		(grasp-cart-below-lock ?r ?c ?x ?y ?cy))
	:effect (and
		(invalid )))

(:action grasp-cart-below-stop-1
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cy - yc)
	:precondition (and
		(not (not-pushed-copy ?c))
		(grasp-cart-below-lock ?r ?c ?x ?y ?cy))
	:effect (and
		(invalid )))

(:action grasp-cart-below-stop-2
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cy - yc)
	:precondition (and
		(not (base-pos-copy ?r ?x ?y))
		(grasp-cart-below-lock ?r ?c ?x ?y ?cy))
	:effect (and
		(invalid )))

(:action grasp-cart-below-stop-3
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cy - yc)
	:precondition (and
		(not (cart-pos-copy ?c ?x ?cy))
		(grasp-cart-below-lock ?r ?c ?x ?y ?cy))
	:effect (and
		(invalid )))

(:action grasp-cart-below-stop-4
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cy - yc)
	:precondition (and
		(not (above-copy ?y ?cy))
		(grasp-cart-below-lock ?r ?c ?x ?y ?cy))
	:effect (and
		(invalid )))

(:action grasp-cart-below-stop-5
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cy - yc)
	:precondition (and
		(not (not-pushing-copy ?r))
		(grasp-cart-below-lock ?r ?c ?x ?y ?cy))
	:effect (and
		(invalid )))

(:action grasp-cart-below-copy
	:parameters (?r - robot
		?c - cart
		?x - xc
		?y - yc
		?cy - yc)
	:precondition (and
		(grasp-cart-below-lock ?r ?c ?x ?y ?cy)
		(not (parked-copy ?r))
		(not-pushed-copy ?c)
		(base-pos-copy ?r ?x ?y)
		(cart-pos-copy ?c ?x ?cy)
		(above-copy ?y ?cy)
		(not-pushing-copy ?r))
	:effect (and
		(not (grasp-cart-below-lock ?r ?c ?x ?y ?cy))
		(unlock-origin-domain )
		(pushing-copy ?r ?c)
		(not (not-pushing-copy ?r))
		(not (not-pushed-copy ?c))))

(:action ungrasp-cart-stop-0
	:parameters (?r - robot
		?c - cart)
	:precondition (and
		(not (pushing-copy ?r ?c))
		(ungrasp-cart-lock ?r ?c))
	:effect (and
		(invalid )))

(:action ungrasp-cart-copy
	:parameters (?r - robot
		?c - cart)
	:precondition (and
		(ungrasp-cart-lock ?r ?c)
		(pushing-copy ?r ?c))
	:effect (and
		(not (ungrasp-cart-lock ?r ?c))
		(unlock-origin-domain )
		(not (pushing-copy ?r ?c))
		(not-pushing-copy ?r)
		(not-pushed-copy ?c)))

(:action get-left-stop-0
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (parked-copy ?r))
		(get-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action get-left-stop-1
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (base-pos-copy ?r ?basex ?basey))
		(get-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action get-left-stop-2
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (gripper-rel-copy ?r ?gxrel ?gyrel))
		(get-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action get-left-stop-3
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (sum-x-copy ?basex ?gxrel ?gxabs))
		(get-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action get-left-stop-4
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (sum-y-copy ?basey ?gyrel ?gyabs))
		(get-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action get-left-stop-5
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (gripper-empty-copy ?r))
		(get-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action get-left-stop-6
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (leftof-copy ?ox ?gxabs))
		(get-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action get-left-stop-7
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(object-done-copy ?o)
		(get-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action get-left-stop-8
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (object-pos-copy ?o ?ox ?gyabs))
		(get-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action get-left-copy
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(get-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox)
		(parked-copy ?r)
		(base-pos-copy ?r ?basex ?basey)
		(gripper-rel-copy ?r ?gxrel ?gyrel)
		(sum-x-copy ?basex ?gxrel ?gxabs)
		(sum-y-copy ?basey ?gyrel ?gyabs)
		(gripper-empty-copy ?r)
		(leftof-copy ?ox ?gxabs)
		(not (object-done-copy ?o))
		(object-pos-copy ?o ?ox ?gyabs))
	:effect (and
		(not (get-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
		(unlock-origin-domain )
		(not (object-pos-copy ?o ?ox ?gyabs))
		(not (gripper-obstacle-copy ?ox ?gyabs))
		(not (gripper-empty-copy ?r))
		(holding-copy ?r ?o)))

(:action get-right-stop-0
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (parked-copy ?r))
		(get-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action get-right-stop-1
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (base-pos-copy ?r ?basex ?basey))
		(get-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action get-right-stop-2
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (gripper-rel-copy ?r ?gxrel ?gyrel))
		(get-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action get-right-stop-3
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (sum-x-copy ?basex ?gxrel ?gxabs))
		(get-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action get-right-stop-4
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (sum-y-copy ?basey ?gyrel ?gyabs))
		(get-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action get-right-stop-5
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (gripper-empty-copy ?r))
		(get-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action get-right-stop-6
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (leftof-copy ?gxabs ?ox))
		(get-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action get-right-stop-7
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(object-done-copy ?o)
		(get-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action get-right-stop-8
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (object-pos-copy ?o ?ox ?gyabs))
		(get-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action get-right-copy
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(get-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox)
		(parked-copy ?r)
		(base-pos-copy ?r ?basex ?basey)
		(gripper-rel-copy ?r ?gxrel ?gyrel)
		(sum-x-copy ?basex ?gxrel ?gxabs)
		(sum-y-copy ?basey ?gyrel ?gyabs)
		(gripper-empty-copy ?r)
		(leftof-copy ?gxabs ?ox)
		(not (object-done-copy ?o))
		(object-pos-copy ?o ?ox ?gyabs))
	:effect (and
		(not (get-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
		(unlock-origin-domain )
		(not (object-pos-copy ?o ?ox ?gyabs))
		(not (gripper-obstacle-copy ?ox ?gyabs))
		(not (gripper-empty-copy ?r))
		(holding-copy ?r ?o)))

(:action get-up-stop-0
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (parked-copy ?r))
		(get-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action get-up-stop-1
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (base-pos-copy ?r ?basex ?basey))
		(get-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action get-up-stop-2
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (gripper-rel-copy ?r ?gxrel ?gyrel))
		(get-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action get-up-stop-3
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (sum-x-copy ?basex ?gxrel ?gxabs))
		(get-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action get-up-stop-4
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (sum-y-copy ?basey ?gyrel ?gyabs))
		(get-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action get-up-stop-5
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (gripper-empty-copy ?r))
		(get-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action get-up-stop-6
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (above-copy ?oy ?gyabs))
		(get-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action get-up-stop-7
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(object-done-copy ?o)
		(get-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action get-up-stop-8
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (object-pos-copy ?o ?gxabs ?oy))
		(get-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action get-up-copy
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(get-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy)
		(parked-copy ?r)
		(base-pos-copy ?r ?basex ?basey)
		(gripper-rel-copy ?r ?gxrel ?gyrel)
		(sum-x-copy ?basex ?gxrel ?gxabs)
		(sum-y-copy ?basey ?gyrel ?gyabs)
		(gripper-empty-copy ?r)
		(above-copy ?oy ?gyabs)
		(not (object-done-copy ?o))
		(object-pos-copy ?o ?gxabs ?oy))
	:effect (and
		(not (get-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
		(unlock-origin-domain )
		(not (object-pos-copy ?o ?gxabs ?oy))
		(not (gripper-obstacle-copy ?gxabs ?oy))
		(not (gripper-empty-copy ?r))
		(holding-copy ?r ?o)))

(:action get-down-stop-0
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (parked-copy ?r))
		(get-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action get-down-stop-1
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (base-pos-copy ?r ?basex ?basey))
		(get-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action get-down-stop-2
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (gripper-rel-copy ?r ?gxrel ?gyrel))
		(get-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action get-down-stop-3
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (sum-x-copy ?basex ?gxrel ?gxabs))
		(get-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action get-down-stop-4
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (sum-y-copy ?basey ?gyrel ?gyabs))
		(get-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action get-down-stop-5
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (gripper-empty-copy ?r))
		(get-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action get-down-stop-6
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (above-copy ?gyabs ?oy))
		(get-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action get-down-stop-7
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(object-done-copy ?o)
		(get-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action get-down-stop-8
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (object-pos-copy ?o ?gxabs ?oy))
		(get-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action get-down-copy
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(get-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy)
		(parked-copy ?r)
		(base-pos-copy ?r ?basex ?basey)
		(gripper-rel-copy ?r ?gxrel ?gyrel)
		(sum-x-copy ?basex ?gxrel ?gxabs)
		(sum-y-copy ?basey ?gyrel ?gyabs)
		(gripper-empty-copy ?r)
		(above-copy ?gyabs ?oy)
		(not (object-done-copy ?o))
		(object-pos-copy ?o ?gxabs ?oy))
	:effect (and
		(not (get-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
		(unlock-origin-domain )
		(not (object-pos-copy ?o ?gxabs ?oy))
		(not (gripper-obstacle-copy ?gxabs ?oy))
		(not (gripper-empty-copy ?r))
		(holding-copy ?r ?o)))

(:action get-from-cart-stop-0
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(not (parked-copy ?r))
		(get-from-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy))
	:effect (and
		(invalid )))

(:action get-from-cart-stop-1
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(not (base-pos-copy ?r ?x ?y))
		(get-from-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy))
	:effect (and
		(invalid )))

(:action get-from-cart-stop-2
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(not (gripper-rel-copy ?r ?gxrel ?gyrel))
		(get-from-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy))
	:effect (and
		(invalid )))

(:action get-from-cart-stop-3
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(not (sum-x-copy ?x ?gxrel ?cx))
		(get-from-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy))
	:effect (and
		(invalid )))

(:action get-from-cart-stop-4
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(not (sum-y-copy ?y ?gyrel ?cy))
		(get-from-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy))
	:effect (and
		(invalid )))

(:action get-from-cart-stop-5
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(not (gripper-empty-copy ?r))
		(get-from-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy))
	:effect (and
		(invalid )))

(:action get-from-cart-stop-6
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(not (cart-pos-copy ?c ?cx ?cy))
		(get-from-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy))
	:effect (and
		(invalid )))

(:action get-from-cart-stop-7
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(not (on-cart-copy ?o ?c))
		(get-from-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy))
	:effect (and
		(invalid )))

(:action get-from-cart-copy
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(get-from-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy)
		(parked-copy ?r)
		(base-pos-copy ?r ?x ?y)
		(gripper-rel-copy ?r ?gxrel ?gyrel)
		(sum-x-copy ?x ?gxrel ?cx)
		(sum-y-copy ?y ?gyrel ?cy)
		(gripper-empty-copy ?r)
		(cart-pos-copy ?c ?cx ?cy)
		(on-cart-copy ?o ?c))
	:effect (and
		(not (get-from-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy))
		(unlock-origin-domain )
		(holding-copy ?r ?o)
		(not (gripper-empty-copy ?r))
		(not (on-cart-copy ?o ?c))))

(:action put-left-stop-0
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (parked-copy ?r))
		(put-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action put-left-stop-1
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (base-pos-copy ?r ?basex ?basey))
		(put-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action put-left-stop-2
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (gripper-rel-copy ?r ?gxrel ?gyrel))
		(put-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action put-left-stop-3
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (sum-x-copy ?basex ?gxrel ?gxabs))
		(put-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action put-left-stop-4
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (sum-y-copy ?basey ?gyrel ?gyabs))
		(put-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action put-left-stop-5
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (holding-copy ?r ?o))
		(put-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action put-left-stop-6
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (leftof-copy ?ox ?gxabs))
		(put-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action put-left-stop-7
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(gripper-obstacle-copy ?ox ?gyabs)
		(put-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action put-left-stop-8
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (surface-copy ?ox ?gyabs))
		(put-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action put-left-copy
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(put-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox)
		(parked-copy ?r)
		(base-pos-copy ?r ?basex ?basey)
		(gripper-rel-copy ?r ?gxrel ?gyrel)
		(sum-x-copy ?basex ?gxrel ?gxabs)
		(sum-y-copy ?basey ?gyrel ?gyabs)
		(holding-copy ?r ?o)
		(leftof-copy ?ox ?gxabs)
		(not (gripper-obstacle-copy ?ox ?gyabs))
		(surface-copy ?ox ?gyabs))
	:effect (and
		(not (put-left-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
		(unlock-origin-domain )
		(not (holding-copy ?r ?o))
		(object-pos-copy ?o ?ox ?gyabs)
		(gripper-obstacle-copy ?ox ?gyabs)
		(gripper-empty-copy ?r)
		(sum-x-copy ?ox ?gxrel ?ox)))

(:action put-right-stop-0
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (parked-copy ?r))
		(put-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action put-right-stop-1
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (base-pos-copy ?r ?basex ?basey))
		(put-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action put-right-stop-2
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (gripper-rel-copy ?r ?gxrel ?gyrel))
		(put-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action put-right-stop-3
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (sum-x-copy ?basex ?gxrel ?gxabs))
		(put-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action put-right-stop-4
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (sum-y-copy ?basey ?gyrel ?gyabs))
		(put-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action put-right-stop-5
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (holding-copy ?r ?o))
		(put-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action put-right-stop-6
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (leftof-copy ?gxabs ?ox))
		(put-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action put-right-stop-7
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(gripper-obstacle-copy ?ox ?gyabs)
		(put-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action put-right-stop-8
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(not (surface-copy ?ox ?gyabs))
		(put-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
	:effect (and
		(invalid )))

(:action put-right-copy
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?ox - xc)
	:precondition (and
		(put-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox)
		(parked-copy ?r)
		(base-pos-copy ?r ?basex ?basey)
		(gripper-rel-copy ?r ?gxrel ?gyrel)
		(sum-x-copy ?basex ?gxrel ?gxabs)
		(sum-y-copy ?basey ?gyrel ?gyabs)
		(holding-copy ?r ?o)
		(leftof-copy ?gxabs ?ox)
		(not (gripper-obstacle-copy ?ox ?gyabs))
		(surface-copy ?ox ?gyabs))
	:effect (and
		(not (put-right-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?ox))
		(unlock-origin-domain )
		(not (holding-copy ?r ?o))
		(object-pos-copy ?o ?ox ?gyabs)
		(gripper-obstacle-copy ?ox ?gyabs)
		(gripper-empty-copy ?r)))

(:action put-up-stop-0
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (parked-copy ?r))
		(put-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action put-up-stop-1
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (base-pos-copy ?r ?basex ?basey))
		(put-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action put-up-stop-2
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (gripper-rel-copy ?r ?gxrel ?gyrel))
		(put-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action put-up-stop-3
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (sum-x-copy ?basex ?gxrel ?gxabs))
		(put-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action put-up-stop-4
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (sum-y-copy ?basey ?gyrel ?gyabs))
		(put-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action put-up-stop-5
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (holding-copy ?r ?o))
		(put-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action put-up-stop-6
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (above-copy ?oy ?gyabs))
		(put-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action put-up-stop-7
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(gripper-obstacle-copy ?gxabs ?oy)
		(put-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action put-up-stop-8
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (surface-copy ?gxabs ?oy))
		(put-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action put-up-copy
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(put-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy)
		(parked-copy ?r)
		(base-pos-copy ?r ?basex ?basey)
		(gripper-rel-copy ?r ?gxrel ?gyrel)
		(sum-x-copy ?basex ?gxrel ?gxabs)
		(sum-y-copy ?basey ?gyrel ?gyabs)
		(holding-copy ?r ?o)
		(above-copy ?oy ?gyabs)
		(not (gripper-obstacle-copy ?gxabs ?oy))
		(surface-copy ?gxabs ?oy))
	:effect (and
		(not (put-up-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
		(unlock-origin-domain )
		(not (holding-copy ?r ?o))
		(object-pos-copy ?o ?gxabs ?oy)
		(gripper-obstacle-copy ?gxabs ?oy)
		(gripper-empty-copy ?r)
		(object-goal-copy ?o ?gxabs ?oy)))

(:action put-down-stop-0
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (parked-copy ?r))
		(put-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action put-down-stop-1
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (base-pos-copy ?r ?basex ?basey))
		(put-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action put-down-stop-2
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (gripper-rel-copy ?r ?gxrel ?gyrel))
		(put-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action put-down-stop-3
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (sum-x-copy ?basex ?gxrel ?gxabs))
		(put-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action put-down-stop-4
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (sum-y-copy ?basey ?gyrel ?gyabs))
		(put-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action put-down-stop-5
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (holding-copy ?r ?o))
		(put-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action put-down-stop-6
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (above-copy ?gyabs ?oy))
		(put-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action put-down-stop-7
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(gripper-obstacle-copy ?gxabs ?oy)
		(put-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action put-down-stop-8
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(not (surface-copy ?gxabs ?oy))
		(put-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
	:effect (and
		(invalid )))

(:action put-down-copy
	:parameters (?r - robot
		?basex - xc
		?basey - yc
		?gxrel - xrel
		?gxabs - xc
		?gyrel - yrel
		?gyabs - yc
		?o - object
		?oy - yc)
	:precondition (and
		(put-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy)
		(parked-copy ?r)
		(base-pos-copy ?r ?basex ?basey)
		(gripper-rel-copy ?r ?gxrel ?gyrel)
		(sum-x-copy ?basex ?gxrel ?gxabs)
		(sum-y-copy ?basey ?gyrel ?gyabs)
		(holding-copy ?r ?o)
		(above-copy ?gyabs ?oy)
		(not (gripper-obstacle-copy ?gxabs ?oy))
		(surface-copy ?gxabs ?oy))
	:effect (and
		(not (put-down-lock ?r ?basex ?basey ?gxrel ?gxabs ?gyrel ?gyabs ?o ?oy))
		(unlock-origin-domain )
		(not (holding-copy ?r ?o))
		(object-pos-copy ?o ?gxabs ?oy)
		(gripper-obstacle-copy ?gxabs ?oy)
		(gripper-empty-copy ?r)))

(:action put-on-cart-stop-0
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(not (parked-copy ?r))
		(put-on-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy))
	:effect (and
		(invalid )))

(:action put-on-cart-stop-1
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(not (base-pos-copy ?r ?x ?y))
		(put-on-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy))
	:effect (and
		(invalid )))

(:action put-on-cart-stop-2
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(not (gripper-rel-copy ?r ?gxrel ?gyrel))
		(put-on-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy))
	:effect (and
		(invalid )))

(:action put-on-cart-stop-3
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(not (sum-x-copy ?x ?gxrel ?cx))
		(put-on-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy))
	:effect (and
		(invalid )))

(:action put-on-cart-stop-4
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(not (sum-y-copy ?y ?gyrel ?cy))
		(put-on-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy))
	:effect (and
		(invalid )))

(:action put-on-cart-stop-5
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(not (cart-pos-copy ?c ?cx ?cy))
		(put-on-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy))
	:effect (and
		(invalid )))

(:action put-on-cart-stop-6
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(not (holding-copy ?r ?o))
		(put-on-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy))
	:effect (and
		(invalid )))

(:action put-on-cart-stop-7
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(pushing-copy ?r ?c)
		(put-on-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy))
	:effect (and
		(invalid )))

(:action put-on-cart-copy
	:parameters (?r - robot
		?x - xc
		?y - yc
		?gxrel - xrel
		?gyrel - yrel
		?o - object
		?c - cart
		?cx - xc
		?cy - yc)
	:precondition (and
		(put-on-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy)
		(parked-copy ?r)
		(base-pos-copy ?r ?x ?y)
		(gripper-rel-copy ?r ?gxrel ?gyrel)
		(sum-x-copy ?x ?gxrel ?cx)
		(sum-y-copy ?y ?gyrel ?cy)
		(cart-pos-copy ?c ?cx ?cy)
		(holding-copy ?r ?o)
		(not (pushing-copy ?r ?c)))
	:effect (and
		(not (put-on-cart-lock ?r ?x ?y ?gxrel ?gyrel ?o ?c ?cx ?cy))
		(unlock-origin-domain )
		(not (holding-copy ?r ?o))
		(on-cart-copy ?o ?c)
		(gripper-empty-copy ?r)))

(:action finish-object-stop-0
	:parameters (?o - object
		?x - xc
		?y - yc)
	:precondition (and
		(object-done-copy ?o)
		(finish-object-lock ?o ?x ?y))
	:effect (and
		(invalid )))

(:action finish-object-stop-1
	:parameters (?o - object
		?x - xc
		?y - yc)
	:precondition (and
		(not (object-pos-copy ?o ?x ?y))
		(finish-object-lock ?o ?x ?y))
	:effect (and
		(invalid )))

(:action finish-object-stop-2
	:parameters (?o - object
		?x - xc
		?y - yc)
	:precondition (and
		(not (object-goal-copy ?o ?x ?y))
		(finish-object-lock ?o ?x ?y))
	:effect (and
		(invalid )))

(:action finish-object-copy
	:parameters (?o - object
		?x - xc
		?y - yc)
	:precondition (and
		(finish-object-lock ?o ?x ?y)
		(not (object-done-copy ?o))
		(object-pos-copy ?o ?x ?y)
		(object-goal-copy ?o ?x ?y))
	:effect (and
		(not (finish-object-lock ?o ?x ?y))
		(unlock-origin-domain )
		(object-done-copy ?o)))

(:action turning
	:parameters ()
	:precondition (and
		(invalid ))
	:effect (and
		(unlock-origin-domain ))) )