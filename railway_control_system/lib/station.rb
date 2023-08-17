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
    @@all.push(self)
    register_instance
    check_validaty
  end

  def add_train(train)
    @trains.push(train)
  end

  def remove_train(train)
    @trains.delete(train)
  end

  def return_train_by_type(type)
    trains.select { |train| train.type == type}
  end

  private 

  def check_validaty 
    raise "Название станции не может быть пустым!" if title.nil?
    raise "Название станции должно состоять как минимум из 3 символов!" if title.length < 3
  end
end

