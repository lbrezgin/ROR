# написать модуль Validation 
# 1) Содержит метод класса validate, параметры: имя проверяемого атрибута, значение валидации и при необходиммости еще какие-то параметры
# 2) presence - требует, чтобы значение атрибута было не nil и не пустой строкой
# 3) format (при этом отдельным параметром задается регулярное выражение для формата). Треубет соответствия значения атрибута заданному регулярному выражению. Пример:  
# 4) validate :station, :type, RailwayStation
# 5) содержит инстанас метод validate! который запускает все проверки, в случае ошибки выбрасывает исключение
# 6) инстанс метод validate? - возвращает true или false в зависимости от validate!

module Validation
  module ClassMethods
    def validate(atr_name, validation_type, _non_obl_args)
      # Типы валидации
      # presence - значениеn.nil? == false && значение != "" (или значение.length > 0)
      # format - требует соответствие с регулярным выражением
      # type - соответствие значения атрибута заданному классу
      #как я понял нужно создать три метода которые будут вызываться через send(validation_type)
    end


  end

  module InstanceMethods
    def validate!
      #presence
      #format
      #type
    end

    def validate?
      begin
        validate!
        true
      rescue => exception
        raise "ошибка"
      end
    end
  end
end
