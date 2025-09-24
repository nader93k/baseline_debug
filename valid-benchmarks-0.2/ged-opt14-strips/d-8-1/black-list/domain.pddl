(define (domain genome-edit-distance)
(:requirements :equality :action-costs)
(:types
	object
	object - object)
(:constants )
(:predicates
	(duplicate ?x - object ?y - object)
	(swappable ?x - object ?y - object)
	(cw ?x - object ?y - object)
	(free ?x - object)
	(gone ?x - object)
	(present ?x - object)
	(normal ?x - object)
	(inverted ?x - object)
	(idle )
	(cutting )
	(have-cut )
	(splicing )
	(splice-next ?x - object)
	(splicing-last )
	(inverse-splicing )
	(inverse-splice-next ?x - object)
	(inverse-splicing-last )
	(finished )
	(cut-point-1 ?x - object)
	(cut-point-2 ?x - object)
	(last-cut-point ?x - object)
	(splice-point-1 ?x - object)
	(splice-point-2 ?x - object)
	(s-first ?x - object)
	(s-next ?x - object ?y - object)
	(s-last ?x - object)
	(= ?x - object ?y - object)
	(= ?x - object ?y - object)
	(duplicate-copy ?x - object ?y - object)
	(swappable-copy ?x - object ?y - object)
	(cw-copy ?x - object ?y - object)
	(free-copy ?x - object)
	(gone-copy ?x - object)
	(present-copy ?x - object)
	(normal-copy ?x - object)
	(inverted-copy ?x - object)
	(idle-copy )
	(cutting-copy )
	(have-cut-copy )
	(splicing-copy )
	(splice-next-copy ?x - object)
	(splicing-last-copy )
	(inverse-splicing-copy )
	(inverse-splice-next-copy ?x - object)
	(inverse-splicing-last-copy )
	(finished-copy )
	(cut-point-1-copy ?x - object)
	(cut-point-2-copy ?x - object)
	(last-cut-point-copy ?x - object)
	(splice-point-1-copy ?x - object)
	(splice-point-2-copy ?x - object)
	(s-first-copy ?x - object)
	(s-next-copy ?x - object ?y - object)
	(s-last-copy ?x - object)
	(=-copy ?x - object ?y - object)
	(invalid )
	(unlock-origin-domain )
	(begin-cut-lock ?x - object ?y - object)
	(continue-cut-lock ?x - object ?y - object)
	(end-cut-1-lock ?x - object ?y - object)
	(end-cut-2-lock ?x - object ?y - object)
	(begin-transpose-splice-lock ?x - object ?y - object)
	(continue-splice-1-lock ?x - object ?y - object)
	(continue-splice-2-lock ?x - object ?y - object)
	(end-splice-1-lock ?x - object ?y - object)
	(end-splice-2-lock ?x - object ?y - object)
	(begin-transverse-splice-lock ?x - object ?y - object)
	(begin-inverse-splice-lock ?x - object ?y - object)
	(begin-inverse-splice-special-case-lock ?x - object)
	(continue-inverse-splice-1a-lock ?x - object ?y - object)
	(continue-inverse-splice-1b-lock ?x - object ?y - object)
	(continue-inverse-splice-2-lock ?x - object ?y - object)
	(end-inverse-splice-1a-lock ?x - object ?y - object)
	(end-inverse-splice-1b-lock ?x - object ?y - object)
	(end-inverse-splice-2-lock ?x - object ?y - object)
	(invert-single-gene-a-lock ?x - object)
	(invert-single-gene-b-lock ?x - object)
	(reset-1-lock ?x - object))
(:functions (total-cost ))
(:action begin-cut
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (= ?x ?y))
		(idle )
		(cw ?x ?y)
		(unlock-origin-domain ))
	:effect (and
		(not (idle ))
		(cutting )
		(not (cw ?x ?y))
		(cut-point-1 ?x)
		(s-first ?y)
		(s-last ?y)
		(begin-cut-lock ?x ?y)
		(not (unlock-origin-domain ))))

(:action continue-cut
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (= ?x ?y))
		(cutting )
		(s-last ?x)
		(cw ?x ?y)
		(inverse-splice-next ?y)
		(unlock-origin-domain ))
	:effect (and
		(not (cw ?x ?y))
		(not (s-last ?x))
		(s-next ?x ?y)
		(s-last ?y)
		(continue-cut-lock ?x ?y)
		(not (unlock-origin-domain ))))

