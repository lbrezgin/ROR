class SportCar < Car 
  def start_engine
    puts "Click!" 
    super
    puts "wroom!"
  end

  protected

  def initial_rpm
    1000
  end
end
