require_relative 'accessors'
require_relative 'validation'

#Тест модуля Accessors
class Test 
  extend Accessors

  attr_accessor_with_history :name, :username
  strong_attr_accessor :attr_name, String
end

t = Test.new 
t.name = 'lev'
t.name = 'tiger'
t.name = 'crocodile'
p t.name_history


#Тест модуля Validation
class Station 
end

class Test 
  include Validation

  attr_accessor :station, :name, :username
  #validate :station, :type, Station
  validate :name, :presence
  #validate :username, :format, /^\d+$/
end

s = Station.new 
t = Test.new 
t.station = s 
t.name = 'lev'
t.username = '12345'
p t.validate?
