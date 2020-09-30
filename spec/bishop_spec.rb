require "./lib/bishop.rb"

describe "creates a bishop" do
  it "sucessfully " do
    expect(bishop = Bishop.new("white_bishop")).to be_a Bishop
  end

  it "is a child of piece" do
    expect(bishop = Bishop.new("white_bishop")).to be_a_kind_of Piece
  end

  it "assings the right color" do
    white_bishop = Bishop.new("white_bishop")
    black_bishop = Bishop.new("black_bishop")
    expect(black_bishop.icon).to eq("♝")
    expect(white_bishop.icon).to eq("♗")
  end
end