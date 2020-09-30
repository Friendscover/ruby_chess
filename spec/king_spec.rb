require "./lib/king.rb"

describe "creates a king" do
  it "sucessfully " do
    expect(king = King.new("white_king")).to be_a King
  end

  it "is a child of piece" do
    expect(king = King.new("white_king")).to be_a_kind_of Piece
  end

  it "assings the right color" do
    white_king = King.new("white_king")
    black_king = King.new("black_king")
    expect(black_king.icon).to eq("♚")
    expect(white_king.icon).to eq("♔")
  end
end