require 'piece'

class Pawn < Piece
  def initialize(name)
    super(name, decide_color(name))
  end

  def decide_color(name)
    name.include?('black') ? '♟︎' : '♙'
  end

  def generate_moves(current_position)
    moves = []

    moves << generate_vertical_positive(current_position[0], current_position[1])
  end

  def generate_vertical_positive(row, column)
    moves = []

    moves << if name.include?('white')
               [row, column - 1]
             else
               [row, column + 1]
             end

    moves
  end
end
