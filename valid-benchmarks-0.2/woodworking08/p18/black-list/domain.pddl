(define (domain woodworking)
(:requirements :typing :action-costs)
(:types
	object
	object - object
	acolour - object
	awood - object
	woodobj - object
	machine - object
	surface - object
	treatmentstatus - object
	aboardsize - object
	apartsize - object
	highspeed-saw - machine
	glazer - machine
	grinder - machine
	immersion-varnisher - machine
	planer - machine
	saw - machine
	spray-varnisher - machine
	board - woodobj
	part - woodobj)
(:constants verysmooth - surface smooth - surface rough - surface varnished - treatmentstatus glazed - treatmentstatus untreated - treatmentstatus colourfragments - treatmentstatus natural - acolour small - apartsize medium - apartsize large - apartsize)
(:predicates
	(unused ?obj - part)
	(available ?obj - woodobj)
	(surface-condition ?obj - woodobj ?surface - surface)
	(treatment ?obj - part ?treatment - treatmentstatus)
	(colour ?obj - part ?colour - acolour)
	(wood ?obj - woodobj ?wood - awood)
	(boardsize ?board - board ?size - aboardsize)
	(goalsize ?part - part ?size - apartsize)
	(boardsize-successor ?size1 - aboardsize ?size2 - aboardsize)
	(in-highspeed-saw ?b - board ?m - highspeed-saw)
	(empty ?m - highspeed-saw)
	(has-colour ?machine - machine ?colour - acolour)
	(contains-part ?b - board ?p - part)
	(grind-treatment-change ?old - treatmentstatus ?new - treatmentstatus)
	(is-smooth ?surface - surface)
	(= ?x - object ?y - object)
	(= ?x - object ?y - object)
	(unused-copy ?obj - part)
	(available-copy ?obj - woodobj)
	(surface-condition-copy ?obj - woodobj ?surface - surface)
	(treatment-copy ?obj - part ?treatment - treatmentstatus)
	(colour-copy ?obj - part ?colour - acolour)
	(wood-copy ?obj - woodobj ?wood - awood)
	(boardsize-copy ?board - board ?size - aboardsize)
	(goalsize-copy ?part - part ?size - apartsize)
	(boardsize-successor-copy ?size1 - aboardsize ?size2 - aboardsize)
	(in-highspeed-saw-copy ?b - board ?m - highspeed-saw)
	(empty-copy ?m - highspeed-saw)
	(has-colour-copy ?machine - machine ?colour - acolour)
	(contains-part-copy ?b - board ?p - part)
	(grind-treatment-change-copy ?old - treatmentstatus ?new - treatmentstatus)
	(is-smooth-copy ?surface - surface)
	(=-copy ?x - object ?y - object)
	(invalid )
	(unlock-origin-domain )
	(do-immersion-varnish-lock ?x - part ?m - immersion-varnisher ?newcolour - acolour ?surface - surface)
	(do-spray-varnish-lock ?x - part ?m - spray-varnisher ?newcolour - acolour ?surface - surface)
	(do-glaze-lock ?x - part ?m - glazer ?newcolour - acolour)
	(do-grind-lock ?x - part ?m - grinder ?oldsurface - surface ?oldcolour - acolour ?oldtreatment - treatmentstatus ?newtreatment - treatmentstatus)
	(do-plane-lock ?x - part ?m - planer ?oldsurface - surface ?oldcolour - acolour ?oldtreatment - treatmentstatus)
	(load-highspeed-saw-lock ?b - board ?m - highspeed-saw)
	(unload-highspeed-saw-lock ?b - board ?m - highspeed-saw)
	(cut-board-small-lock ?b - board ?p - part ?m - highspeed-saw ?w - awood ?surface - surface ?size_before - aboardsize ?size_after - aboardsize)
	(cut-board-medium-lock ?b - board ?p - part ?m - highspeed-saw ?w - awood ?surface - surface ?size_before - aboardsize ?s1 - aboardsize ?size_after - aboardsize)
	(cut-board-large-lock ?b - board ?p - part ?m - highspeed-saw ?w - awood ?surface - surface ?size_before - aboardsize ?s1 - aboardsize ?s2 - aboardsize ?size_after - aboardsize)
	(do-saw-small-lock ?b - board ?p - part ?m - saw ?w - awood ?surface - surface ?size_before - aboardsize ?size_after - aboardsize)
	(do-saw-medium-lock ?b - board ?p - part ?m - saw ?w - awood ?surface - surface ?size_before - aboardsize ?s1 - aboardsize ?size_after - aboardsize)
	(do-saw-large-lock ?b - board ?p - part ?m - saw ?w - awood ?surface - surface ?size_before - aboardsize ?s1 - aboardsize ?s2 - aboardsize ?size_after - aboardsize))
(:functions (total-cost )
	(spray-varnish-cost ?obj - part)
	(glaze-cost ?obj - part)
	(grind-cost ?obj - part)
	(plane-cost ?obj - part))
(:action do-immersion-varnish
	:parameters (?x - part
		?m - immersion-varnisher
		?newcolour - acolour
		?surface - surface)
	:precondition (and
		(available ?x)
		(has-colour ?m ?newcolour)
		(surface-condition ?x ?surface)
		(is-smooth ?surface)
		(treatment ?x untreated)
		(unlock-origin-domain ))
	:effect (and
		(not (treatment ?x untreated))
		(treatment ?x varnished)
		(not (colour ?x natural))
		(colour ?x ?newcolour)
		(do-immersion-varnish-lock ?x ?m ?newcolour ?surface)
		(not (unlock-origin-domain ))(increase (total-cost ) 10)))

(:action do-spray-varnish
	:parameters (?x - part
		?m - spray-varnisher
		?newcolour - acolour
		?surface - surface)
	:precondition (and
		(available ?x)
		(has-colour ?m ?newcolour)
		(surface-condition ?x ?surface)
		(is-smooth ?surface)
		(treatment ?x untreated)
		(unlock-origin-domain ))
	:effect (and
		(not (treatment ?x untreated))
		(treatment ?x varnished)
		(colour ?x ?newcolour)
		(do-spray-varnish-lock ?x ?m ?newcolour ?surface)
		(not (unlock-origin-domain ))(increase (total-cost ) (spray-varnish-cost ?x))))

(:action do-glaze
	:parameters (?x - part
		?m - glazer
		?newcolour - acolour)
	:precondition (and
		(available ?x)
		(has-colour ?m ?newcolour)
		(treatment ?x untreated)
		(unlock-origin-domain ))
	:effect (and
		(not (treatment ?x untreated))
		(treatment ?x glazed)
		(not (colour ?x natural))
		(colour ?x ?newcolour)
		(do-glaze-lock ?x ?m ?newcolour)
		(not (unlock-origin-domain ))(increase (total-cost ) (glaze-cost ?x))))

(:action do-grind
	:parameters (?x - part
		?m - grinder
		?oldsurface - surface
		?oldcolour - acolour
		?oldtreatment - treatmentstatus
		?newtreatment - treatmentstatus)
	:precondition (and
		(available ?x)
		(surface-condition ?x ?oldsurface)
		(is-smooth ?oldsurface)
		(colour ?x ?oldcolour)
		(treatment ?x ?oldtreatment)
		(grind-treatment-change ?oldtreatment ?newtreatment)
		(unlock-origin-domain ))
	:effect (and
		(not (surface-condition ?x ?oldsurface))
		(surface-condition ?x verysmooth)
		(not (treatment ?x ?oldtreatment))
		(treatment ?x ?newtreatment)
		(not (colour ?x ?oldcolour))
		(colour ?x natural)
		(grind-treatment-change ?newtreatment ?newtreatment)
		(do-grind-lock ?x ?m ?oldsurface ?oldcolour ?oldtreatment ?newtreatment)
		(not (unlock-origin-domain ))(increase (total-cost ) (grind-cost ?x))))

(:action do-plane
	:parameters (?x - part
		?m - planer
		?oldsurface - surface
		?oldcolour - acolour
		?oldtreatment - treatmentstatus)
	:precondition (and
		(available ?x)
		(surface-condition ?x ?oldsurface)
		(treatment ?x ?oldtreatment)
		(colour ?x ?oldcolour)
		(unlock-origin-domain ))
	:effect (and
		(not (surface-condition ?x ?oldsurface))
		(surface-condition ?x smooth)
		(not (treatment ?x ?oldtreatment))
		(not (colour ?x ?oldcolour))
		(colour ?x natural)
		(do-plane-lock ?x ?m ?oldsurface ?oldcolour ?oldtreatment)
		(not (unlock-origin-domain ))(increase (total-cost ) (plane-cost ?x))))

(:action load-highspeed-saw
	:parameters (?b - board
		?m - highspeed-saw)
	:precondition (and
		(empty ?m)
		(available ?b)
		(unlock-origin-domain ))
	:effect (and
		(not (available ?b))
		(not (empty ?m))
		(in-highspeed-saw ?b ?m)
		(load-highspeed-saw-lock ?b ?m)
		(not (unlock-origin-domain ))(increase (total-cost ) 30)))

(:action unload-highspeed-saw
	:parameters (?b - board
		?m - highspeed-saw)
	:precondition (and
		(in-highspeed-saw ?b ?m)
		(unlock-origin-domain ))
	:effect (and
		(available ?b)
		(not (in-highspeed-saw ?b ?m))
		(empty ?m)
		(unload-highspeed-saw-lock ?b ?m)
		(not (unlock-origin-domain ))(increase (total-cost ) 10)))

(:action cut-board-small
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(unused ?p)
		(goalsize ?p small)
		(in-highspeed-saw ?b ?m)
		(wood ?b ?w)
		(surface-condition ?b ?surface)
		(boardsize ?b ?size_before)
		(boardsize-successor ?size_after ?size_before)
		(unlock-origin-domain ))
	:effect (and
		(not (unused ?p))
		(available ?p)
		(wood ?p ?w)
		(surface-condition ?p ?surface)
		(colour ?p natural)
		(treatment ?p untreated)
		(boardsize ?b ?size_after)
		(not (boardsize ?b ?size_before))
		(cut-board-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after)
		(not (unlock-origin-domain ))(increase (total-cost ) 10)))

