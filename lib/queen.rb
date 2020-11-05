require_relative 'piece'

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
    moves << generate_positive_positive(current_position[0], current_position[1])

    # diagonal negative generation
    moves << generate_negative_negative(current_position[0], current_position[1])

    # diagonal neg/pos generation
    moves << generate_negative_positive(current_position[0], current_position[1])

    # diagonal pos/neg
    moves << generate_positive_negative(current_position[0], current_position[1])

    moves
  end

  def generate_rook(current_position, moves)
    moves << generate_horizontal_positive(current_position[0], current_position[1])

    moves << generate_horizontal_negative(current_position[0], current_position[1])

    moves << generate_vertical_positive(current_position[0], current_position[1])

    moves << generate_vertical_negative(current_position[0], current_position[1])

    moves
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

  def generate_positive_positive(row, column)
    moves = []
    i = 1

    until (row + i) > 7 || (column + i) > 7
      moves << [row + i, column + i]
      i += 1
    end

    moves
  end

  def generate_negative_negative(row, column)
    moves = []
    i = 1

    until (row - i).negative? || (column - i).negative?
      moves << [row - i, column - i]
      i += 1
    end

    moves
  end

  def generate_negative_positive(row, column)
    moves = []
    i = 1

    until (row - i).negative? || (column + i) > 7
      moves << [row - i, column + i]
      i += 1
    end

    moves
  end

  def generate_positive_negative(row, column)
    moves = []
    i = 1

    until (row + i) > 7 || (column - i).negative?
      moves << [row + i, column - i]
      i += 1
    end

    moves
  end
end