(:action end-cut-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (= ?x ?y))
		(cutting )
		(s-last ?x)
		(cw ?x ?y)
		(unlock-origin-domain ))
	:effect (and
		(cut-point-2 ?y)
		(end-cut-1-lock ?x ?y)
		(not (unlock-origin-domain ))))

(:action end-cut-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(cutting )
		(cut-point-1 ?x)
		(cut-point-2 ?y)
		(unlock-origin-domain ))
	:effect (and
		(not (cutting ))
		(not (cut-point-1 ?x))
		(not (cut-point-2 ?y))
		(have-cut )
		(cw ?x ?y)
		(end-cut-2-lock ?x ?y)
		(not (unlock-origin-domain ))))

(:action begin-transpose-splice
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (= ?x ?y))
		(have-cut )
		(cw ?x ?y)
		(unlock-origin-domain ))
	:effect (and
		(not (have-cut ))
		(not (cw ?x ?y))
		(splicing )
		(splice-point-1 ?x)
		(splice-point-2 ?y)
		(begin-transpose-splice-lock ?x ?y)
		(not (unlock-origin-domain ))(increase (total-cost ) 2)))

(:action continue-splice-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(splicing )
		(s-first ?x)
		(s-next ?x ?y)
		(unlock-origin-domain ))
	:effect (and
		(not (s-first ?x))
		(not (s-next ?x ?y))
		(not (splicing ))
		(s-first ?y)
		(splice-next ?x)
		(continue-splice-1-lock ?x ?y)
		(not (unlock-origin-domain ))))

(:action continue-splice-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(splice-next ?x)
		(splice-point-1 ?y)
		(unlock-origin-domain ))
	:effect (and
		(not (splice-point-1 ?y))
		(not (splice-next ?x))
		(cw ?y ?x)
		(splice-point-1 ?x)
		(splicing )
		(continue-splice-2-lock ?x ?y)
		(not (unlock-origin-domain ))))

(:action end-splice-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(splicing )
		(splice-point-1 ?y)
		(s-first ?x)
		(s-last ?x)
		(unlock-origin-domain ))
	:effect (and
		(not (splicing ))
		(not (s-first ?x))
		(not (s-last ?x))
		(not (splice-point-1 ?y))
		(splicing-last )
		(cw ?y ?x)
		(splice-point-1 ?x)
		(end-splice-1-lock ?x ?y)
		(not (unlock-origin-domain ))))

(:action end-splice-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(splicing-last )
		(splice-point-1 ?x)
		(splice-point-2 ?y)
		(unlock-origin-domain ))
	:effect (and
		(not (splicing-last ))
		(not (splice-point-1 ?x))
		(not (splice-point-2 ?y))
		(finished )
		(cw ?x ?y)
		(end-splice-2-lock ?x ?y)
		(not (unlock-origin-domain ))))

(:action begin-transverse-splice
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (= ?x ?y))
		(have-cut )
		(cw ?x ?y)
		(unlock-origin-domain ))
	:effect (and
		(not (have-cut ))
		(not (cw ?x ?y))
		(inverse-splicing )
		(splice-point-1 ?x)
		(splice-point-2 ?y)
		(begin-transverse-splice-lock ?x ?y)
		(not (unlock-origin-domain ))(increase (total-cost ) 2)))

(:action begin-inverse-splice
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (= ?x ?y))
		(cw ?x ?y)
		(last-cut-point ?x)
		(unlock-origin-domain ))
	:effect (and
		(not (have-cut ))
		(not (cw ?x ?y))
		(inverse-splicing )
		(splice-point-1 ?x)
		(splice-point-2 ?y)
		(begin-inverse-splice-lock ?x ?y)
		(not (unlock-origin-domain ))(increase (total-cost ) 1)))

(:action begin-inverse-splice-special-case
	:parameters (?x - object)
	:precondition (and
		(have-cut )
		(cw ?x ?x)
		(last-cut-point ?x)
		(not (s-last ?x))
		(unlock-origin-domain ))
	:effect (and
		(not (cw ?x ?x))
		(inverse-splicing )
		(splice-point-1 ?x)
		(splice-point-2 ?x)
		(begin-inverse-splice-special-case-lock ?x)
		(not (unlock-origin-domain ))(increase (total-cost ) 1)))

