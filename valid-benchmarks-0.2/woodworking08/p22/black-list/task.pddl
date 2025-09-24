(define (problem wood-prob)                       (:domain woodworking)                       (:objects glazer0 - glazer
immersion-varnisher0 - immersion-varnisher
blue - acolour
p3 - part
s3 - aboardsize
spray-varnisher0 - spray-varnisher
s2 - aboardsize
b1 - board
s4 - aboardsize
s5 - aboardsize
highspeed-saw0 - highspeed-saw
saw0 - saw
pine - awood
p2 - part
s0 - aboardsize
s1 - aboardsize
b0 - board
p0 - part
grinder0 - grinder
black - acolour
red - acolour
p1 - part
planer0 - planer
mahogany - awood)                        (:init (grind-treatment-change glazed untreated)
(wood-copy b1 pine)
(unlock-origin-domain )
(= (spray-varnish-cost p2) 10)
(wood-copy b0 mahogany)
(surface-condition-copy b0 rough)
(= (plane-cost p2) 20)
(available b0)
(boardsize-successor-copy s2 s3)
(goalsize-copy p0 medium)
(unused-copy p3)
(= (glaze-cost p2) 15)
(wood b1 pine)
(available b1)
(has-colour spray-varnisher0 natural)
(available-copy b1)
(wood b0 mahogany)
(is-smooth-copy smooth)
(grind-treatment-change varnished colourfragments)
(is-smooth smooth)
(unused-copy p0)
(boardsize-successor-copy s0 s1)
(surface-condition-copy b1 rough)
(= (plane-cost p0) 20)
(grind-treatment-change colourfragments untreated)
(has-colour immersion-varnisher0 natural)
(grind-treatment-change-copy glazed untreated)
(has-colour glazer0 black)
(empty-copy highspeed-saw0)
(boardsize-copy b1 s5)
(unused p2)
(boardsize-successor-copy s3 s4)
(boardsize-successor-copy s1 s2)
(has-colour immersion-varnisher0 black)
(unused p1)
(boardsize b1 s5)
(has-colour glazer0 natural)
(boardsize-successor s2 s3)
(= (glaze-cost p1) 20)
(boardsize-successor s0 s1)
(grind-treatment-change-copy colourfragments untreated)
(has-colour spray-varnisher0 black)
(unused p3)
(has-colour-copy spray-varnisher0 natural)
(unused p0)
(boardsize-successor-copy s4 s5)
(boardsize-successor s3 s4)
(= (grind-cost p0) 30)
(boardsize-successor s1 s2)
(has-colour-copy immersion-varnisher0 natural)
(has-colour-copy glazer0 black)
(= (grind-cost p2) 30)
(grind-treatment-change-copy varnished colourfragments)
(= (glaze-cost p3) 20)
(= (total-cost ) 0)
(goalsize p2 medium)
(boardsize-copy b0 s5)
(has-colour-copy immersion-varnisher0 black)
(unused-copy p2)
(= (glaze-cost p0) 15)
(boardsize b0 s5)
(= (plane-cost p1) 30)
(has-colour-copy glazer0 natural)
(goalsize-copy p2 medium)
(= (spray-varnish-cost p3) 15)
(is-smooth-copy verysmooth)
(= (spray-varnish-cost p0) 10)
(is-smooth verysmooth)
(empty highspeed-saw0)
(boardsize-successor s4 s5)
(grind-treatment-change untreated untreated)
(goalsize p0 medium)
(= (spray-varnish-cost p1) 15)
(has-colour-copy spray-varnisher0 black)
(available-copy b0)
(surface-condition b0 rough)
(= (grind-cost p1) 45)
(= (plane-cost p3) 30)
(goalsize p1 large)
(goalsize p3 large)
(unused-copy p1)
(= (grind-cost p3) 45)
(grind-treatment-change-copy untreated untreated)
(goalsize-copy p1 large)
(surface-condition b1 rough)
(goalsize-copy p3 large))                        (:goal (and
		(available p0)
		(colour p0 black)
		(wood p0 mahogany)
		(available p1)
		(wood p1 pine)
		(surface-condition p1 smooth)
		(available p2)
		(wood p2 pine)
		(treatment p2 varnished)
		(available p3)
		(colour p3 natural)
		(wood p3 mahogany)
		(invalid )))                        (:metric minimize (total-cost) ))