(:action cut-board-medium
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(unused ?p)
		(goalsize ?p medium)
		(in-highspeed-saw ?b ?m)
		(wood ?b ?w)
		(surface-condition ?b ?surface)
		(boardsize ?b ?size_before)
		(boardsize-successor ?size_after ?s1)
		(boardsize-successor ?s1 ?size_before)
		(unlock-origin-domain ))
	:effect (and
		(not (unused ?p))
		(available ?p)
		(wood ?p ?w)
		(surface-condition ?p ?surface)
		(colour ?p natural)
		(treatment ?p untreated)
		(boardsize ?b ?size_after)
		(cut-board-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after)
		(not (unlock-origin-domain ))(increase (total-cost ) 10)))

(:action cut-board-large
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(unused ?p)
		(goalsize ?p large)
		(in-highspeed-saw ?b ?m)
		(wood ?b ?w)
		(surface-condition ?b ?surface)
		(boardsize ?b ?size_before)
		(boardsize-successor ?size_after ?s1)
		(boardsize-successor ?s1 ?s2)
		(boardsize-successor ?s2 ?size_before)
		(unlock-origin-domain ))
	:effect (and
		(not (unused ?p))
		(available ?p)
		(wood ?p ?w)
		(surface-condition ?p ?surface)
		(colour ?p natural)
		(treatment ?p untreated)
		(boardsize ?b ?size_after)
		(cut-board-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after)
		(not (unlock-origin-domain ))(increase (total-cost ) 10)))

