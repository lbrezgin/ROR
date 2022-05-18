puts "Назовите свое имя:"
name = gets.chomp
puts "Назовите свой рост:"
growth = gets.chomp

ideal_weight = (growth.to_i - 110) * 1.15

if ideal_weight < 0
  puts "#{name}, Ваш вес уже оптимальный."
else
  puts "#{name}, Ваш идеальный вес: #{ideal_weight}кг"
end
