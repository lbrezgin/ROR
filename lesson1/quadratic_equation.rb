puts "Введите три коэфицента: "
print "a - "
a = gets.chomp.to_i

print "b - "
b = gets.chomp.to_i

print "c - "
c = gets.chomp.to_i

def discriminant(a, b, c)
  d = b**2 - (4*a*c)
  puts "Дискриминант = #{d}"

  if d > 0 
    x1 = (-b + Math.sqrt(d)) / (2*a)  
    x2 = (-b - Math.sqrt(d)) / (2*a)
    puts "x1 = #{x1}"
    puts "x2 = #{x2}"
  elsif d == 0 
    x = -b/(2*a)
    puts "X = #{x}"
  else
    puts "Корней нет!"
  end
end

puts discriminant(a, b, c)
