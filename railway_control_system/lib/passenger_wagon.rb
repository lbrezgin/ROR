class PassengerWagon < Wagon
  attr_reader :type, :places, :all_places
  

  def initialize(places)
    @type = :passenger
    @places = places
    @all_places = {}
    create_places
  end

  def take_place(number) 
    all_places[number] = :taken
  end

  def free
    all_places.select { |k, v| v == :free}.size
  end

  def taken 
    all_places.select { |k, v| v == :taken}.size
  end

  private 

  def create_places 
    1.upto(places.to_i) do |place|
      all_places[place] = :free 
    end
  end
end
