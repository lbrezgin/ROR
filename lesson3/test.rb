require_relative 'lib/station'  
require_relative 'lib/train'  
require_relative 'lib/route'  
require_relative 'lib/cargo_wagon'  
require_relative 'lib/passenger_wagon'  
require_relative 'lib/passenger_train'  
require_relative 'lib/cargo_train'

station1 = Station.new('Riga')
station2= Station.new('Liepaja')
station3 = Station.new('Jurmala')

passenger_train = PassengerTrain.new("1234")

route = Route.new(station1, station2)
route.add_station(station3)

passenger_train.assign_route(route)

wagon1 = PassengerWagon.new
wagon2 = PassengerWagon.new

passenger_train.attach_a_wagon(wagon1)
passenger_train.attach_a_wagon(wagon2)
passenger_train.unhook_the_wagon

passenger_train.go_next_station
passenger_train.go_previous_station

p route.stations
station1.trains
