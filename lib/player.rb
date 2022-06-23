# frozen_string_literal: true

# Player class
class Player
  attr_accessor :color, :name

  def initialize(color, name)
    @color = color
    @name = name
  end
end