(:action do-saw-small
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(unused ?p)
		(goalsize ?p small)
		(available ?b)
		(wood ?b ?w)
		(surface-condition ?b ?surface)
		(boardsize ?b ?size_before)
		(boardsize-successor ?size_after ?size_before)
		(unlock-origin-domain ))
	:effect (and
		(available ?p)
		(wood ?p ?w)
		(surface-condition ?p ?surface)
		(colour ?p natural)
		(boardsize ?b ?size_after)
		(do-saw-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after)
		(not (unlock-origin-domain ))(increase (total-cost ) 30)))

(:action do-saw-medium
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(unused ?p)
		(goalsize ?p medium)
		(available ?b)
		(wood ?b ?w)
		(surface-condition ?b ?surface)
		(boardsize ?b ?size_before)
		(boardsize-successor ?size_after ?s1)
		(boardsize-successor ?s1 ?size_before)
		(unlock-origin-domain ))
	:effect (and
		(not (unused ?p))
		(available ?p)
		(wood ?p ?w)
		(surface-condition ?p ?surface)
		(colour ?p natural)
		(treatment ?p untreated)
		(boardsize ?b ?size_after)
		(do-saw-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after)
		(not (unlock-origin-domain ))(increase (total-cost ) 30)))

(:action do-saw-large
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(unused ?p)
		(goalsize ?p large)
		(available ?b)
		(wood ?b ?w)
		(surface-condition ?b ?surface)
		(boardsize ?b ?size_before)
		(boardsize-successor ?size_after ?s1)
		(boardsize-successor ?s1 ?s2)
		(boardsize-successor ?s2 ?size_before)
		(unlock-origin-domain ))
	:effect (and
		(not (unused ?p))
		(available ?p)
		(wood ?p ?w)
		(surface-condition ?p ?surface)
		(colour ?p natural)
		(treatment ?p untreated)
		(boardsize ?b ?size_after)
		(do-saw-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after)
		(not (unlock-origin-domain ))(increase (total-cost ) 30)))

