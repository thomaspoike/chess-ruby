# Rook class
class Rook
  attr_accessor :color, :position

  def initialize(position, color)
    @position = position
    @color = color
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
end
