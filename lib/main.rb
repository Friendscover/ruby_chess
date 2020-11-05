require_relative "game"

game = Game.new
# assigns the play before starting the game
game.assign_players
game.play_game