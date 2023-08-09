purchases = Hash.new

loop do 
  puts "Название товара: "
  name = gets.chomp 
  break if name == "стоп"
  puts "Цена: "
  price = gets.chomp.to_f
  puts "Количество товара: "
  count = gets.chomp.to_f
  puts "Чтобы посчитать итоговую стоимость, в названии товара введите 'стоп'"
  purchases[name] = { price => count}
end

all_prices = 0
purchases.each do |product, info|
  puts "У вас в корзине #{product}, стоимостью #{info.keys.join} $ за #{info.values.join} штук, итоговая сумма #{info.keys.join.to_f * info.values.join.to_f} $" 
  all_prices += (info.keys.join.to_f * info.values.join.to_f)
end
puts "Итоговая сумма ваших покупок составляет #{all_prices} $"