(:action do-immersion-varnish-stop-0
	:parameters (?x - part
		?m - immersion-varnisher
		?newcolour - acolour
		?surface - surface)
	:precondition (and
		(not (available-copy ?x))
		(do-immersion-varnish-lock ?x ?m ?newcolour ?surface))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action do-immersion-varnish-stop-1
	:parameters (?x - part
		?m - immersion-varnisher
		?newcolour - acolour
		?surface - surface)
	:precondition (and
		(not (has-colour-copy ?m ?newcolour))
		(do-immersion-varnish-lock ?x ?m ?newcolour ?surface))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action do-immersion-varnish-stop-2
	:parameters (?x - part
		?m - immersion-varnisher
		?newcolour - acolour
		?surface - surface)
	:precondition (and
		(not (surface-condition-copy ?x ?surface))
		(do-immersion-varnish-lock ?x ?m ?newcolour ?surface))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action do-immersion-varnish-stop-3
	:parameters (?x - part
		?m - immersion-varnisher
		?newcolour - acolour
		?surface - surface)
	:precondition (and
		(not (is-smooth-copy ?surface))
		(do-immersion-varnish-lock ?x ?m ?newcolour ?surface))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action do-immersion-varnish-stop-4
	:parameters (?x - part
		?m - immersion-varnisher
		?newcolour - acolour
		?surface - surface)
	:precondition (and
		(not (treatment-copy ?x untreated))
		(do-immersion-varnish-lock ?x ?m ?newcolour ?surface))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action do-immersion-varnish-copy
	:parameters (?x - part
		?m - immersion-varnisher
		?newcolour - acolour
		?surface - surface)
	:precondition (and
		(do-immersion-varnish-lock ?x ?m ?newcolour ?surface)
		(available-copy ?x)
		(has-colour-copy ?m ?newcolour)
		(surface-condition-copy ?x ?surface)
		(is-smooth-copy ?surface)
		(treatment-copy ?x untreated))
	:effect (and
		(not (do-immersion-varnish-lock ?x ?m ?newcolour ?surface))
		(unlock-origin-domain )
		(not (treatment-copy ?x untreated))
		(treatment-copy ?x varnished)
		(not (colour-copy ?x natural))
		(colour-copy ?x ?newcolour)(increase (total-cost ) 10)))

(:action do-spray-varnish-stop-0
	:parameters (?x - part
		?m - spray-varnisher
		?newcolour - acolour
		?surface - surface)
	:precondition (and
		(not (available-copy ?x))
		(do-spray-varnish-lock ?x ?m ?newcolour ?surface))
	:effect (and
		(invalid )(increase (total-cost ) (spray-varnish-cost ?x))))

(:action do-spray-varnish-stop-1
	:parameters (?x - part
		?m - spray-varnisher
		?newcolour - acolour
		?surface - surface)
	:precondition (and
		(not (has-colour-copy ?m ?newcolour))
		(do-spray-varnish-lock ?x ?m ?newcolour ?surface))
	:effect (and
		(invalid )(increase (total-cost ) (spray-varnish-cost ?x))))

(:action do-spray-varnish-stop-2
	:parameters (?x - part
		?m - spray-varnisher
		?newcolour - acolour
		?surface - surface)
	:precondition (and
		(not (surface-condition-copy ?x ?surface))
		(do-spray-varnish-lock ?x ?m ?newcolour ?surface))
	:effect (and
		(invalid )(increase (total-cost ) (spray-varnish-cost ?x))))

(:action do-spray-varnish-stop-3
	:parameters (?x - part
		?m - spray-varnisher
		?newcolour - acolour
		?surface - surface)
	:precondition (and
		(not (is-smooth-copy ?surface))
		(do-spray-varnish-lock ?x ?m ?newcolour ?surface))
	:effect (and
		(invalid )(increase (total-cost ) (spray-varnish-cost ?x))))

(:action do-spray-varnish-stop-4
	:parameters (?x - part
		?m - spray-varnisher
		?newcolour - acolour
		?surface - surface)
	:precondition (and
		(not (treatment-copy ?x untreated))
		(do-spray-varnish-lock ?x ?m ?newcolour ?surface))
	:effect (and
		(invalid )(increase (total-cost ) (spray-varnish-cost ?x))))

(:action do-spray-varnish-copy
	:parameters (?x - part
		?m - spray-varnisher
		?newcolour - acolour
		?surface - surface)
	:precondition (and
		(do-spray-varnish-lock ?x ?m ?newcolour ?surface)
		(available-copy ?x)
		(has-colour-copy ?m ?newcolour)
		(surface-condition-copy ?x ?surface)
		(is-smooth-copy ?surface)
		(treatment-copy ?x untreated))
	:effect (and
		(not (do-spray-varnish-lock ?x ?m ?newcolour ?surface))
		(unlock-origin-domain )
		(not (treatment-copy ?x untreated))
		(treatment-copy ?x varnished)
		(not (colour-copy ?x natural))
		(colour-copy ?x ?newcolour)(increase (total-cost ) (spray-varnish-cost ?x))))

(:action do-glaze-stop-0
	:parameters (?x - part
		?m - glazer
		?newcolour - acolour)
	:precondition (and
		(not (available-copy ?x))
		(do-glaze-lock ?x ?m ?newcolour))
	:effect (and
		(invalid )(increase (total-cost ) (glaze-cost ?x))))

(:action do-glaze-stop-1
	:parameters (?x - part
		?m - glazer
		?newcolour - acolour)
	:precondition (and
		(not (has-colour-copy ?m ?newcolour))
		(do-glaze-lock ?x ?m ?newcolour))
	:effect (and
		(invalid )(increase (total-cost ) (glaze-cost ?x))))

