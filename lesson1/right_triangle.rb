puts "По очереди укажите стороны треугольника:"
a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i

def find_longest(a,b,c)
  longest = a 
  if longest < b 
    longest = b 
    if longest < c  
      longest = c 
    end
  elsif longest < c 
    longest = c 
  end
  longest
end

array = [a,b,c]
hipo = array.delete(find_longest(a, b, c))
if hipo**2 == array.inject(0){ |sum, x| sum + x**2 }
  puts "Это прямоугольный треугольник"
elsif a == b || b == c || a == c
  puts "Это равнобедренный треугольник"
  puts "Это равносторонний треугольник" if a == b && b == c 
else
  puts "Данный треугольник не является не прямоугольным, не равнобедренным, не равносторонним."
end
