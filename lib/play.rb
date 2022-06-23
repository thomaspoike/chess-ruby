# frozen_string_literal: true

require_relative 'chessboard'
require_relative 'player'

# Play class
class Play
  attr_accessor :board, :player_1, :player_2, :current_player, :other_player

  def initialize
    @board = Chessboard.new
    @player_1 = Player.new('white', 'Player 1')
    @player_2 = Player.new('black', 'Player 2')
    @current_player = @player_1
    @other_player = @player_2
  end

  def play
    welcome
    until @board.checkmate?(@current_player.color) || @board.checkmate?(@other_player.color)
      @board.print_board
      from_position, to_position = from_and_to_position
      move_piece(from_position, to_position)
      @current_player, @other_player = @other_player, @current_player
    end
    @board.print_board
    @board.checkmate?(@current_player.color) ? puts("#{@current_player.name} wins!") : puts("#{@other_player.name} wins!")
  end

  def welcome
    puts 'Welcome to Chess!'
  end

  # Gets from and to positions from the player
  # Checks if the to position is colored the same as the player color
  def from_and_to_position
    puts "#{@current_player.name}'s turn."
    puts 'Please enter a position to move from. Heigh, width;'
    from_position = position
    puts 'Please enter a position to move to.'
    to_position = position
    while same_color?(to_position)
      puts 'You cannot move to the same color.'
      to_position = position
    end
    [from_position, to_position]
  end

  # Gets a position from the player
  # Returns only a valid position
  def position
    position = gets.chomp.split(',').map(&:to_i)
    until within_board?(position)
      puts 'Invalid position. Please enter a position. Heigh, width;'
      position = gets.chomp.split(',').map(&:to_i)
    end
    position
  end

  # Checks if the position is within the board
  def within_board?(position)
    position[0].between?(0, 7) && position[1].between?(0, 7)
  end

  # Moves the piece from the from position to the to position
  def move_piece(from_position, to_position)
    piece = @board.board[from_position[0]][from_position[1]]
    if piece.legal_move?(to_position)
      piece.move(to_position)
      @board.board[to_position[0]][to_position[1]] = piece
      @board.board[from_position[0]][from_position[1]] = nil
    end
  end

  def same_color?(position)
    return false if @board.board[position[0]][position[1]].nil?

    @board.board[position[0]][position[1]].color == @current_player.color
  end
end
