require 'piece'

class Queen < Piece
  def initialize(name)
    super(name, decide_color(name))
  end

  def decide_color(name)
    name.include?('black') ? '♛' : '♕'
  end

  def generate_moves(current_position)
    moves = []

    moves = generate_bishop(current_position, moves)

    generate_rook(current_position, moves)
  end

  def generate_bishop(current_position, moves)
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

  def generate_rook(current_position, moves)
    moves = generate_vertical(current_position[0], current_position[1], moves)

    generate_horizontal(current_position[0], current_position[1], moves)
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
