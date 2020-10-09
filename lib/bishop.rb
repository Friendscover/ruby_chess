require 'piece'

class Bishop < Piece
  def initialize(name)
    super(name, decide_color(name))
  end

  def decide_color(name)
    name.include?('black') ? '♝' : '♗'
  end

  def generate_moves(current_position)
    moves = []

    # diagonal positive generation
    moves = generate_positive_positive(current_position[0], current_position[1], moves)

    # diagonal negative generation
    moves = generate_negative_negative(current_position[0], current_position[1], moves)

    # diagonal neg/pos generation
    moves = generate_negative_positive(current_position[0], current_position[1], moves)

    # diagonal pos/neg
    moves = generate_positive_negative(current_position[0], current_position[1], moves)

    moves.uniq!
  end

  def generate_positive_positive(row, column, moves)
    until row >= 8 || column >= 8
      row += 1
      column += 1
      moves << [row, column]
    end

    moves
  end

  def generate_negative_negative(row, column, moves)
    until row.negative? || column.negative?
      moves << [row, column]
      row -= 1
      column -= 1
    end

    moves
  end

  def generate_negative_positive(row, column, moves)
    until row.negative? || column >= 8
      moves << [row, column]
      row -= 1
      column += 1
    end

    moves
  end

  def generate_positive_negative(row, column, moves)
    until row >= 8 || column.negative?
      moves << [row, column]
      row += 1
      column -= 1
    end

    moves
  end
end
