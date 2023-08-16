require_relative 'lib/instance_counter' 
require_relative 'lib/manufacturer' 
require_relative 'lib/station'  
require_relative 'lib/train'  
require_relative 'lib/route' 
require_relative 'lib/wagon'
require_relative 'lib/cargo_wagon'  
require_relative 'lib/passenger_wagon'  
require_relative 'lib/passenger_train'  
require_relative 'lib/cargo_train'

#Тесты основного функционала
station1 = Station.new('Riga') #создаем станции
station2= Station.new('Liepaja')
station3 = Station.new('Jurmala')

passenger_train1 = PassengerTrain.new("0111") #создаем пассажирские поезда
passenger_train2 = PassengerTrain.new("0112")
passenger_train3 = PassengerTrain.new("0113")

cargo_train1 = CargoTrain.new("0011") #создаем грузовые поезда
cargo_train2 = CargoTrain.new("0012")

train1 = Train.new("0001") #создаем родительский класс поезд(без типа)

route = Route.new(station1, station2) #создаем маршрут используя объекты Station
route.add_station(station3) #добавляем станцию

passenger_train1.assign_route(route) #добавляем маршрут поезду

wagon1 = PassengerWagon.new #создаем вагон
wagon2 = PassengerWagon.new #создаем вагон

passenger_train1.attach_a_wagon(wagon1) #прицепляем вагон к поезду
passenger_train1.attach_a_wagon(wagon2) 
passenger_train1.unhook_the_wagon #отцепляем вагон от поезда

passenger_train1.go_next_station #посылаем поезд на следующую станцию
passenger_train1.go_previous_station #посылаем поезд на предыдущую станцию

#Проверка работы модуля InstanceCounter
puts "Train instances - #{Train.instances}"
puts "Cargo train instances - #{CargoTrain.instances}"
puts "Pssneger train instances - #{PassengerTrain.instances}"
puts "Station instances - #{Station.instances}"
puts "Route instances - #{Route.instances}"

