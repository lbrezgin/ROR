# frozen_string_literal: true

module WagonActions
  def wagon_actions
    puts 'К какомоу поезду хотите добавить или отцепить вагоны??'
    train_f = find_train

    puts 'Оцепить(1) или прицепить(2)?'
    action = gets.chomp
    case action
    when '1'
      if train_f.wagons.empty?
        puts 'У поезда нет прицепленных вагонов!'
      else
        train_f.unhook_the_wagon
        puts 'Вагон успешно отцеплен!'
      end
    when '2'
      wagon = create_wagon(train_f)
      train_f.attach_a_wagon(wagon)
      puts 'Вагон успешно добавлен!'
    end
  end

  def create_wagon(train)
    puts 'На сколько расчитан вагон?'
    begin
      input = gets.chomp.to_i
      validate!(input)
      if train.type == :passenger
        PassengerWagon.new(input)
      elsif train.type == :cargo
        CargoWagon.new(input)
      end
    rescue StandardError => e
      p e.to_s
      puts 'Попробуйте еще раз!'
      retry
    end
  end

  def check_wagons
    number = 0
    @trains.each do |train|
      train.each_wagon do |wagon|
        puts "Номер вагона - #{number}, тип - #{wagon.type}, свободно места- #{wagon.free_place}"
        number += 1
      end
    end
  end

  def take_in_wagon
    puts 'В каком поезде вы хотите занять место в вагоне?'
    train = find_train
    puts 'Какой вагон?'
    number = 0
    train.each_wagon do |wagon|
      puts "#{number} - #{wagon}"
      number += 1
    end
    choice = gets.chomp.to_i
    wagon = train.wagons[choice]
    if wagon.type == :cargo
      puts "В данном вагоне свободно #{wagon.free_place} от общего объема в #{wagon.total_place}"
      puts 'Сколько объема вы хотите занять?'
      volume = gets.chomp.to_i
      if wagon.free_place >= volume
        wagon.take_place(volume)
        puts "Вы успешно заняли вагон на #{volume}!"
        puts "Загруженность вагона составляет #{wagon.used_place} из #{wagon.total_place}!"
      else
        puts 'Вы не можете занять больше объема чем столько, насколько расчитан вагон!'
      end
      puts 'Вагон уже полностью загружен!' if wagon.free_place.zero?
    elsif wagon.type == :passenger
      puts "В данном вагоне свободно #{wagon.free_place} мест"
      wagon.take_place
      puts "Вы успешно заняли место, в вагоне осталось #{wagon.free_place} свободных мест!"
    end
  end
end
