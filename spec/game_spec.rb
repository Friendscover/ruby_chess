require "./lib/game.rb"

describe "Game" do
  before { @game = Game.new }

  context "#initialize" do
    it "creates a board" do
      expect(@game).not_to eq(nil)
    end

    it "assigns the right player for the given user input" do
      allow(@game).to receive(:gets).and_return("white")
      @game.choose_player
    end
  end
end
