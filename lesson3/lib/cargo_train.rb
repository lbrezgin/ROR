class CargoTrain < Train

  def attach_a_wagon(wagon)
    self.wagons << wagon if wagon.is_a?(CargoWagon)
  end
end
