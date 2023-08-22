# frozen_string_literal: true

module TrainActions
  private

  def find_train
    count = 0
    @trains.each do |train|
      puts "#{count} - #{train}"
      count += 1
    end

    @trains[gets.chomp.to_i]
  end

  def create_train
    puts 'Вы хотите создавть грузовой(нажмите 1) или поссажирский(нажмите 2) поезд?'
    type = gets.chomp
    loop do
      break if %w[1 2].include?(type)

      puts 'Пожалуйста, выберайте только 1 или 2'
      type = gets.chomp
    end
    puts 'Какой номер у поезда?'

    begin
      number = gets.chomp
      case type
      when '1'
        puts "Поезд #{@trains << CargoTrain.new(number)} был успешно создан!"
      when '2'
        puts "Поезд #{@trains << PassengerTrain.new(number)} был успешно создан!"
      end
    rescue StandardError => e
      p e
      puts 'Попробуйте еще раз!'
      retry
    end
  end

  def add_train_route
    puts 'Какому поезду хотите добавить маршрут?'
    find_train.assign_route(find_route)
  end

  def move_train
    puts 'Какой поезд вы хотите передвигать?'
    find_train.go_next_station
  end

  def check_trains
    @stations.each do |station|
      station.each_train do |train|
        puts "Станция - #{station.title}"
        puts "Номер поезда - #{train.number}, тип - #{train.type}, кол-во вагонов - #{train.wagons.size}"
      end
    end
  end
end
