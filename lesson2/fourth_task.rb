hash = Hash.new

letters = ("a".."z")
num = 1
letters.each do |letter|
  hash[letter] = num
  num += 1
end

puts hash
