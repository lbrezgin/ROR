class CargoWagon < Wagon
  attr_reader :type, :taken, :volume, :free

  def initialize(volume)
    @type = :cargo 
    @volume = volume 
    @free = volume
    @taken = 0  
  end

  def fill_wagon(num)
    @free -= num
    @taken += num
  end
end
