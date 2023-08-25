# Общая задача: Написать модуль Accessors 
# 1) Модуль содержит метод уровня класса attr_accessor_with_history
# 2) attr_accessor_with_history динамически создает геттеры и сеттеры для любового количества
# атрибутов, а при изменении значения сохраняет предыдущее значение, и историю значения переменных получаем по 
# <имя_атрибута>_history инстанс метода
# 3) Метод strong_attr_accessor принимает: имя атрибута, класс атрибута, создаем геттеры и сеттеры, в сетторе проверяем класс нового значения относительно предыдущего, выбрасывает исключение

module Accessors 
  def attr_accessor_with_history(*arguments)
    arguments.each do |args|
      var_args = "@#{args}".to_sym
      history_var = "@#{args}_history".to_sym
      
      define_method(args) { instance_variable_get(var_args) }
      define_method("#{args}=".to_sym) do |value| 
        instance_variable_set var_args, value
        instance_variable_set(history_var, []) unless instance_variable_get(history_var)
        instance_variable_get(history_var) << value
      end
      define_method("#{args}_history".to_sym) do
        instance_variable_get(history_var)
      end
    end
  end

  def strong_attr_accessor(arg, arg_class)
    var_arg = "@#{arg}".to_sym
    define_method(arg) { instance_variable_get(var_arg) }
    define_method("#{arg}=".to_sym) do |value|
      raise TypeError, "Invalid attribute class" unless value.is_a?(arg_class)
      instance_variable_set var_arg, value
    end
  end
end
