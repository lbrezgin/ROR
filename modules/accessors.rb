# Общая задача: Написать модуль Accessors 
# 1) Модуль содержит метод уровня класса attr_accessor_with_history
# 2) attr_accessor_with_history динамически создает геттеры и сеттеры для любового количества
# атрибутов, а при изменении значения сохраняет предыдущее значение, и историю значения переменных получаем по 
# <имя_атрибута>_history инстанс метода
# 3) Метод strong_attr_accessor принимает: имя атрибута, класс атрибута, создаем геттеры и сеттеры, в сетторе проверяем класс нового значения относительно предыдущего, выбрасывает исключение

module Accessors 
  module ClassMethods
    
    def attr_accessor_with_history(*atr)
      # создаем геттеры и сеттеры с помощью define_method()
      # сохраняем историю в <имя_атрибута>_history
    end 

    def strong_attr_accessor(atr, atr_class)
      # создаем геттеры и сеттеры с помощью define_method()
      #проверяет
    end
  end

  module InstanceMethods
    def #<имя_атрибута>_history
      # история значения атриботов объекта
    end
  end
end
