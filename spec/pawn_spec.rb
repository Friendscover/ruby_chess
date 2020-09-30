require "./lib/pawn.rb"

describe "creates a pawn" do
  it "sucessfully " do
    expect(pawn = Pawn.new("white_pawn")).to be_a Pawn
  end

  it "is a child of piece" do
    expect(pawn = Pawn.new("white_pawn")).to be_a_kind_of Piece
  end

  it "assings the right color" do
    white_pawn = Pawn.new("white_pawn")
    black_pawn = Pawn.new("black_pawn")
    expect(black_pawn.icon).to eq("♟︎")
    expect(white_pawn.icon).to eq("♙")
  end
end