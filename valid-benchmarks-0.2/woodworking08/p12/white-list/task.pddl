(define (problem wood-prob)                       (:domain woodworking)                       (:objects white - acolour
s7 - aboardsize
glazer0 - glazer
s9 - aboardsize
immersion-varnisher0 - immersion-varnisher
blue - acolour
s3 - aboardsize
spray-varnisher0 - spray-varnisher
oak - awood
s2 - aboardsize
b1 - board
s4 - aboardsize
s6 - aboardsize
s5 - aboardsize
highspeed-saw0 - highspeed-saw
saw0 - saw
pine - awood
p2 - part
s10 - aboardsize
s0 - aboardsize
s1 - aboardsize
b0 - board
p0 - part
grinder0 - grinder
s8 - aboardsize
p1 - part
mauve - acolour
planer0 - planer
p3 - part)                        (:init (grind-treatment-change glazed untreated)
(wood-copy b1 pine)
(unlock-origin-domain )
(surface-condition-copy b0 rough)
(= (glaze-cost p1) 20)
(boardsize-successor-copy s9 s10)
(has-colour-copy spray-varnisher0 blue)
(boardsize-successor-copy s7 s8)
(available b0)
(boardsize-successor s8 s9)
(boardsize-successor-copy s2 s3)
(goalsize-copy p0 medium)
(unused-copy p3)
(wood b1 pine)
(= (grind-cost p0) 30)
(boardsize-successor s5 s6)
(available b1)
(available-copy b1)
(has-colour-copy immersion-varnisher0 mauve)
(is-smooth-copy smooth)
(goalsize p3 medium)
(grind-treatment-change varnished colourfragments)
(is-smooth smooth)
(unused-copy p0)
(= (total-cost ) 0)
(boardsize-successor-copy s0 s1)
(= (grind-cost p2) 45)
(has-colour-copy immersion-varnisher0 blue)
(goalsize-copy p3 medium)
(surface-condition-copy b1 rough)
(has-colour glazer0 mauve)
(grind-treatment-change colourfragments untreated)
(grind-treatment-change-copy glazed untreated)
(empty-copy highspeed-saw0)
(unused p2)
(boardsize-successor-copy s3 s4)
(has-colour-copy glazer0 blue)
(boardsize-successor-copy s1 s2)
(unused p1)
(boardsize-successor s9 s10)
(boardsize-successor s7 s8)
(= (glaze-cost p3) 15)
(boardsize-successor s2 s3)
(= (spray-varnish-cost p0) 10)
(boardsize-successor s0 s1)
(grind-treatment-change-copy colourfragments untreated)
(goalsize p2 large)
(boardsize-copy b0 s10)
(= (grind-cost p3) 30)
(unused p3)
(= (plane-cost p3) 20)
(goalsize-copy p2 large)
(has-colour glazer0 white)
(boardsize b0 s10)
(wood-copy b0 oak)
(unused p0)
(boardsize-successor-copy s4 s5)
(boardsize-successor s3 s4)
(boardsize-successor s1 s2)
(boardsize-copy b1 s3)
(has-colour-copy glazer0 mauve)
(grind-treatment-change-copy varnished colourfragments)
(= (spray-varnish-cost p3) 10)
(boardsize-successor-copy s6 s7)
(= (plane-cost p2) 30)
(unused-copy p2)
(has-colour spray-varnisher0 mauve)
(is-smooth-copy verysmooth)
(is-smooth verysmooth)
(has-colour spray-varnisher0 blue)
(empty highspeed-saw0)
(boardsize-successor s4 s5)
(grind-treatment-change untreated untreated)
(has-colour immersion-varnisher0 mauve)
(goalsize p0 medium)
(= (plane-cost p1) 30)
(has-colour immersion-varnisher0 blue)
(= (grind-cost p1) 45)
(available-copy b0)
(wood b0 oak)
(boardsize b1 s3)
(has-colour-copy glazer0 white)
(boardsize-successor-copy s8 s9)
(surface-condition b0 rough)
(= (plane-cost p0) 20)
(boardsize-successor-copy s5 s6)
(boardsize-successor s6 s7)
(= (spray-varnish-cost p1) 15)
(= (glaze-cost p2) 20)
(has-colour glazer0 blue)
(goalsize p1 large)
(unused-copy p1)
(grind-treatment-change-copy untreated untreated)
(goalsize-copy p1 large)
(surface-condition b1 rough)
(= (spray-varnish-cost p2) 15)
(= (glaze-cost p0) 15)
(has-colour-copy spray-varnisher0 mauve))                        (:goal (and
		(available p0)
		(colour p0 mauve)
		(surface-condition p0 smooth)
		(available p1)
		(colour p1 blue)
		(surface-condition p1 smooth)
		(available p2)
		(colour p2 white)
		(wood p2 oak)
		(surface-condition p2 smooth)
		(treatment p2 glazed)
		(available p3)
		(colour p3 mauve)
		(wood p3 pine)
		(treatment p3 glazed)
		(invalid )))                        (:metric minimize (total-cost) ))