require "piece.rb"

class Rook < Piece
  def initialize(name)
    super(name, decide_color(name))
  end

  def decide_color(name)
    name.include?("black") ? "♜" : "♖"
  end
end