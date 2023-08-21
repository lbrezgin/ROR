require_relative 'lib/validator' 
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

  ]

  def initialize
    @trains = []
    @stations = []
    @routes = []
  end

  def start
    loop do
      show_menu
      choice = gets_choice
      break if call_action(choice) == "0"
    end
  end

  private

  def show_menu
    puts "Нажмите 0 чтобы выйти"
    puts "Нажмите 1 чтобы создать станцию"
    puts "Нажмите 2 чтобы создать поезд"
    puts "Нажмите 3 чтобы создать маршрут"
    puts "Нажмите 4 чтобы удалить или добавить станцию" 
    puts "Нажмите 5 чтобы назначить маршрут поезду" 
    puts "Нажмите 6 чтобы добавить или удалить вагон у поезда" 
    puts "Нажмите 7 чтобы перемещать поезд по станциям" 
    puts "Нажмите 8 чтобы просмотреть станции" 
    puts "Нажмите 9 чтобы просмотреть поезда на станциях" 
    puts "Нажмите 10 чтобы создать тестовые данные"
    puts "Нажмите 11 чтобы просмотреть вагоны у поездов"
    puts "Нажмите 12 чтобы занять места или объем в вагоне"
  end

  def gets_choice
    input = gets.chomp
    hash_of_action = ACTIONS.find { |action| action[:id] == input }
    if hash_of_action
      method_name = hash_of_action[:action] 
    else
      puts "Действие не найдено"
    end
  end

  def call_action(choice)
    send(choice) if choice
  end

  def create_train
    puts "Вы хотите создавть грузовой(нажмите 1) или поссажирский(нажмите 2) поезд?"
    type = gets.chomp
    loop do 
      break if type == "1" || type == "2"
      puts "Пожалуйста, выберайте только 1 или 2"
      type = gets.chomp
    end
    puts "Какой номер у поезда?"

    begin
      number = gets.chomp
      case type 
      when "1"
        puts "Поезд #{@trains << CargoTrain.new(number)} был успешно создан!"
      when "2"
        puts "Поезд #{@trains << PassengerTrain.new(number)} был успешно создан!"
      end
    rescue => exception
      p exception
      puts "Попробуйте еще раз!"
      retry
    end
  end

  def create_station
    puts "Введите название для станции: "
    begin
      title = gets.chomp
      @stations << Station.new(title)
      puts "Станция успешно создана!"
    rescue => exception
      p exception
      puts "Попробуйте еще раз!"
      retry
    end
  end

  def create_route 
    if @stations.size < 2 
      puts "Недостаточно станций!"
    else
      begin
        @stations.each { |station| puts station.title }

        puts "Выберите начальную станцию: "
        input = gets.chomp
        start_station = @stations.select { |station| station.title == input }

        puts "Выберите конечную станцию: "
        input = gets.chomp
        end_station = @stations.select { |station| station.title == input }

        @routes << Route.new(start_station[0], end_station[0])
        puts "Маршрут успешно создан!"
      rescue => exception
        p exception
        puts "Попробуйте еще раз!"
        retry
      end
    end
  end

  def find_route 
    puts "В какой маршрут?"

    count = 0
    @routes.each do |route| 
      p "#{count} - #{route}" 
      count += 1
    end
    
    @routes[gets.chomp.to_i] 
  end
  
  def find_station 
    puts "Какую станцию?"
    @stations.each { |station| puts station.title }

    gets.chomp
  end

  def find_train
    count = 0
      @trains.each do |train| 
        puts "#{count} - #{train}"
        count += 1
      end

    @trains[gets.chomp.to_i]
  end

  def station_action
    puts "Чтобы добавить станцию нажмите 1, чтобы удалить станцию нажмите 2"
    input = gets.chomp
  
    case input 
    when "1"  
      find_route.add_station(get_station(find_station)[0])
    when "2"  
      find_route.delete_station(get_station(find_station)[0])
    end
  end

  def get_station(input)
    @stations.select { |station| station.title == input }
  end

  def add_train_route 
    puts "Какому поезду хотите добавить маршрут?"
    find_train.assign_route(find_route)
  end
  
  def wagon_actions
    puts "К какомоу поезду хотите добавить или отцепить вагоны??"
    train_f = find_train 

    puts "Оцепить(1) или прицепить(2)?"
    action = gets.chomp
    case action
    when "1"
      if train_f.wagons.size < 1
        puts "У поезда нет прицепленных вагонов!" 
      else
        train_f.unhook_the_wagon
        puts "Вагон успешно отцеплен!"
      end
    when "2"
      wagon = create_wagon(train_f)
      train_f.attach_a_wagon(wagon)
      puts "Вагон успешно добавлен!"
    end
  end

  def create_wagon(train) 
    puts "На сколько расчитан вагон?"
    begin
      input = gets.chomp.to_i
      validate!(input)
      if train.type == :passenger 
        PassengerWagon.new(input)
      elsif train.type == :cargo
        CargoWagon.new(input)
      end
    rescue => e
      p "#{e}"
      puts "Попробуйте еще раз!"
      retry
    end
  end

  def move_train
    puts "Какой поезд вы хотите передвигать?"
    find_train.go_next_station
  end

  def check_stations
    puts "Станции - #{@stations}"
  end

  def check_trains
    @stations.each do |station|
      station.each_train do |train|
      puts "Станция - #{station.title}"
      puts "Номер поезда - #{train.number}, тип - #{train.type}, кол-во вагонов - #{train.wagons.size}"
      end
    end
  end

  def check_wagons
    number = 0
    @trains.each do |train|
      train.each_wagon do |wagon|
        puts "Номер вагона - #{number}, тип - #{wagon.type}, свободно - #{wagon.free}"
        number += 1
      end
    end
  end

  def take_in_wagon
    puts "В каком поезде вы хотите занять место в вагоне?"
    train = find_train
    puts "Какой вагон?"
    number = 0
    train.each_wagon do |wagon|
      puts "#{number} - #{wagon}"
      number += 1
    end
    choice = gets.chomp.to_i
    wagon = train.wagons[choice]
    if wagon.type == :cargo 
      puts "В данном вагоне свободно #{wagon.free} от общего объема в #{wagon.volume}"
      puts "Сколько объема вы хотите занять?"
      volume = gets.chomp.to_i
      if wagon.free >= volume
        wagon.fill_wagon(volume)
        puts "Вы успешно заняли вагон на #{wagon.taken}!"
      else
        puts "Вы не можете занять больше объема чем столько, насколько расчитан вагон!"
      end
      puts "Вагон уже полностью загружен!" if wagon.free == 0
    elsif wagon.type == :passenger 
      puts "В данном вагоне свободно #{wagon.free} мест"
      puts "Выберите место!"
      wagon.all_places.each do |place, status|
        puts "#Место №#{place} - #{status}"
      end
      place = gets.chomp.to_i
      if wagon.all_places[place] == :free
        wagon.take_place(place)
        puts "Вы успешно заняли место №#{place}, в вагоне осталось #{wagon.free} свободных мест!"
      elsif wagon.all_places[place] == :taken
        puts "Это место уже занято!"
      else
        puts "Такого места нет в вагоне!"
      end
    end
  end

  def exit 
    "0"
  end

  def create_test_data
    #Создаем грузовой поезд и добавляем ему вагоны
    c_train1 = CargoTrain.new("test1")
    @trains.push(c_train1)
    c_wagon1 = CargoWagon.new(100)
    c_wagon2 = CargoWagon.new(200)
    c_train1.attach_a_wagon(c_wagon1)
    c_train1.attach_a_wagon(c_wagon2)
    
    #создаем пассажирский поезд и добавляем ему вагоны
    p_train1 = PassengerTrain.new("test2")
    @trains.push(p_train1)
    p_wagon1 = PassengerWagon.new(10)
    p_wagon2 = PassengerWagon.new(20)
    p_train1.attach_a_wagon(p_wagon1)
    p_train1.attach_a_wagon(p_wagon2)

    liepaja = Station.new("Liepaja")
    riga = Station.new("Riga")
    @stations.push(liepaja)
    @stations.push(riga)
    liepaja.add_train(p_train1)
    riga.add_train(c_train1)
    puts "Тестовые данные были успешно созданы!"
  end 

  def validate!(param)
    raise "Неверное значение!" if param == 0
  end
end

Main.new.start