(:action continue-inverse-splice-1a
	:parameters (?x - object
		?y - object)
	:precondition (and
		(inverse-splicing )
		(normal ?x)
		(s-last ?x)
		(s-next ?y ?x)
		(unlock-origin-domain ))
	:effect (and
		(not (s-last ?x))
		(not (s-next ?y ?x))
		(not (normal ?x))
		(s-last ?y)
		(not (inverse-splicing ))
		(inverse-splice-next ?x)
		(inverted ?x)
		(present ?y)
		(continue-inverse-splice-1a-lock ?x ?y)
		(not (unlock-origin-domain ))))

(:action continue-inverse-splice-1b
	:parameters (?x - object
		?y - object)
	:precondition (and
		(inverse-splicing )
		(inverted ?x)
		(s-last ?x)
		(s-next ?y ?x)
		(unlock-origin-domain ))
	:effect (and
		(not (s-last ?x))
		(not (s-next ?y ?x))
		(not (inverted ?x))
		(s-last ?y)
		(not (inverse-splicing ))
		(inverse-splice-next ?x)
		(normal ?x)
		(continue-inverse-splice-1b-lock ?x ?y)
		(not (unlock-origin-domain ))))

(:action continue-inverse-splice-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(inverse-splice-next ?x)
		(splice-point-1 ?y)
		(unlock-origin-domain ))
	:effect (and
		(not (inverse-splice-next ?x))
		(not (splice-point-1 ?y))
		(inverse-splicing )
		(cw ?y ?x)
		(splice-point-1 ?x)
		(continue-inverse-splice-2-lock ?x ?y)
		(not (unlock-origin-domain ))))

(:action end-inverse-splice-1a
	:parameters (?x - object
		?y - object)
	:precondition (and
		(inverse-splicing )
		(normal ?x)
		(splice-point-1 ?y)
		(s-first ?x)
		(s-last ?x)
		(unlock-origin-domain ))
	:effect (and
		(not (inverse-splicing ))
		(inverse-splicing-last )
		(not (splice-point-1 ?y))
		(not (s-first ?x))
		(not (s-last ?x))
		(not (normal ?x))
		(cw ?y ?x)
		(splice-point-1 ?x)
		(inverted ?x)
		(end-inverse-splice-1a-lock ?x ?y)
		(not (unlock-origin-domain ))))

(:action end-inverse-splice-1b
	:parameters (?x - object
		?y - object)
	:precondition (and
		(inverse-splicing )
		(inverted ?x)
		(splice-point-1 ?y)
		(s-first ?x)
		(s-last ?x)
		(unlock-origin-domain ))
	:effect (and
		(not (inverse-splicing ))
		(inverse-splicing-last )
		(not (splice-point-1 ?y))
		(not (s-first ?x))
		(not (s-last ?x))
		(not (inverted ?x))
		(cw ?y ?x)
		(splice-point-1 ?x)
		(normal ?x)
		(end-inverse-splice-1b-lock ?x ?y)
		(not (unlock-origin-domain ))))

(:action end-inverse-splice-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(inverse-splicing-last )
		(splice-point-1 ?x)
		(splice-point-2 ?y)
		(unlock-origin-domain ))
	:effect (and
		(not (inverse-splicing-last ))
		(not (splice-point-1 ?x))
		(not (splice-point-2 ?y))
		(finished )
		(cw ?x ?y)
		(end-inverse-splice-2-lock ?x ?y)
		(not (unlock-origin-domain ))))

(:action invert-single-gene-a
	:parameters (?x - object)
	:precondition (and
		(idle )
		(normal ?x)
		(unlock-origin-domain ))
	:effect (and
		(not (normal ?x))
		(inverted ?x)
		(not (splice-point-2 ?x))
		(invert-single-gene-a-lock ?x)
		(not (unlock-origin-domain ))(increase (total-cost ) 1)))

(:action invert-single-gene-b
	:parameters (?x - object)
	:precondition (and
		(idle )
		(inverted ?x)
		(unlock-origin-domain ))
	:effect (and
		(not (inverted ?x))
		(normal ?x)
		(invert-single-gene-b-lock ?x)
		(not (unlock-origin-domain ))(increase (total-cost ) 1)))

