class Route 
  attr_reader :first_station, :last_station, :stations
  include InstanceCounter
  include Validator

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
    register_instance
    check_validaty
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  private 

  def check_validaty
    raise "Станция должна быть объектом класса станций (Station)!" unless stations.all? {|station| station.is_a?(Station)}
  end
end
