# 8x8 board game = 64
# 16 pieces on board white and black
#=> 1 king, 1 queen, 2 rooks, 2 knights, 2 bishops, 8 pawns
# game over if checkmate => king has no moves that not gonna kick him out
# random if black or white => white moves first
# if piece is moved => occupied => remove enemy piece, else set piece
# moves:
# king => one square in any direction
# rook => any number of squares along rank or file, cannot leap over pieces
# bishop => moves diagonal, not over other pieces
# queen => rook + bishop, not over other pieces
# knight => 2,1 in any direction, only pieces that can leap over others
# pawn => move one or two pos => two only on first move => can capture opponent
#     if enemy pawn is in front of it one position left or right
class Game
  def initialize
    @chess_board = Board.new
    create_start_position
    set_start_position
    @chess_board.print_board
  end

  def create_start_position
    # initializes the starting positions if the board is created
    @white_front_row = generate_front_row('white')
    @white_back_row = generate_back_row('white')
    @black_front_row = generate_front_row('black')
    @black_back_row = generate_back_row('black')
  end

  def set_start_position
    8.times do |i|
      @chess_board.set_position(0, i, @black_back_row[i].icon)
      @chess_board.set_position(1, i, @black_front_row[i].icon)
      @chess_board.set_position(6, i, @white_front_row[i].icon)
      @chess_board.set_position(7, i, @white_back_row[i].icon)
    end
  end

  def generate_back_row(color)
    [Rook.new(color), Knight.new(color), Bishop.new(color), Queen.new(color), King.new(color), Bishop.new(color), Knight.new(color), Rook.new(color)]
  end

  def generate_front_row(color)
    front_row = []
    8.times do
      front_row << Pawn.new(color)
    end
    front_row
  end

  def play_turn
    # print board
    # get user position which piece to set
    # only allow players to set their color pieces
    # check if user positio is valid else get again
    # set position
    # check if won/check/checkamto/pawn switch
    # switch player
  end
end
