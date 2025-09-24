(define (problem strips-log-y-2)                       (:domain logistics-strips)                       (:objects city2-2 - object
package3 - object
package2 - object
city1 - object
package1 - object
truck6 - object
package5 - object
truck1 - object
truck3 - object
package4 - object
truck4 - object
city3-2 - object
city3 - object
truck2 - object
city2-1 - object
city1-2 - object
plane1 - object
truck5 - object
city3-1 - object
city2 - object
city1-1 - object)                        (:init (truck-copy truck3)
(unlock-origin-domain )
(at truck1 city2-2)
(in-city city1-2 city1)
(at package3 city1-1)
(location city1-1)
(truck-copy truck6)
(at-copy truck4 city1-1)
(truck-copy truck2)
(location-copy city1-2)
(at package2 city2-2)
(at package1 city2-1)
(obj package3)
(at package5 city2-1)
(at-copy truck1 city2-2)
(at-copy package3 city1-1)
(location city2-2)
(airport-copy city1-2)
(obj package5)
(at truck3 city3-2)
(location-copy city3-1)
(airport city2-2)
(city-copy city2)
(city-copy city1)
(location city3-2)
(at-copy package2 city2-2)
(at truck6 city3-1)
(location-copy city2-1)
(at-copy package1 city2-1)
(city city2)
(in-city-copy city1-1 city1)
(obj-copy package5)
(at-copy package5 city2-1)
(airport city3-2)
(city city1)
(truck-copy truck1)
(city-copy city3)
(truck truck3)
(at truck5 city2-1)
(at-copy truck3 city3-2)
(in-city city1-1 city1)
(city city3)
(truck truck6)
(at package4 city1-2)
(obj package4)
(at-copy truck6 city3-1)
(in-city-copy city2-2 city2)
(at plane1 city3-2)
(location-copy city1-1)
(at truck2 city1-2)
(truck truck2)
(truck-copy truck5)
(truck truck1)
(location city2-1)
(obj-copy package4)
(at-copy truck5 city2-1)
(in-city city2-2 city2)
(location city1-2)
(at-copy package4 city1-2)
(in-city-copy city2-1 city2)
(airport city1-2)
(at-copy plane1 city3-2)
(at-copy truck2 city1-2)
(obj package1)
(in-city-copy city3-1 city3)
(obj package2)
(airplane plane1)
(in-city city2-1 city2)
(location city3-1)
(obj-copy package1)
(location-copy city3-2)
(airport-copy city2-2)
(truck-copy truck4)
(obj-copy package2)
(in-city-copy city3-2 city3)
(in-city city3-1 city3)
(at truck4 city1-1)
(in-city-copy city1-2 city1)
(airport-copy city3-2)
(airplane-copy plane1)
(truck truck5)
(truck truck4)
(location-copy city2-2)
(in-city city3-2 city3)
(obj-copy package3))                        (:goal (and
		(at package5 city3-2)
		(at package4 city2-1)
		(at package3 city2-1)
		(invalid )))                        )