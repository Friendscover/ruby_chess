class Board
  attr_accessor :board 

  def initialize
    @board = create_board
  end

  def print_board
    @board.each { |elements| p elements }
  end

  private

  def create_board
    Array.new(8) { Array.new(8, " ") }
  end
end