# begin
#   puts "Before exeption"
#   Math.sqrt(-1)
# rescue  => e
#   puts "Exception: #{e.message}" 
#   raise
# end
# puts "After exception!"
# def method_with_error 
#   #....
#   raise ArgumentError, "Oh no!"
# end

# begin 
#   method_with_error
# rescue RuntimeError => e  
#   puts e.inspect 
# end

# puts "After exception"

# def sqrt(value)
#   sqrt = Math.sqrt(value)
#   puts sqrt
# rescue 
#   puts "Неверное значение"
# end

# sqrt(-1)

def connect_to_wikipedia 
  #...
  raise "Connection error"
end 

attempt = 0
begin
  connect_to_wikipedia
rescue NoMemoryError => exception
  attempt += 1
  retry if attempt < 3
  #puts "Check yout connection!" 
ensure 
  puts "There was #{attempt} attempts"
end

