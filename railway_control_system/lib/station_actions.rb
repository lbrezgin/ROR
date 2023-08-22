# frozen_string_literal: true

module StationActions
  private

  def find_station
    puts 'Какую станцию?'
    @stations.each { |station| puts station.title }

    gets.chomp
  end

  def create_station
    puts 'Введите название для станции: '
    begin
      title = gets.chomp
      @stations << Station.new(title)
      puts 'Станция успешно создана!'
    rescue StandardError => e
      p e
      puts 'Попробуйте еще раз!'
      retry
    end
  end

  def station_action
    puts 'Чтобы добавить станцию нажмите 1, чтобы удалить станцию нажмите 2'
    input = gets.chomp

    case input
    when '1'
      find_route.add_station(get_station(find_station)[0])
    when '2'
      find_route.delete_station(get_station(find_station)[0])
    end
  end

  def get_station(input)
    @stations.select { |station| station.title == input }
  end

  def check_stations
    puts "Станции - #{@stations}"
  end
end
