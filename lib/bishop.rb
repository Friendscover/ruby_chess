require 'piece'

class Bishop < Piece
  def initialize(name)
    super(name, decide_color(name))
  end

  def decide_color(name)
    name.include?('black') ? '♝' : '♗'
  end

  def generate_moves(current_position) 
    row = current_position[0]
    column = current_position[1]
    moves = []

    until row >= 8 || column >= 8
      row += 1
      column += 1
      moves << [row, column]
    end

    row = current_position[0]
    column = current_position[1]

    until row < 0 || column < 0
      moves << [row, column]
      row -= 1
      column -= 1
    end

    row = current_position[0]
    column = current_position[1]

    until row < 0 || column >= 8
      moves << [row, column]
      row -= 1
      column += 1
    end

    row = current_position[0]
    column = current_position[1]

    until row >= 8 || column < 0
      moves << [row, column]
      row += 1
      column -= 1
    end

    moves.uniq!
  end
end
