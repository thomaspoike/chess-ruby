# frozen_string_literal: true

require_relative 'knight'
require_relative 'bishop'
require_relative 'rook'
require_relative 'queen'
require_relative 'king'
require_relative 'pawn'

# Chessboard class
# Contains the chessboard and its methods
class Chessboard
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def populate_board
    # Populate the board with pawns
    (0..7).each do |i|
      @board[1][i] = Pawn.new([1, i], 'white')
      @board[6][i] = Pawn.new([6, i], 'black')
    end
    # Populate the board with rooks
    @board[0][0] = Rook.new([0, 0], 'white')
    @board[0][7] = Rook.new([0, 7], 'white')
    @board[7][0] = Rook.new([7, 0], 'black')
    @board[7][7] = Rook.new([7, 7], 'black')
    # Populate the board with knights
    @board[0][1] = Knight.new([0, 1], 'white')
    @board[0][6] = Knight.new([0, 6], 'white')
    @board[7][1] = Knight.new([7, 1], 'black')
    @board[7][6] = Knight.new([7, 6], 'black')
    # Populate the board with bishops
    @board[0][2] = Bishop.new([0, 2], 'white')
    @board[0][5] = Bishop.new([0, 5], 'white')
    @board[7][2] = Bishop.new([7, 2], 'black')
    @board[7][5] = Bishop.new([7, 5], 'black')
    # Populate the board with kings
    @board[0][3] = King.new([0, 4], 'white')
    @board[7][3] = King.new([7, 3], 'black')
    # Populate the board with queens
    @board[0][4] = Queen.new([0, 3], 'white')
    @board[7][4] = Queen.new([7, 4], 'black')
  end

  # Print the board
  def print_board
    puts '   A B C D E F G H'
    (0..7).each do |i|
      print "#{8 - i}  "
      (0..7).each do |j|
        print @board[i][j].nil? ? 'X ' : @board[i][j].class.name[0..1]+@board[i][j].color[0].upcase + ' '
      end
      print "  #{8 - i} "

      puts
    end
    puts '   A B C D E F G H'
  end
end
board = Chessboard.new
board.populate_board
board.print_board
