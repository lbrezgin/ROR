# class Foo  
#   def initialize
#     @bar = "instance var"
#   end

#   private 

#   def private_method 
#     puts "I am private method!"
#   end
# end 
 
# module MyAttrAccessor 
#   def my_attr_accessor(*names)
#     names.each do |name|
#       var_name = "@#{name}".to_sym
#       define_method(name) { instance_variable_get(var_name) }
#       define_method("#{name}=".to_sym) { |value| instance_variable_set(var_name, value)}
#     end
#   end
# end

# class Test 
#   extend MyAttrAccessor

#   my_attr_accessor :my_attr, :a, :b, :c
# end

class String
  def words
    words_array = []
    word = ""

    for index in 0..self.length-1 do 
      if self[index] != " "
        word << self[index]
        words_array << word if index == self.length-1
      elsif self[index] == " "
        words_array << word 
        word = ""
      end
    end
    words_array
  end
end

