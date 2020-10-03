class Board
  attr_accessor :board

  def initialize
    @board = create_board
    @column = (1..8).to_a
    @row = ('a'..'h').to_a
  end

  def print_board
    @board.each_with_index do |elements, index|
      print "#{@column[index]} |"
      elements.each do |element|
        if element == ' '
          print "#{element}  |"
        else
          print " #{element.icon} |"
        end
      end
      puts ''
    end
    print ' '
    @row.each { |number| print "   #{number}" }
  end

  def set_position(x_position, y_position, item)
    @board[x_position][y_position] = item
  end

  private

  def create_board
    Array.new(8) { Array.new(8, ' ') }
  end
end