(:action reset-1
	:parameters (?x - object)
	:precondition (and
		(finished )
		(unlock-origin-domain ))
	:effect (and
		(not (last-cut-point ?x))
		(not (finished ))
		(reset-1-lock ?x)
		(not (unlock-origin-domain ))))

(:action begin-cut-stop-0
	:parameters (?x - object
		?y - object)
	:precondition (and
		(=-copy ?x ?y)
		(begin-cut-lock ?x ?y))
	:effect (and
		(invalid )))

(:action begin-cut-stop-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (idle-copy ))
		(begin-cut-lock ?x ?y))
	:effect (and
		(invalid )))

(:action begin-cut-stop-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (cw-copy ?x ?y))
		(begin-cut-lock ?x ?y))
	:effect (and
		(invalid )))

(:action begin-cut-copy
	:parameters (?x - object
		?y - object)
	:precondition (and
		(begin-cut-lock ?x ?y)
		(not (=-copy ?x ?y))
		(idle-copy )
		(cw-copy ?x ?y))
	:effect (and
		(not (begin-cut-lock ?x ?y))
		(unlock-origin-domain )
		(not (idle-copy ))
		(cutting-copy )
		(not (cw-copy ?x ?y))
		(cut-point-1-copy ?x)
		(last-cut-point-copy ?x)
		(s-first-copy ?y)
		(s-last-copy ?y)))

(:action continue-cut-stop-0
	:parameters (?x - object
		?y - object)
	:precondition (and
		(=-copy ?x ?y)
		(continue-cut-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-cut-stop-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (cutting-copy ))
		(continue-cut-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-cut-stop-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (s-last-copy ?x))
		(continue-cut-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-cut-stop-3
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (cw-copy ?x ?y))
		(continue-cut-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-cut-copy
	:parameters (?x - object
		?y - object)
	:precondition (and
		(continue-cut-lock ?x ?y)
		(not (=-copy ?x ?y))
		(cutting-copy )
		(s-last-copy ?x)
		(cw-copy ?x ?y))
	:effect (and
		(not (continue-cut-lock ?x ?y))
		(unlock-origin-domain )
		(not (cw-copy ?x ?y))
		(not (s-last-copy ?x))
		(s-next-copy ?x ?y)
		(s-last-copy ?y)))

(:action end-cut-1-stop-0
	:parameters (?x - object
		?y - object)
	:precondition (and
		(=-copy ?x ?y)
		(end-cut-1-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-cut-1-stop-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (cutting-copy ))
		(end-cut-1-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-cut-1-stop-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (s-last-copy ?x))
		(end-cut-1-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-cut-1-stop-3
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (cw-copy ?x ?y))
		(end-cut-1-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-cut-1-copy
	:parameters (?x - object
		?y - object)
	:precondition (and
		(end-cut-1-lock ?x ?y)
		(not (=-copy ?x ?y))
		(cutting-copy )
		(s-last-copy ?x)
		(cw-copy ?x ?y))
	:effect (and
		(not (end-cut-1-lock ?x ?y))
		(unlock-origin-domain )
		(not (cw-copy ?x ?y))
		(cut-point-2-copy ?y)))

(:action end-cut-2-stop-0
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (cutting-copy ))
		(end-cut-2-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-cut-2-stop-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (cut-point-1-copy ?x))
		(end-cut-2-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-cut-2-stop-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (cut-point-2-copy ?y))
		(end-cut-2-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-cut-2-copy
	:parameters (?x - object
		?y - object)
	:precondition (and
		(end-cut-2-lock ?x ?y)
		(cutting-copy )
		(cut-point-1-copy ?x)
		(cut-point-2-copy ?y))
	:effect (and
		(not (end-cut-2-lock ?x ?y))
		(unlock-origin-domain )
		(not (cutting-copy ))
		(not (cut-point-1-copy ?x))
		(not (cut-point-2-copy ?y))
		(have-cut-copy )
		(cw-copy ?x ?y)))

(:action begin-transpose-splice-stop-0
	:parameters (?x - object
		?y - object)
	:precondition (and
		(=-copy ?x ?y)
		(begin-transpose-splice-lock ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 2)))

(:action begin-transpose-splice-stop-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (have-cut-copy ))
		(begin-transpose-splice-lock ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 2)))

(:action begin-transpose-splice-stop-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (cw-copy ?x ?y))
		(begin-transpose-splice-lock ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 2)))

