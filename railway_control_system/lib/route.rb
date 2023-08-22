# frozen_string_literal: true

class Route
  attr_reader :first_station, :last_station, :stations

  include InstanceCounter
  include Validator

  @@all = []

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
    validate!
    @@all.push(self) # этого не надо было добавлять, но я добавил чтобы проверить не создаются ли невалидные объекты
    register_instance
  end

  def self.all
    @@all
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  private

  def validate!
    raise 'Станция должна быть объектом класса станций (Station)!' unless stations.all? do |station|
                                                                            station.is_a?(Station)
                                                                          end
  end
end
