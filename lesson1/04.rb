puts "Введите коэффициенты: "
print "a: "
a = gets.chomp.to_i

print "b: "
b = gets.chomp.to_i

print "c: "
c = gets.chomp.to_i
d = (b**2) - (4 * a * c)

if d > 0
  x1 = (-b + Math.sqrt(d)) / (2 * a)
  x2 = (-b - Math.sqrt(d)) / (2 * a)
  puts "D = #{d}, x1 = #{x1}, x2 = #{x2}"
elsif d == 0
  x = -b / (2 * a).to_f
  puts "D = #{d}, x = #{x}"
else 
  puts "D = #{d}, корней нет."
end
