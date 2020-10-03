require "./lib/game.rb"

describe "Game" do
  before { @game = Game.new }

  context "#initialize" do
    it "creates a board" do
      expect(@game).not_to eq(nil)
    end
  end
end
