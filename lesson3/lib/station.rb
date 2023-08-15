class Station 
  include InstanceCounter

  attr_reader :title
  attr_accessor :trains

  @@all_stations = []
  
  def self.all 
    @@all_stations
  end

  def initialize(title)
    @title = title
    @trains = []
    @@all_stations.push(self)
    register_instance
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
end

