class Train
  attr_reader :route, :current_station_index, :type, :wagons, :speed

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
    @speed = 0
  end

  def assign_route(route)
    @route = route
    @current_station_index = 0
    current_station.add_train(self)
  end

  def current_station
    route.stations[current_station_index]
  end
  
  def next_station
    route.stations[current_station_index + 1]
  end
  
  def previous_station
    route.stations[current_station_index - 1]
  end

  def go_next_station
    return unless next_station 
    current_station.remove_train(self) #добавил, чтобы поезд при перемещении удалялся с предыдущей станции
    @current_station_index += 1
    current_station.add_train(self)
  end
  
  def go_previous_station
    return unless previous_station
    current_station.remove_train(self) #добавил, чтобы поезд при перемещении удалялся с предыдущей станции
    @current_station_index -= 1
    current_station.add_train(self)
  end

  def pick_up_speed(value)
    self.speed += value
  end

  def stop
    self.speed = 0
  end

  def unhook_the_wagon(wagon)
    self.wagons.delete(wagon)
  end

  protected 

  attr_writer :wagons, :speed #protected а не private, чтобы были доступны в подклассах (по соглашению), а protected потому, что изменить вагоны и скорость могут только соответсвущие методы (unhook_the_wagon, stop и т.д.)
end
