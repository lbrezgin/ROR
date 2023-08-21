class CargoWagon < Wagon
  attr_reader :type

  def initialize(volume_total)
    @type = :cargo 
    super
  end

  def take_place(volume)
    return if free_place < volume
    @used_place += volume
  end
end
