class Station 
  
  attr_reader :title
  attr_accessor :trains

  def initialize(title)
    @title = title
    @trains = []
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
