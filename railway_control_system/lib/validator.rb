module Validator 
  def valid?
    check_validaty
    true 
  rescue 
    false
  end

  def validate! 
    #У каждого класса метод реализуется по своему в зависимости от атрибутов
  end
end
