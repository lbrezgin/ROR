# 5.times do |count|
#   puts "#{count} pushups"
#   puts "#{count} pullups"
#   puts "#{count} wakeups"
# end

# 1.upto(5) do |count|
#   puts "#{count} situp"
#   puts "#{count} pushup"
#   puts "#{count} chinup"
# end

# flyers = []

# 1.upto(5) do |number|
#   flyers << Flyer.new("Flyer #{number}", "flyer#{number}@example.com", number * 1000)
# end

# puts flyers

def call_proc
  puts "Before proc"
  my_proc = lambda { return 2 }
  my_proc.call
  puts "After proc"
end

p call_proc