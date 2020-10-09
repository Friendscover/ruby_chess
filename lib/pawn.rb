require 'piece'

class Pawn < Piece
  def initialize(name)
    super(name, decide_color(name))
  end

  def decide_color(name)
    name.include?('black') ? '♟︎' : '♙'
  end

  def generate_moves(current_position)
    row = current_position[0]
    column = current_position[1]
    moves = []
    
    moves << if name.include?('white')
               [row, column - 1]
             else
               [row, column + 1]
             end
    moves
  end
end
