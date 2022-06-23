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

    possible_moves = [[1, 1], [1, 0], [1, -1], [0, 1], [0, -1], [-1, 1], [-1, 0], [-1, -1]]
    possible_moves.each do |element|
      position_x = @position[0] + element[0]
      position_y = @position[1] + element[1]
      return true if position_x == new_position[0] && position_y == new_position[1]
    end
    false
  end

  def move(new_position)
    @position = new_position if legal_move?(new_position)
  end
end