(:action do-glaze-stop-2
	:parameters (?x - part
		?m - glazer
		?newcolour - acolour)
	:precondition (and
		(not (treatment-copy ?x untreated))
		(do-glaze-lock ?x ?m ?newcolour))
	:effect (and
		(invalid )(increase (total-cost ) (glaze-cost ?x))))

(:action do-glaze-copy
	:parameters (?x - part
		?m - glazer
		?newcolour - acolour)
	:precondition (and
		(do-glaze-lock ?x ?m ?newcolour)
		(available-copy ?x)
		(has-colour-copy ?m ?newcolour)
		(treatment-copy ?x untreated))
	:effect (and
		(not (do-glaze-lock ?x ?m ?newcolour))
		(unlock-origin-domain )
		(not (treatment-copy ?x untreated))
		(treatment-copy ?x glazed)
		(not (colour-copy ?x natural))
		(colour-copy ?x ?newcolour)(increase (total-cost ) (glaze-cost ?x))))

(:action do-grind-stop-0
	:parameters (?x - part
		?m - grinder
		?oldsurface - surface
		?oldcolour - acolour
		?oldtreatment - treatmentstatus
		?newtreatment - treatmentstatus)
	:precondition (and
		(not (available-copy ?x))
		(do-grind-lock ?x ?m ?oldsurface ?oldcolour ?oldtreatment ?newtreatment))
	:effect (and
		(invalid )(increase (total-cost ) (grind-cost ?x))))

(:action do-grind-stop-1
	:parameters (?x - part
		?m - grinder
		?oldsurface - surface
		?oldcolour - acolour
		?oldtreatment - treatmentstatus
		?newtreatment - treatmentstatus)
	:precondition (and
		(not (surface-condition-copy ?x ?oldsurface))
		(do-grind-lock ?x ?m ?oldsurface ?oldcolour ?oldtreatment ?newtreatment))
	:effect (and
		(invalid )(increase (total-cost ) (grind-cost ?x))))

(:action do-grind-stop-2
	:parameters (?x - part
		?m - grinder
		?oldsurface - surface
		?oldcolour - acolour
		?oldtreatment - treatmentstatus
		?newtreatment - treatmentstatus)
	:precondition (and
		(not (is-smooth-copy ?oldsurface))
		(do-grind-lock ?x ?m ?oldsurface ?oldcolour ?oldtreatment ?newtreatment))
	:effect (and
		(invalid )(increase (total-cost ) (grind-cost ?x))))

(:action do-grind-stop-3
	:parameters (?x - part
		?m - grinder
		?oldsurface - surface
		?oldcolour - acolour
		?oldtreatment - treatmentstatus
		?newtreatment - treatmentstatus)
	:precondition (and
		(not (colour-copy ?x ?oldcolour))
		(do-grind-lock ?x ?m ?oldsurface ?oldcolour ?oldtreatment ?newtreatment))
	:effect (and
		(invalid )(increase (total-cost ) (grind-cost ?x))))

(:action do-grind-stop-4
	:parameters (?x - part
		?m - grinder
		?oldsurface - surface
		?oldcolour - acolour
		?oldtreatment - treatmentstatus
		?newtreatment - treatmentstatus)
	:precondition (and
		(not (treatment-copy ?x ?oldtreatment))
		(do-grind-lock ?x ?m ?oldsurface ?oldcolour ?oldtreatment ?newtreatment))
	:effect (and
		(invalid )(increase (total-cost ) (grind-cost ?x))))

(:action do-grind-stop-5
	:parameters (?x - part
		?m - grinder
		?oldsurface - surface
		?oldcolour - acolour
		?oldtreatment - treatmentstatus
		?newtreatment - treatmentstatus)
	:precondition (and
		(not (grind-treatment-change-copy ?oldtreatment ?newtreatment))
		(do-grind-lock ?x ?m ?oldsurface ?oldcolour ?oldtreatment ?newtreatment))
	:effect (and
		(invalid )(increase (total-cost ) (grind-cost ?x))))

(:action do-grind-copy
	:parameters (?x - part
		?m - grinder
		?oldsurface - surface
		?oldcolour - acolour
		?oldtreatment - treatmentstatus
		?newtreatment - treatmentstatus)
	:precondition (and
		(do-grind-lock ?x ?m ?oldsurface ?oldcolour ?oldtreatment ?newtreatment)
		(available-copy ?x)
		(surface-condition-copy ?x ?oldsurface)
		(is-smooth-copy ?oldsurface)
		(colour-copy ?x ?oldcolour)
		(treatment-copy ?x ?oldtreatment)
		(grind-treatment-change-copy ?oldtreatment ?newtreatment))
	:effect (and
		(not (do-grind-lock ?x ?m ?oldsurface ?oldcolour ?oldtreatment ?newtreatment))
		(unlock-origin-domain )
		(not (surface-condition-copy ?x ?oldsurface))
		(surface-condition-copy ?x verysmooth)
		(not (treatment-copy ?x ?oldtreatment))
		(treatment-copy ?x ?newtreatment)
		(not (colour-copy ?x ?oldcolour))
		(colour-copy ?x natural)(increase (total-cost ) (grind-cost ?x))))

