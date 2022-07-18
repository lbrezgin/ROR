puts "Введите стороны треугольника:"
print "a: "
  a = gets.chomp.to_i
print "b: "
  b = gets.chomp.to_i
print "c: "
  c = gets.chomp.to_i
  
if (a > b && a > c) && a**2 == b**2 + c**2 
  puts "Этот треугольник - прямоугольный."
elsif (b > a && b > c) && b**2 == a**2 + c**2 
  puts "Этот треугольник - прямоугольный."
elsif (c > a && c > b) && c**2 == b**2 + a**2 
  puts "Этот треугольник - прямоугольный."
elsif a == b && b == c && c == a
  puts "Этот треугольник - равносторонний и равнобедренный."
elsif a == b || a == c || b == c
  puts "Этот треугольник -  равнобедренный."
end
