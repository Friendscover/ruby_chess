require "piece.rb"

class Knight < Piece
  def initialize(name)
    super(name, decide_color(name))
  end

  def decide_color(name)
    name.include?("black") ? "♞" : "♘"
  end
end