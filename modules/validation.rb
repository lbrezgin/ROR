# написать модуль Validation 
# 1) Содержит метод класса validate, параметры: имя проверяемого атрибута, значение валидации и при необходиммости еще какие-то параметры
# 2) presence - требует, чтобы значение атрибута было не nil и не пустой строкой
# 3) format (при этом отдельным параметром задается регулярное выражение для формата). Треубет соответствия значения атрибута заданному регулярному выражению. Пример:  
# 4) validate :station, :type, RailwayStation
# 5) содержит инстанас метод validate! который запускает все проверки, в случае ошибки выбрасывает исключение
# 6) инстанс метод validate? - возвращает true или false в зависимости от validate!

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validate(attribute, validation_type, *options)
      validations << { attribute: attribute, validation_type: validation_type, options: options }
    end

    def validations
      @validations ||= []
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        attribute = validation[:attribute]
        validation_type = validation[:validation_type]
        options = validation[:options]

        valid = send(attribute)

        case validation_type
        when :presence
          raise "#{attribute} must be present" unless presence_valid?(valid)
        when :format
          raise "#{attribute} format is invalid" unless format_valid?(valid, options[0])
        when :type
          raise "#{attribute} must be of type #{options[0]}" unless type_valid?(valid, options[0])
        end
      end
    end

    def validate?
      validate!
      true
    rescue => exception
      false
    end 

    def presence_valid?(value)
      !value.nil? && !value.to_s.empty?
    end

    def format_valid?(value, regex)
      !value.to_s.match(regex).nil?
    end

    def type_valid?(value, type)
      value.is_a?(type)
    end
  end
end

