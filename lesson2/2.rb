numbers = (10..100).to_a
step = []
numbers.each do |number|
  if number % 5 == 0
    step.push(number)
  end
end
print step