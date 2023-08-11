# Класс Station (Станция):
# Имеет название, которое указывается при ее создании 
# Может принимать поезда (по одному за раз) 
# Может возвращать список всех поездов на станции, находящиеся в текущий момент 
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции). 

class Station 
  
  attr_reader :title
  attr_accessor :trains_on_station

  def initialize(title)
    @title = title
    @trains_on_station = []
  end

  def add_train(train)
    @trains_on_station.push(train)
  end

  def remove_train(train)
    @trains_on_station.delete(train)
  end

  def return_train_by_type(vid)
    count = 0
    train_type = []

    @trains_on_station.each do |train_object|
      if train_object.type == vid  
        train_type << train_object
        count += 1
      end
    end

    return train_type
    puts "Поездов такого типа в данный момент на станции - #{count}"
  end
end