(:action do-plane-stop-0
	:parameters (?x - part
		?m - planer
		?oldsurface - surface
		?oldcolour - acolour
		?oldtreatment - treatmentstatus)
	:precondition (and
		(not (available-copy ?x))
		(do-plane-lock ?x ?m ?oldsurface ?oldcolour ?oldtreatment))
	:effect (and
		(invalid )(increase (total-cost ) (plane-cost ?x))))

(:action do-plane-stop-1
	:parameters (?x - part
		?m - planer
		?oldsurface - surface
		?oldcolour - acolour
		?oldtreatment - treatmentstatus)
	:precondition (and
		(not (surface-condition-copy ?x ?oldsurface))
		(do-plane-lock ?x ?m ?oldsurface ?oldcolour ?oldtreatment))
	:effect (and
		(invalid )(increase (total-cost ) (plane-cost ?x))))

(:action do-plane-stop-2
	:parameters (?x - part
		?m - planer
		?oldsurface - surface
		?oldcolour - acolour
		?oldtreatment - treatmentstatus)
	:precondition (and
		(not (treatment-copy ?x ?oldtreatment))
		(do-plane-lock ?x ?m ?oldsurface ?oldcolour ?oldtreatment))
	:effect (and
		(invalid )(increase (total-cost ) (plane-cost ?x))))

(:action do-plane-stop-3
	:parameters (?x - part
		?m - planer
		?oldsurface - surface
		?oldcolour - acolour
		?oldtreatment - treatmentstatus)
	:precondition (and
		(not (colour-copy ?x ?oldcolour))
		(do-plane-lock ?x ?m ?oldsurface ?oldcolour ?oldtreatment))
	:effect (and
		(invalid )(increase (total-cost ) (plane-cost ?x))))

(:action do-plane-copy
	:parameters (?x - part
		?m - planer
		?oldsurface - surface
		?oldcolour - acolour
		?oldtreatment - treatmentstatus)
	:precondition (and
		(do-plane-lock ?x ?m ?oldsurface ?oldcolour ?oldtreatment)
		(available-copy ?x)
		(surface-condition-copy ?x ?oldsurface)
		(treatment-copy ?x ?oldtreatment)
		(colour-copy ?x ?oldcolour))
	:effect (and
		(not (do-plane-lock ?x ?m ?oldsurface ?oldcolour ?oldtreatment))
		(unlock-origin-domain )
		(not (surface-condition-copy ?x ?oldsurface))
		(surface-condition-copy ?x smooth)
		(not (treatment-copy ?x ?oldtreatment))
		(treatment-copy ?x untreated)
		(not (colour-copy ?x ?oldcolour))
		(colour-copy ?x natural)(increase (total-cost ) (plane-cost ?x))))

(:action load-highspeed-saw-stop-0
	:parameters (?b - board
		?m - highspeed-saw)
	:precondition (and
		(not (empty-copy ?m))
		(load-highspeed-saw-lock ?b ?m))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action load-highspeed-saw-stop-1
	:parameters (?b - board
		?m - highspeed-saw)
	:precondition (and
		(not (available-copy ?b))
		(load-highspeed-saw-lock ?b ?m))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action load-highspeed-saw-copy
	:parameters (?b - board
		?m - highspeed-saw)
	:precondition (and
		(load-highspeed-saw-lock ?b ?m)
		(empty-copy ?m)
		(available-copy ?b))
	:effect (and
		(not (load-highspeed-saw-lock ?b ?m))
		(unlock-origin-domain )
		(not (available-copy ?b))
		(not (empty-copy ?m))
		(in-highspeed-saw-copy ?b ?m)(increase (total-cost ) 30)))

(:action unload-highspeed-saw-stop-0
	:parameters (?b - board
		?m - highspeed-saw)
	:precondition (and
		(not (in-highspeed-saw-copy ?b ?m))
		(unload-highspeed-saw-lock ?b ?m))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action unload-highspeed-saw-copy
	:parameters (?b - board
		?m - highspeed-saw)
	:precondition (and
		(unload-highspeed-saw-lock ?b ?m)
		(in-highspeed-saw-copy ?b ?m))
	:effect (and
		(not (unload-highspeed-saw-lock ?b ?m))
		(unlock-origin-domain )
		(available-copy ?b)
		(not (in-highspeed-saw-copy ?b ?m))
		(empty-copy ?m)(increase (total-cost ) 10)))

