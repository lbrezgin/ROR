# frozen_string_literal: true

class Train
  extend Accessors
  include Manufacturer
  include InstanceCounter
  include Validation

  NUMBER_FORMAT = /^[a-zA-Z\d]{3}-?[a-zA-Z\d]{2}$/.freeze
  
  attr_reader :route, :current_station_index, :wagons, :speed, :number, :type
  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  @@all = []

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
    validate!
    @@all.push(self)
    register_instance
  end

  def self.find(num)
    @@all.select { |train| train.number == num ? train : nil }
  end

  def self.all
    @@all
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

    current_station&.remove_train(self)
    @current_station_index += 1
    current_station.add_train(self)
  end

  def go_previous_station
    return unless previous_station

    current_station&.remove_train(self)
    @current_station_index -= 1
    current_station.add_train(self)
  end

  def pick_up_speed(value)
    self.speed += value
  end

  def stop
    self.speed = 0
  end

  def unhook_the_wagon
    wagons.pop
  end

  def attach_a_wagon(wagon)
    wagons << wagon if wagon.type == type
  end

  def each_wagon(&block)
    wagons.each(&block)
  end

  protected

  attr_writer :wagons, :speed
end
