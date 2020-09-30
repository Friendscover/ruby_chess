class Board
  attr_accessor :board 

  def initialize
    @board = create_board
  end

  def print_board
    @board.each { |elements| p elements }
  end

  def set_position(x_position, y_position, item)
    @board[x_position][y_position] = item
  end

  private

  def create_board
    Array.new(8) { Array.new(8, " ") }
  end
end