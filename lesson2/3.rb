arr = [0, 1]

loop do
  fibo = arr.last(2).sum
  break if fibo > 100
  arr << fibo
end
p arr








