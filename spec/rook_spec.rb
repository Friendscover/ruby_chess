require "./lib/rook.rb"

describe "creates a rook" do
  it "sucessfully " do
    expect(rook = Rook.new("white_rook")).to be_a Rook
  end

  it "is a child of piece" do
    expect(rook = Rook.new("white_rook")).to be_a_kind_of Piece
  end

  it "assings the right color" do
    white_rook = Rook.new("white_rook")
    black_rook = Rook.new("black_rook")
    expect(black_rook.icon).to eq("♜")
    expect(white_rook.icon).to eq("♖")
  end
end