(:action cut-board-small-stop-0
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (unused-copy ?p))
		(cut-board-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-small-stop-1
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (goalsize-copy ?p small))
		(cut-board-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-small-stop-2
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (in-highspeed-saw-copy ?b ?m))
		(cut-board-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-small-stop-3
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (wood-copy ?b ?w))
		(cut-board-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-small-stop-4
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (surface-condition-copy ?b ?surface))
		(cut-board-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-small-stop-5
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (boardsize-copy ?b ?size_before))
		(cut-board-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-small-stop-6
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (boardsize-successor-copy ?size_after ?size_before))
		(cut-board-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-small-copy
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(cut-board-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after)
		(unused-copy ?p)
		(goalsize-copy ?p small)
		(in-highspeed-saw-copy ?b ?m)
		(wood-copy ?b ?w)
		(surface-condition-copy ?b ?surface)
		(boardsize-copy ?b ?size_before)
		(boardsize-successor-copy ?size_after ?size_before))
	:effect (and
		(not (cut-board-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after))
		(unlock-origin-domain )
		(not (unused-copy ?p))
		(available-copy ?p)
		(wood-copy ?p ?w)
		(surface-condition-copy ?p ?surface)
		(colour-copy ?p natural)
		(treatment-copy ?p untreated)
		(boardsize-copy ?b ?size_after)(increase (total-cost ) 10)))

(:action cut-board-medium-stop-0
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (unused-copy ?p))
		(cut-board-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-medium-stop-1
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (goalsize-copy ?p medium))
		(cut-board-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-medium-stop-2
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (in-highspeed-saw-copy ?b ?m))
		(cut-board-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-medium-stop-3
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (wood-copy ?b ?w))
		(cut-board-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-medium-stop-4
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (surface-condition-copy ?b ?surface))
		(cut-board-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-medium-stop-5
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (boardsize-copy ?b ?size_before))
		(cut-board-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-medium-stop-6
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (boardsize-successor-copy ?size_after ?s1))
		(cut-board-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-medium-stop-7
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (boardsize-successor-copy ?s1 ?size_before))
		(cut-board-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-medium-copy
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(cut-board-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after)
		(unused-copy ?p)
		(goalsize-copy ?p medium)
		(in-highspeed-saw-copy ?b ?m)
		(wood-copy ?b ?w)
		(surface-condition-copy ?b ?surface)
		(boardsize-copy ?b ?size_before)
		(boardsize-successor-copy ?size_after ?s1)
		(boardsize-successor-copy ?s1 ?size_before))
	:effect (and
		(not (cut-board-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after))
		(unlock-origin-domain )
		(not (unused-copy ?p))
		(available-copy ?p)
		(wood-copy ?p ?w)
		(surface-condition-copy ?p ?surface)
		(colour-copy ?p natural)
		(treatment-copy ?p untreated)
		(boardsize-copy ?b ?size_after)(increase (total-cost ) 10)))

(:action cut-board-large-stop-0
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (unused-copy ?p))
		(cut-board-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-large-stop-1
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (goalsize-copy ?p large))
		(cut-board-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-large-stop-2
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (in-highspeed-saw-copy ?b ?m))
		(cut-board-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-large-stop-3
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (wood-copy ?b ?w))
		(cut-board-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-large-stop-4
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (surface-condition-copy ?b ?surface))
		(cut-board-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-large-stop-5
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (boardsize-copy ?b ?size_before))
		(cut-board-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-large-stop-6
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (boardsize-successor-copy ?size_after ?s1))
		(cut-board-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-large-stop-7
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (boardsize-successor-copy ?s1 ?s2))
		(cut-board-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-large-stop-8
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (boardsize-successor-copy ?s2 ?size_before))
		(cut-board-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 10)))

