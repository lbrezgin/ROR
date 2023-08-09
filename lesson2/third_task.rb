def fibs_rec(num)
  if num == 0
    return 0
  elsif num == 1
    return 1
  else
    fibs_rec(num-1) + fibs_rec(num-2)
  end
end

result = [0]
num = 1
loop do 
  fib_num = fibs_rec(num)
  break if fib_num > 100
  result.push(fib_num) 
  num += 1
end

puts result
