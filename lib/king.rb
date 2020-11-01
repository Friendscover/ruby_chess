require 'piece'

class King < Piece
  def initialize(name)
    super(name, decide_color(name))
  end

  def decide_color(name)
    name.include?('black') ? '♚' : '♔'
  end

  def generate_moves(current_position)
    moves = []

    moves = generate_diagonal(current_position[0], current_position[1], moves)

    moves = generate_horizontal(current_position[0], current_position[1], moves)

    generate_vertical(current_position[0], current_position[1], moves)
  end

  def generate_diagonal(row, column, moves)
    moves <<  [row + 1, column + 1] unless row + 1 > 7 || column + 1 > 7
    moves <<  [row - 1, column - 1] unless (row - 1).negative? || (column - 1).negative?
    moves <<  [row + 1, column - 1] unless row + 1 > 7 || (column - 1).negative?
    moves <<  [row - 1, column + 1] unless (row - 1).negative? || column + 1 > 7

    moves
  end

  def generate_horizontal(row, column, moves)
    moves <<  [row + 1, column] unless row + 1 > 7
    moves <<  [row - 1, column] unless (row - 1).negative?

    moves
  end

  def generate_vertical(row, column, moves)
    moves <<  [row, column + 1] unless column + 1 > 7
    moves <<  [row, column - 1] unless (column - 1).negative?

    moves
  end
end
