# frozen_string_literal: true

# King class
class King
  attr_accessor :position, :color

  def initialize(position, color)
    @position = position
    @color = color
  end

  def legal_move?(new_position)
    return false if new_position.nil?
    color = @color
    color == 'white' ? move-up = true : move-up = false
    move-up ? @position[0] += 1 : @position[0] -= 1
  end

  def move(new_position)
    @position = new_position if legal_move?(new_position)
  end
end