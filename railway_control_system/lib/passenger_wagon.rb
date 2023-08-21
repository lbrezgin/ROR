class PassengerWagon < Wagon
  attr_reader :type
  
  def initialize(seats_total)
    @type = :passenger
    super
  end

  def take_place
    return if free_place <= 1 
    @used_place += 1
  end
end
