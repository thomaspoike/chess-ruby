# frozen_string_literal: true

# Bishop class
# Contains the bishop and its movement method
class Bishop
  attr_accessor :position, :color, :piece

  def initialize(position, color)
    @position = position
    @color = color
    @color == 'white' ? @piece = '♗' : @piece = '♝'
  end

  def legal_move?(new_position)
    return false if new_position.nil?

    (1..7).each do |i|
      return true if [@position[0] + i, @position[1] + i] == new_position
      return true if [@position[0] - i, @position[1] + i] == new_position
      return true if [@position[0] + i, @position[1] - i] == new_position
      return true if [@position[0] - i, @position[1] - i] == new_position
    end
    false
  end

  def move(new_position)
    @position = new_position if legal_move?(new_position)
  end

  def generated_moves
    moves_one, moves_two, moves_three, moves_four = [], [], [], []
    (1..7).each do |i|
      moves_one << [@position[0] + i, @position[1] + i] if (@position[0] + i).between?(0, 7) && (@position[1] + i).between?(0, 7)
      moves_two << [@position[0] - i, @position[1] + i] if (@position[0] - i).between?(0, 7) && (@position[1] + i).between?(0, 7)
      moves_three << [@position[0] + i, @position[1] - i] if (@position[0] + i).between?(0, 7) && (@position[1] - i).between?(0, 7)
      moves_four << [@position[0] - i, @position[1] - i] if (@position[0] - i).between?(0, 7) && (@position[1] - i).between?(0, 7)
    end
    moves = [moves_one] + [moves_two] + [moves_three] + [moves_four]
    moves.each do |move|
      move.empty? ? moves.delete(move) : nil
    end
    moves
  end

  def clean_moves(moves)
    # remove empty
    moves.delete_if { |move| move.nil? }
  end

end

bishop = Bishop.new([0, 0], 'white')
p (bishop.generated_moves)