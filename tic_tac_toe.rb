### Game flow:
# Load game and draw board
# Prompt player 1 to enter move
# draw "X" at selected location
  # Check win con
# Prompt player 2 to enter move
# draw "O" at selected location
  # Check win con
# Repeat until moves are at 9 or if win con is met
module Game
  def draw(game_state)
    puts <<-TEXT
    +---------------+
    || #{game_state['board'][0]} || #{game_state['board'][1]} || #{game_state['board'][2]} ||
    || #{game_state['board'][3]} || #{game_state['board'][4]} || #{game_state['board'][5]} ||
    || #{game_state['board'][6]} || #{game_state['board'][7]} || #{game_state['board'][8]} ||
    +---------------+
    TEXT
  end

  def player_input(game_state)
    puts "Player #{game_state['player'] ? 1 : 2}: Select position to take"
    gets.to_i
  end

  def update_board(game_state, input)
    game_state['board'].map do |position|
    if position == input 
      game_state['turn'] += 1
      game_state['player'] = !game_state['player']
      game_state['player'] ? 'O' : 'X'
    else
      position
    end
    end
  end

  def check_winner(game_state)
    WINNING_COMBO.each do |combo|
      tmp_array = []
      3.times do |position|
        tmp_array.push([game_state['board'][combo[position] - 1]])
      end
      if tmp_array.count(tmp_array[0]) == 3
        return game_state['winner'] = game_state['player'] ? 1 : 2
      end
    end
    game_state['winner'] = nil
  end
  

  def play_turn(game_state)
    puts "turn is: #{game_state['turn']}"
    draw(game_state)

    position = player_input(game_state)
    game_state['board'] = update_board(game_state, position)
    draw(game_state)
  end

  def display_winner(game_state)
    puts game_state['winner'] == 2 ? 'Player 1 Wins!' : 'Player 2 Wins!'
  end
end


include Game



game_state = {
  'board' => [1, 2, 3, 4, 5, 6, 7, 8, 9],
  'turn' => 1,
  'winner' => nil,
  'player' => true
}

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

### FOR DEBUGGING

while game_state['turn'] <= 9 && game_state['winner'] == nil
  play_turn(game_state)
  game_state['winner'] = check_winner(game_state)
end

display_winner(game_state)

