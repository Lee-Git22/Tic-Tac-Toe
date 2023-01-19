require_relative './Game'

# Holds game state variables throughout the game
game_state = {
  'board' => [1, 2, 3, 4, 5, 6, 7, 8, 9],
  'turn' => 1,
  'winner' => nil,
  'player' => true
}

# The winning combo cell positions given as a number
WINNING_COMBO = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
  [1, 4, 7],
  [2, 5, 8],
  [3, 6, 9],
  [1, 5, 9],
  [3, 5, 7]
]

# Plays for 9 rounds or until there is a winner
while game_state['turn'] <= 9 && game_state['winner'] == nil
  Game.play_turn(game_state)
  game_state['winner'] = Game.check_winner(game_state)
end

# Game over message
Game.display_winner(game_state)