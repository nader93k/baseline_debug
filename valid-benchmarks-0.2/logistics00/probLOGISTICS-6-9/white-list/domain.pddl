(define (domain logistics)
(:requirements :strips)
(:types
	object)
(:constants )
(:predicates
	(package ?obj - object)
	(truck ?truck - object)
	(airplane ?airplane - object)
	(airport ?airport - object)
	(location ?loc - object)
	(in-city ?obj - object ?city - object)
	(city ?city - object)
	(at ?obj - object ?loc - object)
	(in ?obj - object ?obj - object)
	(= ?x - object ?y - object)
	(package-copy ?obj - object)
	(truck-copy ?truck - object)
	(airplane-copy ?airplane - object)
	(airport-copy ?airport - object)
	(location-copy ?loc - object)
	(in-city-copy ?obj - object ?city - object)
	(city-copy ?city - object)
	(at-copy ?obj - object ?loc - object)
	(in-copy ?obj - object ?obj - object)
	(=-copy ?x - object ?y - object)
	(invalid )
	(unlock-origin-domain )
	(load-truck-lock ?obj - object ?truck - object ?loc - object)
	(load-airplane-lock ?obj - object ?airplane - object ?loc - object)
	(unload-truck-lock ?obj - object ?truck - object ?loc - object)
	(unload-airplane-lock ?obj - object ?airplane - object ?loc - object)
	(drive-truck-lock ?truck - object ?loc-from - object ?loc-to - object ?city - object)
	(fly-airplane-lock ?airplane - object ?loc-from - object ?loc-to - object))
(:functions )
(:action load-truck
	:parameters (?obj - object
		?truck - object
		?loc - object)
	:precondition (and
		(package ?obj)
		(truck ?truck)
		(location ?loc)
		(at ?truck ?loc)
		(at ?obj ?loc)
		(unlock-origin-domain ))
	:effect (and
		(not (at ?obj ?loc))
		(in ?obj ?truck)
		(load-truck-lock ?obj ?truck ?loc)
		(not (unlock-origin-domain ))))

(:action load-airplane
	:parameters (?obj - object
		?airplane - object
		?loc - object)
	:precondition (and
		(package ?obj)
		(airplane ?airplane)
		(location ?loc)
		(at ?obj ?loc)
		(at ?airplane ?loc)
		(unlock-origin-domain ))
	:effect (and
		(not (at ?obj ?loc))
		(in ?obj ?airplane)
		(load-airplane-lock ?obj ?airplane ?loc)
		(not (unlock-origin-domain ))))

(:action unload-truck
	:parameters (?obj - object
		?truck - object
		?loc - object)
	:precondition (and
		(package ?obj)
		(truck ?truck)
		(location ?loc)
		(at ?truck ?loc)
		(in ?obj ?truck)
		(unlock-origin-domain ))
	:effect (and
		(not (in ?obj ?truck))
		(at ?obj ?loc)
		(unload-truck-lock ?obj ?truck ?loc)
		(not (unlock-origin-domain ))))

(:action unload-airplane
	:parameters (?obj - object
		?airplane - object
		?loc - object)
	:precondition (and
		(package ?obj)
		(airplane ?airplane)
		(location ?loc)
		(in ?obj ?airplane)
		(at ?airplane ?loc)
		(unlock-origin-domain ))
	:effect (and
		(not (in ?obj ?airplane))
		(at ?obj ?loc)
		(unload-airplane-lock ?obj ?airplane ?loc)
		(not (unlock-origin-domain ))))

(:action drive-truck
	:parameters (?truck - object
		?loc-from - object
		?loc-to - object
		?city - object)
	:precondition (and
		(truck ?truck)
		(location ?loc-from)
		(location ?loc-to)
		(city ?city)
		(at ?truck ?loc-from)
		(in-city ?loc-from ?city)
		(in-city ?loc-to ?city)
		(unlock-origin-domain ))
	:effect (and
		(not (at ?truck ?loc-from))
		(at ?truck ?loc-to)
		(drive-truck-lock ?truck ?loc-from ?loc-to ?city)
		(not (unlock-origin-domain ))))

(:action fly-airplane
	:parameters (?airplane - object
		?loc-from - object
		?loc-to - object)
	:precondition (and
		(airplane ?airplane)
		(airport ?loc-from)
		(airport ?loc-to)
		(at ?airplane ?loc-from)
		(unlock-origin-domain ))
	:effect (and
		(not (at ?airplane ?loc-from))
		(at ?airplane ?loc-to)
		(fly-airplane-lock ?airplane ?loc-from ?loc-to)
		(not (unlock-origin-domain ))))

(:action load-truck-stop-0
	:parameters (?obj - object
		?truck - object
		?loc - object)
	:precondition (and
		(not (package-copy ?obj))
		(load-truck-lock ?obj ?truck ?loc))
	:effect (and
		(invalid )))

(:action load-truck-stop-1
	:parameters (?obj - object
		?truck - object
		?loc - object)
	:precondition (and
		(not (truck-copy ?truck))
		(load-truck-lock ?obj ?truck ?loc))
	:effect (and
		(invalid )))

(:action load-truck-stop-2
	:parameters (?obj - object
		?truck - object
		?loc - object)
	:precondition (and
		(not (location-copy ?loc))
		(load-truck-lock ?obj ?truck ?loc))
	:effect (and
		(invalid )))

(:action load-truck-stop-3
	:parameters (?obj - object
		?truck - object
		?loc - object)
	:precondition (and
		(not (at-copy ?truck ?loc))
		(load-truck-lock ?obj ?truck ?loc))
	:effect (and
		(invalid )))

(:action load-truck-stop-4
	:parameters (?obj - object
		?truck - object
		?loc - object)
	:precondition (and
		(not (at-copy ?obj ?loc))
		(load-truck-lock ?obj ?truck ?loc))
	:effect (and
		(invalid )))

(:action load-truck-copy
	:parameters (?obj - object
		?truck - object
		?loc - object)
	:precondition (and
		(load-truck-lock ?obj ?truck ?loc)
		(package-copy ?obj)
		(truck-copy ?truck)
		(location-copy ?loc)
		(at-copy ?truck ?loc)
		(at-copy ?obj ?loc))
	:effect (and
		(not (load-truck-lock ?obj ?truck ?loc))
		(unlock-origin-domain )
		(not (at-copy ?obj ?loc))
		(in-copy ?obj ?truck)))

(:action load-airplane-stop-0
	:parameters (?obj - object
		?airplane - object
		?loc - object)
	:precondition (and
		(not (package-copy ?obj))
		(load-airplane-lock ?obj ?airplane ?loc))
	:effect (and
		(invalid )))

(:action load-airplane-stop-1
	:parameters (?obj - object
		?airplane - object
		?loc - object)
	:precondition (and
		(not (airplane-copy ?airplane))
		(load-airplane-lock ?obj ?airplane ?loc))
	:effect (and
		(invalid )))

(:action load-airplane-stop-2
	:parameters (?obj - object
		?airplane - object
		?loc - object)
	:precondition (and
		(not (location-copy ?loc))
		(load-airplane-lock ?obj ?airplane ?loc))
	:effect (and
		(invalid )))

(:action load-airplane-stop-3
	:parameters (?obj - object
		?airplane - object
		?loc - object)
	:precondition (and
		(not (at-copy ?obj ?loc))
		(load-airplane-lock ?obj ?airplane ?loc))
	:effect (and
		(invalid )))

(:action load-airplane-copy
	:parameters (?obj - object
		?airplane - object
		?loc - object)
	:precondition (and
		(load-airplane-lock ?obj ?airplane ?loc)
		(package-copy ?obj)
		(airplane-copy ?airplane)
		(location-copy ?loc)
		(at-copy ?obj ?loc))
	:effect (and
		(not (load-airplane-lock ?obj ?airplane ?loc))
		(unlock-origin-domain )
		(not (at-copy ?obj ?loc))
		(in-copy ?obj ?airplane)
		(not (airport-copy ?obj))))

(:action unload-truck-stop-0
	:parameters (?obj - object
		?truck - object
		?loc - object)
	:precondition (and
		(not (package-copy ?obj))
		(unload-truck-lock ?obj ?truck ?loc))
	:effect (and
		(invalid )))

(:action unload-truck-stop-1
	:parameters (?obj - object
		?truck - object
		?loc - object)
	:precondition (and
		(not (truck-copy ?truck))
		(unload-truck-lock ?obj ?truck ?loc))
	:effect (and
		(invalid )))

(:action unload-truck-stop-2
	:parameters (?obj - object
		?truck - object
		?loc - object)
	:precondition (and
		(not (location-copy ?loc))
		(unload-truck-lock ?obj ?truck ?loc))
	:effect (and
		(invalid )))

(:action unload-truck-stop-3
	:parameters (?obj - object
		?truck - object
		?loc - object)
	:precondition (and
		(not (at-copy ?truck ?loc))
		(unload-truck-lock ?obj ?truck ?loc))
	:effect (and
		(invalid )))

(:action unload-truck-stop-4
	:parameters (?obj - object
		?truck - object
		?loc - object)
	:precondition (and
		(not (in-copy ?obj ?truck))
		(unload-truck-lock ?obj ?truck ?loc))
	:effect (and
		(invalid )))

(:action unload-truck-stop-5
	:parameters (?obj - object
		?truck - object
		?loc - object)
	:precondition (and
		(not (in-city-copy ?truck ?loc))
		(unload-truck-lock ?obj ?truck ?loc))
	:effect (and
		(invalid )))

(:action unload-truck-copy
	:parameters (?obj - object
		?truck - object
		?loc - object)
	:precondition (and
		(unload-truck-lock ?obj ?truck ?loc)
		(package-copy ?obj)
		(truck-copy ?truck)
		(location-copy ?loc)
		(at-copy ?truck ?loc)
		(in-copy ?obj ?truck)
		(in-city-copy ?truck ?loc))
	:effect (and
		(not (unload-truck-lock ?obj ?truck ?loc))
		(unlock-origin-domain )
		(not (in-copy ?obj ?truck))
		(at-copy ?obj ?loc)
		(city-copy ?truck)))

(:action unload-airplane-stop-0
	:parameters (?obj - object
		?airplane - object
		?loc - object)
	:precondition (and
		(not (package-copy ?obj))
		(unload-airplane-lock ?obj ?airplane ?loc))
	:effect (and
		(invalid )))

(:action unload-airplane-stop-1
	:parameters (?obj - object
		?airplane - object
		?loc - object)
	:precondition (and
		(not (airplane-copy ?airplane))
		(unload-airplane-lock ?obj ?airplane ?loc))
	:effect (and
		(invalid )))

(:action unload-airplane-stop-2
	:parameters (?obj - object
		?airplane - object
		?loc - object)
	:precondition (and
		(not (location-copy ?loc))
		(unload-airplane-lock ?obj ?airplane ?loc))
	:effect (and
		(invalid )))

(:action unload-airplane-stop-3
	:parameters (?obj - object
		?airplane - object
		?loc - object)
	:precondition (and
		(not (in-copy ?obj ?airplane))
		(unload-airplane-lock ?obj ?airplane ?loc))
	:effect (and
		(invalid )))

(:action unload-airplane-stop-4
	:parameters (?obj - object
		?airplane - object
		?loc - object)
	:precondition (and
		(not (at-copy ?airplane ?loc))
		(unload-airplane-lock ?obj ?airplane ?loc))
	:effect (and
		(invalid )))

(:action unload-airplane-copy
	:parameters (?obj - object
		?airplane - object
		?loc - object)
	:precondition (and
		(unload-airplane-lock ?obj ?airplane ?loc)
		(package-copy ?obj)
		(airplane-copy ?airplane)
		(location-copy ?loc)
		(in-copy ?obj ?airplane)
		(at-copy ?airplane ?loc))
	:effect (and
		(not (unload-airplane-lock ?obj ?airplane ?loc))
		(unlock-origin-domain )
		(not (in-copy ?obj ?airplane))
		(at-copy ?obj ?loc)))

(:action drive-truck-stop-0
	:parameters (?truck - object
		?loc-from - object
		?loc-to - object
		?city - object)
	:precondition (and
		(not (truck-copy ?truck))
		(drive-truck-lock ?truck ?loc-from ?loc-to ?city))
	:effect (and
		(invalid )))

(:action drive-truck-stop-1
	:parameters (?truck - object
		?loc-from - object
		?loc-to - object
		?city - object)
	:precondition (and
		(not (location-copy ?loc-from))
		(drive-truck-lock ?truck ?loc-from ?loc-to ?city))
	:effect (and
		(invalid )))

(:action drive-truck-stop-2
	:parameters (?truck - object
		?loc-from - object
		?loc-to - object
		?city - object)
	:precondition (and
		(not (location-copy ?loc-to))
		(drive-truck-lock ?truck ?loc-from ?loc-to ?city))
	:effect (and
		(invalid )))

(:action drive-truck-stop-3
	:parameters (?truck - object
		?loc-from - object
		?loc-to - object
		?city - object)
	:precondition (and
		(not (city-copy ?city))
		(drive-truck-lock ?truck ?loc-from ?loc-to ?city))
	:effect (and
		(invalid )))

(:action drive-truck-stop-4
	:parameters (?truck - object
		?loc-from - object
		?loc-to - object
		?city - object)
	:precondition (and
		(not (at-copy ?truck ?loc-from))
		(drive-truck-lock ?truck ?loc-from ?loc-to ?city))
	:effect (and
		(invalid )))

(:action drive-truck-stop-5
	:parameters (?truck - object
		?loc-from - object
		?loc-to - object
		?city - object)
	:precondition (and
		(not (in-city-copy ?loc-from ?city))
		(drive-truck-lock ?truck ?loc-from ?loc-to ?city))
	:effect (and
		(invalid )))

(:action drive-truck-stop-6
	:parameters (?truck - object
		?loc-from - object
		?loc-to - object
		?city - object)
	:precondition (and
		(not (in-city-copy ?loc-to ?city))
		(drive-truck-lock ?truck ?loc-from ?loc-to ?city))
	:effect (and
		(invalid )))

(:action drive-truck-copy
	:parameters (?truck - object
		?loc-from - object
		?loc-to - object
		?city - object)
	:precondition (and
		(drive-truck-lock ?truck ?loc-from ?loc-to ?city)
		(truck-copy ?truck)
		(location-copy ?loc-from)
		(location-copy ?loc-to)
		(city-copy ?city)
		(at-copy ?truck ?loc-from)
		(in-city-copy ?loc-from ?city)
		(in-city-copy ?loc-to ?city))
	:effect (and
		(not (drive-truck-lock ?truck ?loc-from ?loc-to ?city))
		(unlock-origin-domain )
		(not (at-copy ?truck ?loc-from))
		(at-copy ?truck ?loc-to)))

(:action fly-airplane-stop-0
	:parameters (?airplane - object
		?loc-from - object
		?loc-to - object)
	:precondition (and
		(not (airplane-copy ?airplane))
		(fly-airplane-lock ?airplane ?loc-from ?loc-to))
	:effect (and
		(invalid )))

(:action fly-airplane-stop-1
	:parameters (?airplane - object
		?loc-from - object
		?loc-to - object)
	:precondition (and
		(not (airport-copy ?loc-from))
		(fly-airplane-lock ?airplane ?loc-from ?loc-to))
	:effect (and
		(invalid )))

(:action fly-airplane-stop-2
	:parameters (?airplane - object
		?loc-from - object
		?loc-to - object)
	:precondition (and
		(not (airport-copy ?loc-to))
		(fly-airplane-lock ?airplane ?loc-from ?loc-to))
	:effect (and
		(invalid )))

(:action fly-airplane-stop-3
	:parameters (?airplane - object
		?loc-from - object
		?loc-to - object)
	:precondition (and
		(not (at-copy ?airplane ?loc-from))
		(fly-airplane-lock ?airplane ?loc-from ?loc-to))
	:effect (and
		(invalid )))

(:action fly-airplane-copy
	:parameters (?airplane - object
		?loc-from - object
		?loc-to - object)
	:precondition (and
		(fly-airplane-lock ?airplane ?loc-from ?loc-to)
		(airplane-copy ?airplane)
		(airport-copy ?loc-from)
		(airport-copy ?loc-to)
		(at-copy ?airplane ?loc-from))
	:effect (and
		(not (fly-airplane-lock ?airplane ?loc-from ?loc-to))
		(unlock-origin-domain )
		(not (at-copy ?airplane ?loc-from))
		(at-copy ?airplane ?loc-to)))

(:action turning
	:parameters ()
	:precondition (and
		(invalid ))
	:effect (and
		(unlock-origin-domain ))) )