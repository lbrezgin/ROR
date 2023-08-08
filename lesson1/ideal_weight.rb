puts "Как вас зовут?"
name = gets.chomp
puts "#{name} какой у вас рост?"
height = gets.chomp.to_i
ideal_weight = (height - 110) * 1.15
if ideal_weight > 0
  puts "Ваш идеальный вес #{ideal_weight}!"
else
  puts "У вас уже идеальный вес."
end
