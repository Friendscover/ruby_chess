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

    moves << generate_horizontal_positive(current_position[0], current_position[1])

    moves << generate_horizontal_negative(current_position[0], current_position[1])

    moves << generate_vertical_positive(current_position[0], current_position[1])

    moves << generate_vertical_negative(current_position[0], current_position[1])
  end

  def generate_horizontal_positive(row, column)
    moves = []
    i = 1

    until (row + i) > 7
      moves << [row + i, column]
      i += 1
    end

    moves
  end

  def generate_horizontal_negative(row, column)
    moves = []
    i = 1

    until (row - i).negative?
      moves << [row - i, column]
      i += 1
    end

    moves
  end

  def generate_vertical_positive(row, column)
    moves = []
    i = 1

    until (column + i) > 7
      moves << [row, column + i]
      i += 1
    end

    moves
  end

  def generate_vertical_negative(row, column)
    moves = []
    i = 1

    until (column - i).negative?
      moves << [row, column - i]
      i += 1
    end

    moves
  end
end
