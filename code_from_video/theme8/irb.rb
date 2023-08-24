line_num = 0 
input = ""

loop do 
  print "#{line_num}?: "
  line = gets
  break if line.strip == "exit"
  
  if line.strip == ""
    puts "Evaluationg..."
    puts eval(input)
    input = ""
  else
    input += line
  end
end
