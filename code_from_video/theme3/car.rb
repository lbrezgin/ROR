module FuelTank
  def fill_tank(level)
    self.fuel_tank = level
  end
   
  def fuel_level 
    self.fuel_tank
  end

  protected #потому что мы микусем этот модуль с классом Car, а класс Car в свою очередь имеет подклассы. Если бы класс Car не имел подклассов, то можно было бы использовать private
  attr_accessor :fuel_tank
end

module Debugger #тоже самое что написать Debugger = Module.new do ... end
  def self.included(base) #self обозначает что метод не включается в класс в который мы добавляем модуль, а является непосредственно методом модуля
    base.extend ClassMethdos
    base.send :include, InstanceMethods
  end

  module ClassMethdos
    def debug(log)
      puts "DEBUG #{log} !!!"
    end
  end

  module InstanceMethods
    def debug(log)
      self.class.debug(log)
    end

    def print_class 
      puts self.class # self работает у объекта который мы вызываем, если это класс Car, то self = Car, если MotorBike, то self = MotorBike
    end
  end
end

class Car #same as Car = Class.new do ... end
  include FuelTank
  include Debugger

  attr_reader :current_rpm
  attr_accessor :number

  NUMBER_FORMAT = /^[а-я]{1}\d{3}[а-я]{2}$/i

  @@instances = 0

  def self.instances
    @@instances
  end

  # debug 'Start interface'

  def initialize(number)
    @current_rpm = 0
    @@instances += 1
    # debug 'initialize'
    @number = number
    validate!
  end

  def start_engine 
    start_engine! if engine_stopped?
  end 

  def engine_stopped?
    current_rpm.zero?
  end 

  def valid?
    validate!
    true
  rescue 
    false
  end

  # debug 'End interface'

  protected

  def validate! 
    raise "Number can't be nill" if number.nil?
    raise "Number shoul be at least 6 symbols" if number.length < 6
    raise "Number has invalid format" if number !~ NUMBER_FORMAT
  end

  attr_writer :current_rpm

  def initial_rpm 
    700
  end

  def start_engine!
    self.current_rpm = initial_rpm 
  end
end

class MotorBike 
  include FuelTank
  include Debugger
  # debug 'MotorBike class'
end

