# frozen_string_literal: true

module RouteActions
  private

  def find_route
    puts 'В какой маршрут?'

    count = 0
    @routes.each do |route|
      p "#{count} - #{route}"
      count += 1
    end

    @routes[gets.chomp.to_i]
  end

  def new_route
    @stations.each { |station| puts station.title }

    puts 'Выберите начальную станцию: '
    input = gets.chomp
    start_station = @stations.select { |station| station.title == input }

    puts 'Выберите конечную станцию: '
    input = gets.chomp
    end_station = @stations.select { |station| station.title == input }

    @routes << Route.new(start_station[0], end_station[0])
    puts 'Маршрут успешно создан!'
  end

  def create_route
    if @stations.size < 2
      puts 'Недостаточно станций!'
    else
      begin
        new_route
      rescue StandardError => e
        puts "Ошибка - #{e}, попробуйте еще раз!"
        retry
      end
    end
  end
end
