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
end