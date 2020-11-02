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
      break if check?

      switch_current_player
    end
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
    number_array = [7, 6, 5, 4, 3, 2, 1, 0]
    input = input.split(//)

    column = alphabet_to_array.index(input[0])
    row = number_array.index(input[1].to_i - 1)
    [row, column]
  end

  def valid_piece_selected?(position)
    piece = @chess_board.board[position[0]][position[1]]
    # does not raise error for string.name if piece is not a piece
    # does not check the second half of the condition if first half is false
    piece != ' ' && piece.name == current_player
  end

  def assign_new_position(current_position)
    current_piece = @chess_board.board[current_position[0]][current_position[1]]

    puts 'Please choose a new Position for your Piece!'
    puts "Selected Piece: #{current_piece.icon} \n"

    new_position = check_new_position(current_piece, current_position)

    @chess_board.set_position(current_position[0], current_position[1], ' ')
    @chess_board.set_position(new_position[0], new_position[1], current_piece)
  end

  def switch_current_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def check_new_position(piece, position)
    loop do
      new_position = choose_position
      new_position = convert_user_input(new_position)

      possible_moves = piece.generate_moves(position)

      possible_moves = remove_occupied_position(possible_moves) unless piece.is_a?(Knight) || piece.is_a?(King)

      return new_position if possible_moves.include?(new_position)
    end
  end

  def remove_occupied_position(moves)
    valid_moves = []

    moves.each do |row|
      next if row.empty?

      i = 0
      position = ' '

      until position != ' ' || i >= row.length
        valid_moves << row[i]
        position = @chess_board.get_position(row[i][0], row[i][1])
        i += 1
      end
    end
    valid_moves
  end

  def check?
    king_position = find_piece(King, current_player).flatten(1)
    # find positions of enemy pieces => needs to switch player
    enemy = current_player == 'black' ? 'white' : 'black'
    enemy_positions = find_piece(Piece, enemy)
    # generation to later compare with king position
    enemy_moves = generate_enemy_moves(enemy_positions)

    # if king is under check, try if it is checkmate?
    enemy_moves.each do |move|
      if move.include?(king_position)
        puts 'The King is under Check!'
        return check_mate?(king_position, enemy_moves)
      end
    end
    false
  end

  def find_piece(piece, player)
    positions = []

    @chess_board.board.each_with_index do |array, array_index|
      array.each_with_index do |element, element_index|
        positions << [array_index, element_index] if element.is_a?(piece) && element.name == player
      end
    end
    positions
  end

  def generate_enemy_moves(enemy_positions)
    valid_moves = []

    enemy_positions.each do |position|
      piece = @chess_board.get_position(position[0], position[1])
      move = piece.generate_moves(position)
      move = remove_occupied_position(move) unless piece.is_a?(Knight) || piece.is_a?(King)
      valid_moves << move
    end
    valid_moves
  end

  def check_mate?(king_position, enemy_moves)
    king = @chess_board.get_position(king_position[0], king_position[1])
    king_moves = king.generate_moves(king_position)
    # the piece generation is build to generate moves for each direction to
    # delete moves that follow if the position is blocked. Since thats
    # irrelevant in this method, just flatten it for easy traversing
    enemy_moves.flatten!(1)
    moves_available = []

    king_moves.each do |move|
      moves_available << move unless enemy_moves.include?(move)
    end
    moves_available.empty?
  end
end
