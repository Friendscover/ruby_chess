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
  attr_accessor :current_player, :player1, :player2

  def initialize
    @chess_board = Board.new
    assign_players
    create_start_position
    set_start_position
    play_game
  end

  def play_game
    loop do
      @chess_board.print_board
      play_turn
      switch_current_player
    end
    # check if won/check/checkamto/pawn switch
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
      @chess_board.set_position(0, i, @black_back_row[i])
      @chess_board.set_position(1, i, @black_front_row[i])
      @chess_board.set_position(6, i, @white_front_row[i])
      @chess_board.set_position(7, i, @white_back_row[i])
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

  def assign_players
    user_input = choose_player
    assign_starting_player(user_input)
    start_player_message
  end

  def choose_player
    puts 'Player1, which pieces do you prefer? Choose <black> or <white>!'
    user_input = gets.chomp
    until user_input.include?('white') || user_input.include?('black')
      puts 'That was a wrong argument. Try <black> or <white> again!'
      user_input = gets.chomp
    end
    user_input
  end

  def assign_starting_player(user_input)
    if user_input == 'white'
      @player1 = 'white'
      @player2 = 'black'
      @current_player = @player1
    else
      @player1 = 'black'
      @player2 = 'white'
      @current_player = @player2
    end
  end

  def start_player_message
    puts "Player1 chooses #{@player1}. Player2 chooses #{player2}!"
    puts "The Game starts with #{@current_player} \n \n"
  end

  def play_turn
    puts "\n \n#{@current_player}. Choose a Piece to move! Type <help> for more info"
    user_input = choose_position
    user_input = convert_user_input(user_input)

    until valid_piece_selected?(user_input)
      puts 'Thats no a valid piece. Try again'
      user_input = choose_position
      user_input = convert_user_input(user_input)
    end
    assign_new_position(user_input)
  end

  def choose_position
    user_input = gets.chomp

    until user_input.match(/[a-h][1-8]/) && user_input.length == 2
      if user_input == 'help'
        puts 'To pick a position on the board type the row <a-h> and column <1-8>!'
        puts 'For example. Type <a1> to choose the piece on this position!'
      else
        puts 'Thats not quit right. Try again. Type <help> for more info!'
      end
      user_input = gets.chomp
    end

    user_input
  end

  def convert_user_input(input)
    alphabet_to_array = %w[a b c d e f g h]
    input = input.split(//)

    column = alphabet_to_array.index(input[0])
    row = input[1].to_i - 1
    [column, row]
  end

  def valid_piece_selected?(position)
    piece = @chess_board.board[position[1]][position[0]]
    # does not raise error for string.name if piece is not a piece
    # does not check the second half of the condition if first half is false
    piece != ' ' && piece.name == current_player
  end

  def assign_new_position(current_position)
    current_piece = @chess_board.board[current_position[1]][current_position[0]]
    puts 'Please choose a new Position for your Piece!'
    puts "Selected Piece: #{current_piece.icon} \n"
    # check if new position is valid move? set : get position again
    new_position = check_new_position(current_piece, current_position)

    @chess_board.set_position(current_position[1], current_position[0], ' ')
    @chess_board.set_position(new_position[1], new_position[0], current_piece)
  end

  def switch_current_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def check_new_position(piece, position)
    loop do
      new_position = choose_position
      new_position = convert_user_input(new_position)
      possible_moves = piece.generate_moves(position)
      p possible_moves
      # adds a check for positions that are occupied. e.g. no jump over pieces
      return new_position if possible_moves.include?(new_position)
    end
  end
end
