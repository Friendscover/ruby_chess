require 'piece'

# Rook is used as a chess piece which can move any number of squares along the rank or file but can not leap over pieces
class Rook < Piece
  def initialize(name)
    super(name, decide_color(name))
  end

  def decide_color(name)
    name.include?('black') ? '♜' : '♖'
  end
end
