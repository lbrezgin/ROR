puts "Назовите дату: (формат 1/2/2002)"
puts "День - "
day = gets.chomp.to_i
puts "Месяц - "
month = gets.chomp.to_i
puts "Год - "
year = gets.chomp.to_i

months = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

if (year % 4 == 0) && (year % 100 == 0) && (year % 400 == 0)
  months[2] = 29
  puts "Порядковый номер даты #{months[(0...month)].inject(0) {|sum, v| sum += v } + day}"
else
  puts "Порядковый номер даты #{months[(0...month)].inject(0) {|sum, v| sum += v } + day}" 
end
