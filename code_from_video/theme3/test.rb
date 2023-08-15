class NewClass 

  attr_reader :instance_variable 

  @@class_variable = "Class variable"

  def initialize
    @instance_variable = "Instance variable" 
  end


  class << self 
    attr_reader :class_instance_variable
  end

  @class_instance_variable = "Class instance variable"
end