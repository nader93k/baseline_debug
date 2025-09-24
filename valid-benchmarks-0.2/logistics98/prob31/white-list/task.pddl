(define (problem strips-log-y-1)                       (:domain logistics-strips)                       (:objects city2-2 - object
package3 - object
package2 - object
city4 - object
city4-1 - object
city1 - object
plane2 - object
package1 - object
city4-2 - object
city5 - object
city3-1 - object
truck1 - object
truck3 - object
truck4 - object
city5-1 - object
city3-2 - object
city3 - object
truck2 - object
city2-1 - object
city1-2 - object
plane1 - object
truck5 - object
city5-2 - object
city2 - object
city1-1 - object)                        (:init (truck-copy truck3)
(at-copy truck3 city3-1)
(unlock-origin-domain )
(in-city city1-2 city1)
(at package3 city1-1)
(location city1-1)
(location city5-1)
(at truck1 city1-1)
(at package1 city4-1)
(location city5-2)
(truck-copy truck2)
(location-copy city1-2)
(airport city5-2)
(obj package3)
(airplane-copy plane2)
(at truck2 city2-1)
(at-copy package3 city1-1)
(location city2-2)
(airport-copy city1-2)
(at-copy truck1 city1-1)
(location-copy city4-2)
(at-copy package1 city4-1)
(location-copy city3-1)
(airport city2-2)
(city-copy city2)
(in-city-copy city4-1 city4)
(at package2 city1-2)
(city-copy city1)
(location city3-2)
(location-copy city2-1)
(city city2)
(in-city-copy city1-1 city1)
(airport-copy city4-2)
(airport city3-2)
(city city1)
(at-copy truck2 city2-1)
(in-city city4-1 city4)
(truck-copy truck1)
(city-copy city3)
(truck truck3)
(at plane1 city2-2)
(location-copy city4-1)
(in-city city1-1 city1)
(city city3)
(at-copy package2 city1-2)
(at plane2 city1-2)
(in-city-copy city2-2 city2)
(location-copy city1-1)
(truck truck2)
(location-copy city5-1)
(truck-copy truck5)
(truck truck1)
(location city2-1)
(location-copy city5-2)
(in-city-copy city5-1 city5)
(at-copy plane1 city2-2)
(in-city city2-2 city2)
(at truck5 city5-1)
(location city1-2)
(in-city-copy city2-1 city2)
(in-city-copy city4-2 city4)
(at-copy plane2 city1-2)
(airport-copy city5-2)
(airport city1-2)
(in-city city5-1 city5)
(obj package1)
(city-copy city4)
(at truck4 city4-1)
(in-city-copy city5-2 city5)
(airplane plane2)
(in-city-copy city3-1 city3)
(obj package2)
(airplane plane1)
(city city4)
(location city4-2)
(in-city city2-1 city2)
(in-city city4-2 city4)
(location city3-1)
(city-copy city5)
(obj-copy package1)
(location-copy city3-2)
(airport-copy city2-2)
(at-copy truck5 city5-1)
(truck-copy truck4)
(at truck3 city3-1)
(airport city4-2)
(obj-copy package2)
(in-city city5-2 city5)
(city city5)
(in-city-copy city3-2 city3)
(in-city city3-1 city3)
(at-copy truck4 city4-1)
(in-city-copy city1-2 city1)
(airport-copy city3-2)
(airplane-copy plane1)
(location city4-1)
(truck truck5)
(truck truck4)
(location-copy city2-2)
(in-city city3-2 city3)
(obj-copy package3))                        (:goal (and
		(at package3 city1-2)
		(at package2 city1-1)
		(at package1 city3-2)
		(invalid )))                        )