(:action cut-board-large-copy
	:parameters (?b - board
		?p - part
		?m - highspeed-saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(cut-board-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after)
		(unused-copy ?p)
		(goalsize-copy ?p large)
		(in-highspeed-saw-copy ?b ?m)
		(wood-copy ?b ?w)
		(surface-condition-copy ?b ?surface)
		(boardsize-copy ?b ?size_before)
		(boardsize-successor-copy ?size_after ?s1)
		(boardsize-successor-copy ?s1 ?s2)
		(boardsize-successor-copy ?s2 ?size_before))
	:effect (and
		(not (cut-board-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
		(unlock-origin-domain )
		(not (unused-copy ?p))
		(available-copy ?p)
		(wood-copy ?p ?w)
		(surface-condition-copy ?p ?surface)
		(colour-copy ?p natural)
		(treatment-copy ?p untreated)
		(boardsize-copy ?b ?size_after)(increase (total-cost ) 10)))

(:action do-saw-small-stop-0
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (unused-copy ?p))
		(do-saw-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-small-stop-1
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (goalsize-copy ?p small))
		(do-saw-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-small-stop-2
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (available-copy ?b))
		(do-saw-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-small-stop-3
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (wood-copy ?b ?w))
		(do-saw-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-small-stop-4
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (surface-condition-copy ?b ?surface))
		(do-saw-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-small-stop-5
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (boardsize-copy ?b ?size_before))
		(do-saw-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-small-stop-6
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (boardsize-successor-copy ?size_after ?size_before))
		(do-saw-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-small-copy
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(do-saw-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after)
		(unused-copy ?p)
		(goalsize-copy ?p small)
		(available-copy ?b)
		(wood-copy ?b ?w)
		(surface-condition-copy ?b ?surface)
		(boardsize-copy ?b ?size_before)
		(boardsize-successor-copy ?size_after ?size_before))
	:effect (and
		(not (do-saw-small-lock ?b ?p ?m ?w ?surface ?size_before ?size_after))
		(unlock-origin-domain )
		(not (unused-copy ?p))
		(available-copy ?p)
		(wood-copy ?p ?w)
		(surface-condition-copy ?p ?surface)
		(colour-copy ?p natural)
		(treatment-copy ?p untreated)
		(boardsize-copy ?b ?size_after)(increase (total-cost ) 30)))

(:action do-saw-medium-stop-0
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (unused-copy ?p))
		(do-saw-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-medium-stop-1
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (goalsize-copy ?p medium))
		(do-saw-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-medium-stop-2
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (available-copy ?b))
		(do-saw-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-medium-stop-3
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (wood-copy ?b ?w))
		(do-saw-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-medium-stop-4
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (surface-condition-copy ?b ?surface))
		(do-saw-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-medium-stop-5
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (boardsize-copy ?b ?size_before))
		(do-saw-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-medium-stop-6
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (boardsize-successor-copy ?size_after ?s1))
		(do-saw-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-medium-stop-7
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (boardsize-successor-copy ?s1 ?size_before))
		(do-saw-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-medium-copy
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(do-saw-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after)
		(unused-copy ?p)
		(goalsize-copy ?p medium)
		(available-copy ?b)
		(wood-copy ?b ?w)
		(surface-condition-copy ?b ?surface)
		(boardsize-copy ?b ?size_before)
		(boardsize-successor-copy ?size_after ?s1)
		(boardsize-successor-copy ?s1 ?size_before))
	:effect (and
		(not (do-saw-medium-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?size_after))
		(unlock-origin-domain )
		(not (unused-copy ?p))
		(available-copy ?p)
		(wood-copy ?p ?w)
		(surface-condition-copy ?p ?surface)
		(colour-copy ?p natural)
		(treatment-copy ?p untreated)
		(boardsize-copy ?b ?size_after)(increase (total-cost ) 30)))

(:action do-saw-large-stop-0
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (unused-copy ?p))
		(do-saw-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-large-stop-1
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (goalsize-copy ?p large))
		(do-saw-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-large-stop-2
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (available-copy ?b))
		(do-saw-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-large-stop-3
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (wood-copy ?b ?w))
		(do-saw-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-large-stop-4
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (surface-condition-copy ?b ?surface))
		(do-saw-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-large-stop-5
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (boardsize-copy ?b ?size_before))
		(do-saw-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-large-stop-6
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (boardsize-successor-copy ?size_after ?s1))
		(do-saw-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-large-stop-7
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (boardsize-successor-copy ?s1 ?s2))
		(do-saw-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-large-stop-8
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(not (boardsize-successor-copy ?s2 ?size_before))
		(do-saw-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
	:effect (and
		(invalid )(increase (total-cost ) 30)))

(:action do-saw-large-copy
	:parameters (?b - board
		?p - part
		?m - saw
		?w - awood
		?surface - surface
		?size_before - aboardsize
		?s1 - aboardsize
		?s2 - aboardsize
		?size_after - aboardsize)
	:precondition (and
		(do-saw-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after)
		(unused-copy ?p)
		(goalsize-copy ?p large)
		(available-copy ?b)
		(wood-copy ?b ?w)
		(surface-condition-copy ?b ?surface)
		(boardsize-copy ?b ?size_before)
		(boardsize-successor-copy ?size_after ?s1)
		(boardsize-successor-copy ?s1 ?s2)
		(boardsize-successor-copy ?s2 ?size_before))
	:effect (and
		(not (do-saw-large-lock ?b ?p ?m ?w ?surface ?size_before ?s1 ?s2 ?size_after))
		(unlock-origin-domain )
		(not (unused-copy ?p))
		(available-copy ?p)
		(wood-copy ?p ?w)
		(surface-condition-copy ?p ?surface)
		(colour-copy ?p natural)
		(treatment-copy ?p untreated)
		(boardsize-copy ?b ?size_after)(increase (total-cost ) 30)))

(:action turning
	:parameters ()
	:precondition (and
		(invalid ))
	:effect (and
		(unlock-origin-domain )(increase (total-cost ) 30))) )