(:action begin-transpose-splice-copy
	:parameters (?x - object
		?y - object)
	:precondition (and
		(begin-transpose-splice-lock ?x ?y)
		(not (=-copy ?x ?y))
		(have-cut-copy )
		(cw-copy ?x ?y))
	:effect (and
		(not (begin-transpose-splice-lock ?x ?y))
		(unlock-origin-domain )
		(not (have-cut-copy ))
		(not (cw-copy ?x ?y))
		(splicing-copy )
		(splice-point-1-copy ?x)
		(splice-point-2-copy ?y)(increase (total-cost ) 2)))

(:action continue-splice-1-stop-0
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (splicing-copy ))
		(continue-splice-1-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-splice-1-stop-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (s-first-copy ?x))
		(continue-splice-1-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-splice-1-stop-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (s-next-copy ?x ?y))
		(continue-splice-1-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-splice-1-copy
	:parameters (?x - object
		?y - object)
	:precondition (and
		(continue-splice-1-lock ?x ?y)
		(splicing-copy )
		(s-first-copy ?x)
		(s-next-copy ?x ?y))
	:effect (and
		(not (continue-splice-1-lock ?x ?y))
		(unlock-origin-domain )
		(not (s-first-copy ?x))
		(not (s-next-copy ?x ?y))
		(not (splicing-copy ))
		(s-first-copy ?y)
		(splice-next-copy ?x)))

(:action continue-splice-2-stop-0
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (splice-next-copy ?x))
		(continue-splice-2-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-splice-2-stop-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (splice-point-1-copy ?y))
		(continue-splice-2-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-splice-2-copy
	:parameters (?x - object
		?y - object)
	:precondition (and
		(continue-splice-2-lock ?x ?y)
		(splice-next-copy ?x)
		(splice-point-1-copy ?y))
	:effect (and
		(not (continue-splice-2-lock ?x ?y))
		(unlock-origin-domain )
		(not (splice-point-1-copy ?y))
		(not (splice-next-copy ?x))
		(cw-copy ?y ?x)
		(splice-point-1-copy ?x)
		(splicing-copy )))

(:action end-splice-1-stop-0
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (splicing-copy ))
		(end-splice-1-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-splice-1-stop-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (splice-point-1-copy ?y))
		(end-splice-1-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-splice-1-stop-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (s-first-copy ?x))
		(end-splice-1-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-splice-1-stop-3
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (s-last-copy ?x))
		(end-splice-1-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-splice-1-copy
	:parameters (?x - object
		?y - object)
	:precondition (and
		(end-splice-1-lock ?x ?y)
		(splicing-copy )
		(splice-point-1-copy ?y)
		(s-first-copy ?x)
		(s-last-copy ?x))
	:effect (and
		(not (end-splice-1-lock ?x ?y))
		(unlock-origin-domain )
		(not (splicing-copy ))
		(not (s-first-copy ?x))
		(not (s-last-copy ?x))
		(not (splice-point-1-copy ?y))
		(splicing-last-copy )
		(cw-copy ?y ?x)
		(splice-point-1-copy ?x)))

(:action end-splice-2-stop-0
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (splicing-last-copy ))
		(end-splice-2-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-splice-2-stop-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (splice-point-1-copy ?x))
		(end-splice-2-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-splice-2-stop-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (splice-point-2-copy ?y))
		(end-splice-2-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-splice-2-copy
	:parameters (?x - object
		?y - object)
	:precondition (and
		(end-splice-2-lock ?x ?y)
		(splicing-last-copy )
		(splice-point-1-copy ?x)
		(splice-point-2-copy ?y))
	:effect (and
		(not (end-splice-2-lock ?x ?y))
		(unlock-origin-domain )
		(not (splicing-last-copy ))
		(not (splice-point-1-copy ?x))
		(not (splice-point-2-copy ?y))
		(finished-copy )
		(cw-copy ?x ?y)))

(:action begin-transverse-splice-stop-0
	:parameters (?x - object
		?y - object)
	:precondition (and
		(=-copy ?x ?y)
		(begin-transverse-splice-lock ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 2)))

