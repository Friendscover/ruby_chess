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
    moves <<  [row + 1, column + 1]
    moves <<  [row - 1, column - 1]
    moves <<  [row + 1, column - 1]
    moves <<  [row - 1, column + 1]

    moves
  end

  def generate_horizontal(row, column, moves)
    moves <<  [row + 1, column]
    moves <<  [row - 1, column]

    moves
  end

  def generate_vertical(row, column, moves)
    moves <<  [row, column + 1]
    moves <<  [row, column - 1]

    moves
  end
end
