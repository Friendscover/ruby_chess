require 'piece'

class Knight < Piece
  def initialize(name)
    super(name, decide_color(name))
  end

  def decide_color(name)
    name.include?('black') ? '♞' : '♘'
  end

  def generate_moves(current_position)
    moves = []

    moves = generate_positive_moves(current_position[0], current_position[1], moves)

    generate_negative_moves(current_position[0], current_position[1], moves)
  end

  def generate_positive_moves(row, column, moves)
    moves << [row + 2, column + 1]
    moves << [row + 2, column - 1]
    moves << [row - 2, column + 1]
    moves << [row - 2, column - 1]

    moves
  end

  def generate_negative_moves(row, column, moves)
    moves << [row + 1, column + 2]
    moves << [row + 1, column - 2]
    moves << [row - 1, column + 2]
    moves << [row - 1, column - 2]

    moves
  end
end