(:action begin-transverse-splice-stop-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (have-cut-copy ))
		(begin-transverse-splice-lock ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 2)))

(:action begin-transverse-splice-stop-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (cw-copy ?x ?y))
		(begin-transverse-splice-lock ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 2)))

(:action begin-transverse-splice-copy
	:parameters (?x - object
		?y - object)
	:precondition (and
		(begin-transverse-splice-lock ?x ?y)
		(not (=-copy ?x ?y))
		(have-cut-copy )
		(cw-copy ?x ?y))
	:effect (and
		(not (begin-transverse-splice-lock ?x ?y))
		(unlock-origin-domain )
		(not (have-cut-copy ))
		(not (cw-copy ?x ?y))
		(inverse-splicing-copy )
		(splice-point-1-copy ?x)
		(splice-point-2-copy ?y)(increase (total-cost ) 2)))

(:action begin-inverse-splice-stop-0
	:parameters (?x - object
		?y - object)
	:precondition (and
		(=-copy ?x ?y)
		(begin-inverse-splice-lock ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action begin-inverse-splice-stop-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (have-cut-copy ))
		(begin-inverse-splice-lock ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action begin-inverse-splice-stop-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (cw-copy ?x ?y))
		(begin-inverse-splice-lock ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action begin-inverse-splice-stop-3
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (last-cut-point-copy ?x))
		(begin-inverse-splice-lock ?x ?y))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action begin-inverse-splice-copy
	:parameters (?x - object
		?y - object)
	:precondition (and
		(begin-inverse-splice-lock ?x ?y)
		(not (=-copy ?x ?y))
		(have-cut-copy )
		(cw-copy ?x ?y)
		(last-cut-point-copy ?x))
	:effect (and
		(not (begin-inverse-splice-lock ?x ?y))
		(unlock-origin-domain )
		(not (have-cut-copy ))
		(not (cw-copy ?x ?y))
		(inverse-splicing-copy )
		(splice-point-1-copy ?x)
		(splice-point-2-copy ?y)(increase (total-cost ) 1)))

(:action begin-inverse-splice-special-case-stop-0
	:parameters (?x - object)
	:precondition (and
		(not (have-cut-copy ))
		(begin-inverse-splice-special-case-lock ?x))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action begin-inverse-splice-special-case-stop-1
	:parameters (?x - object)
	:precondition (and
		(not (cw-copy ?x ?x))
		(begin-inverse-splice-special-case-lock ?x))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action begin-inverse-splice-special-case-stop-2
	:parameters (?x - object)
	:precondition (and
		(not (last-cut-point-copy ?x))
		(begin-inverse-splice-special-case-lock ?x))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action begin-inverse-splice-special-case-copy
	:parameters (?x - object)
	:precondition (and
		(begin-inverse-splice-special-case-lock ?x)
		(have-cut-copy )
		(cw-copy ?x ?x)
		(last-cut-point-copy ?x))
	:effect (and
		(not (begin-inverse-splice-special-case-lock ?x))
		(unlock-origin-domain )
		(not (have-cut-copy ))
		(not (cw-copy ?x ?x))
		(inverse-splicing-copy )
		(splice-point-1-copy ?x)
		(splice-point-2-copy ?x)(increase (total-cost ) 1)))

(:action continue-inverse-splice-1a-stop-0
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (inverse-splicing-copy ))
		(continue-inverse-splice-1a-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-inverse-splice-1a-stop-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (normal-copy ?x))
		(continue-inverse-splice-1a-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-inverse-splice-1a-stop-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (s-last-copy ?x))
		(continue-inverse-splice-1a-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-inverse-splice-1a-stop-3
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (s-next-copy ?y ?x))
		(continue-inverse-splice-1a-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-inverse-splice-1a-copy
	:parameters (?x - object
		?y - object)
	:precondition (and
		(continue-inverse-splice-1a-lock ?x ?y)
		(inverse-splicing-copy )
		(normal-copy ?x)
		(s-last-copy ?x)
		(s-next-copy ?y ?x))
	:effect (and
		(not (continue-inverse-splice-1a-lock ?x ?y))
		(unlock-origin-domain )
		(not (s-last-copy ?x))
		(not (s-next-copy ?y ?x))
		(not (normal-copy ?x))
		(s-last-copy ?y)
		(not (inverse-splicing-copy ))
		(inverse-splice-next-copy ?x)
		(inverted-copy ?x)))

