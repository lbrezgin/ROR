require_relative 'lib/validator' 
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
# station1 = Station.new('Riga') #создаем станции
# station2= Station.new('Liepaja')
# station3 = Station.new('Jurmala')

# passenger_train1 = PassengerTrain.new("ABC-12") #создаем пассажирские поезда
# passenger_train2 = PassengerTrain.new("asd-11")
# passenger_train3 = PassengerTrain.new("12345")

# cargo_train1 = CargoTrain.new("asder") #создаем грузовые поезда
# cargo_train2 = CargoTrain.new("poi-22")

# train1 = Train.new("lasho") #создаем родительский класс поезд(без типа)

# route = Route.new(station1, station2) #создаем маршрут используя объекты Station
# route.add_station(station3) #добавляем станцию

# passenger_train1.assign_route(route) #добавляем маршрут поезду

# wagon1 = PassengerWagon.new #создаем вагон
# wagon2 = PassengerWagon.new #создаем вагон

# passenger_train1.attach_a_wagon(wagon1) #прицепляем вагон к поезду
# passenger_train1.attach_a_wagon(wagon2) 
# passenger_train1.unhook_the_wagon #отцепляем вагон от поезда

# passenger_train1.go_next_station #посылаем поезд на следующую станцию
# passenger_train1.go_previous_station #посылаем поезд на предыдущую станцию

#Проверка работы модуля InstanceCounter
# puts "Train instances - #{Train.instances}"
# puts "Cargo train instances - #{CargoTrain.instances}"
# puts "Pssneger train instances - #{PassengerTrain.instances}"
# puts "Station instances - #{Station.instances}"
# puts "Route instances - #{Route.instances}"

#Тесты нового функционала валидаций
# begin
#   station = Station.new("aa")
# rescue => exception
#   p exception
# end

# begin
#   route = Route.new("liepaja", "Riga")
# rescue => exception
#   p exception
# end

# begin
#   train = Train.new("111")
# rescue => exception
#   p exception
# end

# station1 = Station.new("Moscow")
# station2 = Station.new("Riga")

# route = Route.new(station1, station2)

# train = Train.new("12345")
# cargo_train = CargoTrain.new("ABC-12")
# passenger_train = PassengerTrain.new("NEW45")

# p station1.valid?
# p route.valid?
# p train.valid?
# p cargo_train.valid?
# p passenger_train.valid?

#Тесты нового функционала 21.08.2023
passenger_wagon = PassengerWagon.new(20) #Создаем новый пассажирский вагон на 20 мест
passenger_wagon.take_place(10) #Занимаем место №10
puts passenger_wagon.free #смотрим количество свободных мест
puts passenger_wagon.taken #смотрим количество занятых мест

cargo_wagon = CargoWagon.new(100) #создаем новый грузовой вагон с вместимостью в 100
cargo_wagon.fill_wagon(20) #заполняем вагон на 20 
puts "В вагоне занято #{cargo_wagon.taken_volume} от общего объема в #{cargo_wagon.volume}" #смотрим сколько в вагоне занято места
puts "В грузовом вагоне свободно #{cargo_wagon.free_volume}" #смотрим сколько в вагоне свободно места
 
train1 = CargoTrain.new("ABC-12") #создаем поезда
train2 = PassengerTrain.new("12345")
train3 = CargoTrain.new("aaabb")

station = Station.new('Liepaja') #cоздаем станцию
station.add_train(train1) #добавляем поезда в станции
station.add_train(train2)
station.add_train(train3)

station.each_train do |train| #передаем станции через блок методу из класса Station и смотрим тип и номер каждого поезда
  puts "#{train.number} - #{train.type}"
end

passenger_train = PassengerTrain.new("ABS-14") #создаем пассажриский поезд
p_wagon1 = PassengerWagon.new(20) #создаем три вагона
p_wagon2 = PassengerWagon.new(10)
p_wagon3 = PassengerWagon.new(15)

passenger_train.attach_a_wagon(p_wagon1) #прицепляем вагоны
passenger_train.attach_a_wagon(p_wagon2)
passenger_train.attach_a_wagon(p_wagon3)

cargo_train = CargoTrain.new("HAL89") #создаем грузовой поезд
c_wagon1 = CargoWagon.new(100) #создаем три грузовых вагона
c_wagon2 = CargoWagon.new(200)
c_wagon3 = CargoWagon.new(300)

cargo_train.attach_a_wagon(c_wagon1) #прицепляем вагоны
cargo_train.attach_a_wagon(c_wagon2) 
cargo_train.attach_a_wagon(c_wagon3)

passenger_train.each_wagon do |wagon| #тестируем метод по передачи каждого вагона через блок на пассажирском поезде
  puts "В вагоне #{wagon.free} свободных мест"
end

c_wagon1.fill_wagon(10) #чтобы было показательнее, заполняем грузовые вагоны
c_wagon2.fill_wagon(20)
c_wagon3.fill_wagon(40)

cargo_train.each_wagon do |wagon| #тестируем метод на грузовом поезде
  puts "В вагоне с объемом в #{wagon.volume}, #{wagon.free} свободного места и #{wagon.taken} занято"
end

#Остальные пункты тз можно протестировать через интерефейс, предварительно создав тестовые данные, для этого нажмите 10
