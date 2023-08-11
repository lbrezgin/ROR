# Класс Train (Поезд):
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
# Может набирать скорость
# Может возвращать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может возвращать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# Может принимать маршрут следования (объект класса Route). 
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута

class Train 

  attr_reader :speed, :wagons, :type
  attr_accessor :position_index

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
    @position_index = 0
  end

  def pick_up_speed(value)
    @speed += value
  end

  def stop
    @speed = 0
  end

  def unhook_the_wagon
    @wagons -= 1 if @speed == 0
  end

  def attach_a_wagon
    @wagons += 1 if @speed == 0
  end

  def add_route(route)
    route.stations.each {|station| station.trains_on_station.delete(self)}
    route.stations[@position_index].add_train(self)
  end

  def move_to_station(route, direction)
    route.stations[@position_index].remove_train(self)
    if direction == "next"
      route.stations[@position_index+=1].add_train(self)
    elsif direction == "back"
      route.stations[@position_index-=1].add_train(self)
    end
  end

  def current_station(route)
    route.stations[@position_index]
  end

  def next_station(route) 
    route.stations[@position_index+1]
  end

  def previous_station(route)
    route.stations[@position_index-1]
  end
end
