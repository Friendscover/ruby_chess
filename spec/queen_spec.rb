require "./lib/queen.rb"

describe "creates a queen" do
  it "sucessfully " do
    expect(queen = Queen.new("white_queen")).to be_a Queen
  end

  it "is a child of piece" do
    expect(queen = Queen.new("white_queen")).to be_a_kind_of Piece
  end

  it "assings the right color" do
    white_queen = Queen.new("white_queen")
    black_queen = Queen.new("black_queen")
    expect(black_queen.icon).to eq("♛")
    expect(white_queen.icon).to eq("♕")
  end
end