require "./lib/board.rb"

describe "creates a chess board" do
  it "creates a board" do 
    chess_board = Board.new
    expect(chess_board.board).not_to eq(nil)
  end

  it "creates a 8x8 board" do   
    chess_board = Board.new
    expect(chess_board.board.flatten.length).to eq(64)
  end

  it "prints the board" do
    chess_board = Board.new
    expect(chess_board.print_board).to be_a(Array)
  end

  it "set a piece on position 0/0" do
    chess_board = Board.new
    chess_board.set_position(0, 0, "x")
    expect(chess_board.board[0][0]).to eq("x")
  end
end