# frozen_string_literal: true
require_relative 'lib/accessors'
require_relative 'lib/validation'
require_relative 'lib/wagon_actions'
require_relative 'lib/train_actions'
require_relative 'lib/route_actions'
require_relative 'lib/station_actions'
require_relative 'lib/instance_counter'
require_relative 'lib/manufacturer'
require_relative 'lib/station'
require_relative 'lib/train'
require_relative 'lib/route'
require_relative 'lib/wagon'
require_relative 'lib/cargo_wagon'
require_relative 'lib/passenger_wagon'
require_relative 'lib/passenger_train'
require_relative 'lib/cargo_train'

class Main
  include StationActions
  include RouteActions
  include TrainActions
  include WagonActions

  ACTIONS = [
    { id: '0', title: 'Выйти', action: :exit },
    { id: '1', title: 'Создать станцию', action: :create_station },
    { id: '2', title: 'Создать поезд', action: :create_train },
    { id: '3', title: 'Создать маршрут', action: :create_route },
    { id: '4', title: 'Действия со станциями', action: :station_action },
    { id: '5', title: 'Назначить маршрут поезду', action: :add_train_route },
    { id: '6', title: 'Добавить или удалить вагон у поезда', action: :wagon_actions },
    { id: '7', title: 'Перемещать поезд по станциям', action: :move_train },
    { id: '8', title: 'Просмотреть станции', action: :check_stations },
    { id: '9', title: 'Просмотреть поезда на станциях', action: :check_trains },
    { id: '10', title: 'Создать тестовые данные', action: :create_test_data },
    { id: '11', title: 'Просмотреть вагоны у поездов', action: :check_wagons },
    { id: '12', title: 'Занять места или объем в вагоне', action: :take_in_wagon }

  ].freeze

  def initialize
    @trains = []
    @stations = []
    @routes = []
  end

  def start
    loop do
      show_menu
      choice = gets_choice
      break if call_action(choice) == '0'
    end
  end

  private

  def show_menu
    puts 'Нажмите 0 чтобы выйти'
    puts 'Нажмите 1 чтобы создать станцию'
    puts 'Нажмите 2 чтобы создать поезд'
    puts 'Нажмите 3 чтобы создать маршрут'
    puts 'Нажмите 4 чтобы удалить или добавить станцию'
    puts 'Нажмите 5 чтобы назначить маршрут поезду'
    puts 'Нажмите 6 чтобы добавить или удалить вагон у поезда'
    puts 'Нажмите 7 чтобы перемещать поезд по станциям'
    puts 'Нажмите 8 чтобы просмотреть станции'
    puts 'Нажмите 9 чтобы просмотреть поезда на станциях'
    puts 'Нажмите 10 чтобы создать тестовые данные'
    puts 'Нажмите 11 чтобы просмотреть вагоны у поездов'
    puts 'Нажмите 12 чтобы занять места или объем в вагоне'
  end

  def gets_choice
    input = gets.chomp
    hash_of_action = ACTIONS.find { |action| action[:id] == input }
    if hash_of_action
      hash_of_action[:action]
    else
      puts 'Действие не найдено'
    end
  end

  def call_action(choice)
    send(choice) if choice
  end

  def exit
    '0'
  end

  def create_test_data
    c_train1 = CargoTrain.new('test1')
    @trains.push(c_train1)
    c_wagon1 = CargoWagon.new(100)
    c_wagon2 = CargoWagon.new(200)
    c_train1.attach_a_wagon(c_wagon1)
    c_train1.attach_a_wagon(c_wagon2)

    p_train1 = PassengerTrain.new('test2')
    @trains.push(p_train1)
    p_wagon1 = PassengerWagon.new(10)
    p_wagon2 = PassengerWagon.new(20)
    p_train1.attach_a_wagon(p_wagon1)
    p_train1.attach_a_wagon(p_wagon2)

    liepaja = Station.new('Liepaja')
    riga = Station.new('Riga')
    @stations.push(liepaja)
    @stations.push(riga)
    liepaja.add_train(p_train1)
    riga.add_train(c_train1)
    puts 'Тестовые данные были успешно созданы!'
  end

  def validate!(param)
    raise 'Неверное значение!' if param.zero?
  end
end

Main.new.start
