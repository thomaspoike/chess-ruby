# frozen_string_literal: true

# Pawn class
class Pawn
  attr_accessor :position, :color

  def initialize(position, color)
    @position = position
    @color = color
  end

  def legal_move?(new_position)
    return false if new_position.nil?

    color = @color
    if color =='white'
      return true if new_position == [@position[0] + 1, @position[1] + 1]
    else
      return true if new_position == [@position[0] - 1, @position[1] - 1]
    end
    false
  end

  def move(new_position)
    @position = new_position if legal_move?(new_position)
  end
end