(:action continue-inverse-splice-1b-stop-0
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (inverse-splicing-copy ))
		(continue-inverse-splice-1b-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-inverse-splice-1b-stop-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (inverted-copy ?x))
		(continue-inverse-splice-1b-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-inverse-splice-1b-stop-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (s-last-copy ?x))
		(continue-inverse-splice-1b-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-inverse-splice-1b-stop-3
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (s-next-copy ?y ?x))
		(continue-inverse-splice-1b-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-inverse-splice-1b-copy
	:parameters (?x - object
		?y - object)
	:precondition (and
		(continue-inverse-splice-1b-lock ?x ?y)
		(inverse-splicing-copy )
		(inverted-copy ?x)
		(s-last-copy ?x)
		(s-next-copy ?y ?x))
	:effect (and
		(not (continue-inverse-splice-1b-lock ?x ?y))
		(unlock-origin-domain )
		(not (s-last-copy ?x))
		(not (s-next-copy ?y ?x))
		(not (inverted-copy ?x))
		(s-last-copy ?y)
		(not (inverse-splicing-copy ))
		(inverse-splice-next-copy ?x)
		(normal-copy ?x)))

(:action continue-inverse-splice-2-stop-0
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (inverse-splice-next-copy ?x))
		(continue-inverse-splice-2-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-inverse-splice-2-stop-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (splice-point-1-copy ?y))
		(continue-inverse-splice-2-lock ?x ?y))
	:effect (and
		(invalid )))

(:action continue-inverse-splice-2-copy
	:parameters (?x - object
		?y - object)
	:precondition (and
		(continue-inverse-splice-2-lock ?x ?y)
		(inverse-splice-next-copy ?x)
		(splice-point-1-copy ?y))
	:effect (and
		(not (continue-inverse-splice-2-lock ?x ?y))
		(unlock-origin-domain )
		(not (inverse-splice-next-copy ?x))
		(not (splice-point-1-copy ?y))
		(inverse-splicing-copy )
		(cw-copy ?y ?x)
		(splice-point-1-copy ?x)))

(:action end-inverse-splice-1a-stop-0
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (inverse-splicing-copy ))
		(end-inverse-splice-1a-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-inverse-splice-1a-stop-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (normal-copy ?x))
		(end-inverse-splice-1a-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-inverse-splice-1a-stop-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (splice-point-1-copy ?y))
		(end-inverse-splice-1a-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-inverse-splice-1a-stop-3
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (s-first-copy ?x))
		(end-inverse-splice-1a-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-inverse-splice-1a-stop-4
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (s-last-copy ?x))
		(end-inverse-splice-1a-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-inverse-splice-1a-copy
	:parameters (?x - object
		?y - object)
	:precondition (and
		(end-inverse-splice-1a-lock ?x ?y)
		(inverse-splicing-copy )
		(normal-copy ?x)
		(splice-point-1-copy ?y)
		(s-first-copy ?x)
		(s-last-copy ?x))
	:effect (and
		(not (end-inverse-splice-1a-lock ?x ?y))
		(unlock-origin-domain )
		(not (inverse-splicing-copy ))
		(inverse-splicing-last-copy )
		(not (splice-point-1-copy ?y))
		(not (s-first-copy ?x))
		(not (s-last-copy ?x))
		(not (normal-copy ?x))
		(cw-copy ?y ?x)
		(splice-point-1-copy ?x)
		(inverted-copy ?x)))

