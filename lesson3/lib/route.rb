# Класс Route (Маршрут):
# Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной

class Route 
  
  attr_reader :first, :last, :stations

  def initialize(first, last)
    @stations = [first, last]
  end

  def add_station(station)
    self.stations.insert(-2, station)
  end

  def delete_station(station)
    self.stations.delete(station)
  end

  def station_list
    @stations.each { |station| puts station.title }
  end
end
