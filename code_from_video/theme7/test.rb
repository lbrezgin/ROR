# frozen_string_literal: true

class String
  def self.random(length)
    rand(36**length).to_s(36)
  end

  def my_method
    capitalize
  end
end
