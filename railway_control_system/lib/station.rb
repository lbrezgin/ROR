# frozen_string_literal: true

class Station
  include InstanceCounter
  include Validator

  attr_reader :title
  attr_accessor :trains

  @@all = []

  def self.all
    @@all
  end

  def initialize(title)
    @title = title
    @trains = []
    validate!
    @@all.push(self)
    register_instance
  end

  def add_train(train)
    @trains.push(train)
  end

  def remove_train(train)
    @trains.delete(train)
  end

  def return_train_by_type(type)
    trains.select { |train| train.type == type }
  end

  def each_train(&block)
    trains.each(&block)
  end

  private

  def validate!
    errors = []
    errors << 'Название станции не может быть пустым!' if title.nil?
    errors << 'Название станции должно состоять как минимум из 3 символов!' if title.length < 3
    raise(errors.each { |error| puts error }) unless errors.empty?
  end
end