(:action end-inverse-splice-1b-stop-0
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (inverse-splicing-copy ))
		(end-inverse-splice-1b-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-inverse-splice-1b-stop-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (inverted-copy ?x))
		(end-inverse-splice-1b-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-inverse-splice-1b-stop-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (splice-point-1-copy ?y))
		(end-inverse-splice-1b-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-inverse-splice-1b-stop-3
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (s-first-copy ?x))
		(end-inverse-splice-1b-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-inverse-splice-1b-stop-4
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (s-last-copy ?x))
		(end-inverse-splice-1b-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-inverse-splice-1b-copy
	:parameters (?x - object
		?y - object)
	:precondition (and
		(end-inverse-splice-1b-lock ?x ?y)
		(inverse-splicing-copy )
		(inverted-copy ?x)
		(splice-point-1-copy ?y)
		(s-first-copy ?x)
		(s-last-copy ?x))
	:effect (and
		(not (end-inverse-splice-1b-lock ?x ?y))
		(unlock-origin-domain )
		(not (inverse-splicing-copy ))
		(inverse-splicing-last-copy )
		(not (splice-point-1-copy ?y))
		(not (s-first-copy ?x))
		(not (s-last-copy ?x))
		(not (inverted-copy ?x))
		(cw-copy ?y ?x)
		(splice-point-1-copy ?x)
		(normal-copy ?x)))

(:action end-inverse-splice-2-stop-0
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (inverse-splicing-last-copy ))
		(end-inverse-splice-2-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-inverse-splice-2-stop-1
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (splice-point-1-copy ?x))
		(end-inverse-splice-2-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-inverse-splice-2-stop-2
	:parameters (?x - object
		?y - object)
	:precondition (and
		(not (splice-point-2-copy ?y))
		(end-inverse-splice-2-lock ?x ?y))
	:effect (and
		(invalid )))

(:action end-inverse-splice-2-copy
	:parameters (?x - object
		?y - object)
	:precondition (and
		(end-inverse-splice-2-lock ?x ?y)
		(inverse-splicing-last-copy )
		(splice-point-1-copy ?x)
		(splice-point-2-copy ?y))
	:effect (and
		(not (end-inverse-splice-2-lock ?x ?y))
		(unlock-origin-domain )
		(not (inverse-splicing-last-copy ))
		(not (splice-point-1-copy ?x))
		(not (splice-point-2-copy ?y))
		(finished-copy )
		(cw-copy ?x ?y)))

(:action invert-single-gene-a-stop-0
	:parameters (?x - object)
	:precondition (and
		(not (idle-copy ))
		(invert-single-gene-a-lock ?x))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action invert-single-gene-a-stop-1
	:parameters (?x - object)
	:precondition (and
		(not (normal-copy ?x))
		(invert-single-gene-a-lock ?x))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action invert-single-gene-a-copy
	:parameters (?x - object)
	:precondition (and
		(invert-single-gene-a-lock ?x)
		(idle-copy )
		(normal-copy ?x))
	:effect (and
		(not (invert-single-gene-a-lock ?x))
		(unlock-origin-domain )
		(not (normal-copy ?x))
		(inverted-copy ?x)(increase (total-cost ) 1)))

(:action invert-single-gene-b-stop-0
	:parameters (?x - object)
	:precondition (and
		(not (idle-copy ))
		(invert-single-gene-b-lock ?x))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action invert-single-gene-b-stop-1
	:parameters (?x - object)
	:precondition (and
		(not (inverted-copy ?x))
		(invert-single-gene-b-lock ?x))
	:effect (and
		(invalid )(increase (total-cost ) 1)))

(:action invert-single-gene-b-copy
	:parameters (?x - object)
	:precondition (and
		(invert-single-gene-b-lock ?x)
		(idle-copy )
		(inverted-copy ?x))
	:effect (and
		(not (invert-single-gene-b-lock ?x))
		(unlock-origin-domain )
		(not (inverted-copy ?x))
		(normal-copy ?x)(increase (total-cost ) 1)))

(:action reset-1-stop-0
	:parameters (?x - object)
	:precondition (and
		(not (finished-copy ))
		(reset-1-lock ?x))
	:effect (and
		(invalid )))

(:action reset-1-stop-1
	:parameters (?x - object)
	:precondition (and
		(not (last-cut-point-copy ?x))
		(reset-1-lock ?x))
	:effect (and
		(invalid )))

(:action reset-1-copy
	:parameters (?x - object)
	:precondition (and
		(reset-1-lock ?x)
		(finished-copy )
		(last-cut-point-copy ?x))
	:effect (and
		(not (reset-1-lock ?x))
		(unlock-origin-domain )
		(not (last-cut-point-copy ?x))
		(not (finished-copy ))
		(idle-copy )))

(:action turning
	:parameters ()
	:precondition (and
		(invalid ))
	:effect (and
		(unlock-origin-domain ))) )