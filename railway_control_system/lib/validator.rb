# frozen_string_literal: true

module Validator
  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def validate!
    # У каждого класса метод реализуется по своему в зависимости от атрибутов
  end
end
