require_relative 'lib/station'  
require_relative 'lib/train'  
require_relative 'lib/route'  

train1 = Train.new(111, "passenger", 23) #создаем поезд
station1 = Station.new("Liepaja") #инициализируем станции
station2 = Station.new("Riga")
station3 = Station.new("Bauska")
route = Route.new(station1, station2) #создаем маршрут используя station1 как начальную станцию, а station2 как конечную станцию
route.add_station(station3) #добавляем промежуточную станцию

train1.assign_route(route) #Добавляем поезду маршрут, и он автоматически становится на первую станцию 
