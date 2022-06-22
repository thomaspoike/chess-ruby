# frozen_string_literal: true

# Chessboard class
# Contains the chessboard and its methods
class Chessboard
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
  end
end
