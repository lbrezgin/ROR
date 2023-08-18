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
    { id: '0', title: 'Создать станцию', action: :create_station },
    { id: '1', title: 'Создать поезд', action: :create_train },
    { id: '2', title: 'Создать маршрут', action: :create_route },
    { id: '3', title: 'Действия со станциями', action: :station_action },
    { id: '4', title: 'Назначить маршрут поезду', action: :add_train_route },
    { id: '5', title: 'Добавить или удалить вагон у поезда', action: :wagon_actions },
    { id: '6', title: 'Перемещать поезд по станциям', action: :move_train },
    { id: '7', title: 'Просмотреть станции', action: :check_stations },
    { id: '8', title: 'Просмотреть поезда', action: :check_trains },
    { id: '9', title: 'Выйти', action: :exit }
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
      break if call_action(choice) == "9"
    end
  end

  private

  def show_menu
    puts "Нажмите 0 чтобы создать станцию"
    puts "Нажмите 1 чтобы создать поезд"
    puts "Нажмите 2 чтобы создать маршрут"
    puts "Нажмите 3 чтобы удалить или добавить станцию" 
    puts "Нажмите 4 чтобы назначить маршрут поезду" 
    puts "Нажмите 5 чтобы добавить или удалить вагон у поезда" 
    puts "Нажмите 6 чтобы перемещать поезд по станциям" 
    puts "Нажмите 7 чтобы просмотреть станции" 
    puts "Нажмите 8 чтобы просмотреть поезда" 
    puts "Нажмите 9 чтобы выйти"
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
      train_f.unhook_the_wagon
    when "2"
      wagon = create_wagon(train_f)
      train_f.attach_a_wagon(wagon)
    end
  end

  def create_wagon(train)
    if train.type == :passenger 
      PassengerWagon.new 
    elsif train.type == :cargo
      CargoWagon.new
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
    puts "Ваши поезд: "
    cargo = @trains.select { |train| train.type == :cargo }
    puts "Грузовые: #{cargo}"

    passenger = @trains.select { |train| train.type == :passenger }
    puts "Пассажирские: #{passenger}"
  end

  def exit 
    "9"
  end
end

Main.new.start

