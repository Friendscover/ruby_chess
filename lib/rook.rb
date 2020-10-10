require 'piece'

class Rook < Piece
  def initialize(name)
    super(name, decide_color(name))
  end

  def decide_color(name)
    name.include?('black') ? '♜' : '♖'
  end

  def generate_moves(current_position)
    moves = []

    moves = generate_horizontal(current_position[0], current_position[1], moves)

    generate_vertical(current_position[0], current_position[1], moves)
  end

  def generate_horizontal(row, column, moves)
    i = 1
    until (row + i) > 7
      moves << [row + i, column]
      i += 1
    end

    j = 1
    until (row - j).negative?
      moves << [row - j, column]
      j += 1
    end

    moves
  end

  def generate_vertical(row, column, moves)
    i = 1
    until (column + i) > 7
      moves << [row, column + i]
      i += 1
    end

    j = 1
    until (column - j).negative?
      moves << [row, column - j]
      j += 1
    end

    moves
  end
end
