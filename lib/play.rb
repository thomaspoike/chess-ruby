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

  def welcome_message
    puts "Welcome to Chess!"
  end

  def play
    welcome
    until @board.checkmate?(@current_player.color) || @board.checkmate?(@other_player.color)
      @board.print_board
      from_position, to_position = get_positions
      update_board(from_position, to_position)
      check?()
      @current_player, @other_player = @other_player, @current_player
    end
    @board.print_board
    @board.checkmate?(@current_player.color) ? puts("#{@current_player.name} wins!") : puts("#{@other_player.name} wins!")
  end

  # Checks if there's a piece at the position, useful in checking the path is blocked
  def piece_at_position?(position)
    !@board.board[position[0]][position[1]].nil?
  end

  # Checks if at a position the piece is the same color as player
  def same_color?(position)
    @board.board[position[0]][position[1]].color == @current_player.color
  end

  def check_to_position?(moves, to_position)
    moves.each do |move|
      return true if move.include?(to_position)
    end
    false
  end

  # Gets the positions from the player
  def get_positions
    puts "#{@current_player.name}, please enter the position of the piece you want to move"
    from_position = gets.chomp.split(',').map(&:to_i)
    puts "#{@current_player.name}, please enter the position you want to move to"
    to_position = gets.chomp.split(',').map(&:to_i)
    piece = @board.board[from_position[0]][from_position[1]]
    moves = piece.generate_moves

    until check_to_position?(moves, to_position)
      puts 'Invalid position, please try again'
      to_position = gets.chomp.split(',').map(&:to_i)
    end

    while path_blocked?(from_position, to_position)
      puts 'Invalid position, please try again'
      to_position = gets.chomp.split(',').map(&:to_i)
    end
    [from_position, to_position]
  end

  # Generates path between two positions
  def generate_path(from_position, to_position)
    path = []
    if to_position[0] > from_position[0] && to_position[1] > from_position[1]
      # Up and right
      (from_position[0]..to_position[0]).each do |i|
        path << [i, from_position[1] + (i - from_position[0])]
      end
    elsif to_position[0] > from_position[0] && to_position[1] < from_position[1]
      # Up and left
      (from_position[0]..to_position[0]).each do |i|
        path << [i, from_position[1] - (i - from_position[0])]
      end
    elsif to_position[0] < from_position[0] && to_position[1] > from_position[1]
      # Down and right
      (to_position[0]..from_position[0]).each do |i|
        path << [from_position[0] - (i - to_position[0]), from_position[1] + (i - from_position[0])]
      end
    elsif to_position[0] < from_position[0] && to_position[1] < from_position[1]
      # Down and left
      (to_position[0]..from_position[0]).each do |i|
        path << [from_position[0] - (i - to_position[0]), from_position[1] - (i - from_position[0])]
      end
    elsif to_position[0] > from_position[0]
      # Right
      (from_position[1]..to_position[1]).each do |i|
        path << [from_position[0], i]
      end
    elsif to_position[0] < from_position[0]
      # Left
      (to_position[1]..from_position[1]).each do |i|
        path << [from_position[0], i]
      end
    elsif to_position[1] > from_position[1]
      # Up
      (from_position[0]..to_position[0]).each do |i|
        path << [i, from_position[1]]
      end
    elsif to_position[1] < from_position[1]
      # Down
      (to_position[0]..from_position[0]).each do |i|
        path << [i, from_position[1]]
      end
    end
    path(1..-2)
  end

  # Checks if the path is blocked
  def path_blocked?(from_position, to_position)
    path = generate_path(from_position, to_position)
    path.each do |position|
      return true if piece_at_position?(position) && !same_color?(position)
    end
    false
  end
end
