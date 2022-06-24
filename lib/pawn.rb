# frozen_string_literal: true

# Pawn class
class Pawn
  attr_accessor :position, :color, :piece

  def initialize(position, color)
    @position = position
    @color = color
    @color == 'white' ? @piece = '♙' : @piece = '♟'
  end

  def legal_move?(new_position)
    return false if new_position.nil?

    color = @color
    if color == 'white'
      return true if new_position == [@position[0] + 1, @position[1]]
    elsif new_position == [@position[0] - 1, @position[1]]
      return true
    end
    false
  end

  def move(new_position)
    @position = new_position if legal_move?(new_position)
  end

  def generated_moves
    color == 'white' ? moves = [[[1, 0]]] : moves = [[[-1, 0]]]
  end
end
