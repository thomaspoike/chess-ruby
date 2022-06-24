# Rook class
class Rook
  attr_accessor :color, :position, :piece

  def initialize(position, color)
    @position = position
    @color = color
    @color == 'white' ? @piece = '♖' : @piece = '♜'
  end

  def legal_move?(new_position)
    return false if new_position.nil?

    (0..7).each do |i|
      return true if [@position[0] + i, @position[1]] == new_position
      return true if [@position[0] - i, @position[1]] == new_position
      return true if [@position[0], @position[1] + i] == new_position
      return true if [@position[0], @position[1] - i] == new_position
    end
    false
  end

  def move(new_position)
    @position = new_position if legal_move?(new_position)
  end

  def generated_moves
    moves_one, moves_two, moves_three, moves_four = [], [], [], []
    (1..7).each do |i|
      moves_one << [@position[0], @position[1] + i] if (@position[0]).between?(0, 7) && (@position[1] + i).between?(0, 7)

      moves_three << [@position[0], @position[1] - i] if (@position[0]).between?(0, 7) && (@position[1] - i).between?(0, 7)

      moves_two << [@position[0] + i, @position[1]] if (@position[0] + i).between?(0, 7) && (@position[1]).between?(0, 7)

      moves_four << [@position[0] - i, @position[1]] if (@position[0] - i).between?(0, 7) && (@position[1]).between?(0, 7)
    end
    moves = [moves_one] + [moves_two] + [moves_three] + [moves_four]
    moves.each do |move|
      move.empty? ? moves.delete(move) : nil
    end
    moves
  end
end
