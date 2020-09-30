require "./lib/knight.rb"

describe "creates a knight" do
  it "sucessfully " do
    expect(knight = Knight.new("white_knight")).to be_a Knight
  end

  it "is a child of piece" do
    expect(knight = Knight.new("white_knight")).to be_a_kind_of Piece
  end

  it "assings the right color" do
    white_knight = Knight.new("white_knight")
    black_knight = Knight.new("black_knight")
    expect(black_knight.icon).to eq("♞")
    expect(white_knight.icon).to eq("♘")
  end
end