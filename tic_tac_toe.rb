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
  def draw(multi_array)
    puts '---------------'
    for i in 0...multi_array.length do
      puts "| #{multi_array[i][0]} || #{multi_array[i][1]} || #{multi_array[i][2]} |"
    end
    puts '---------------'
  end

  def player_input(game_state)
    puts "Player #{game_state['player']}: Select position to take"
    gets.to_i
  end

  def update(game_state, input)
    game_state['board'].map! do |row|
      row.map! do |position|
        if position == input
          'X'
        else
          position
        end
      end
    end
  end


  def play_turn(game_state)
    draw(game_state['board'])
    position = player_input(game_state)
    game_state['board'] = update(game_state, position)
    game_state['turn'] += 1
  end
end

include Game



game_state = {
  'board' => [[1, 2, 3], [4, 5, 6], [7, 8, 9]],
  'turn' => 1,
  'winner' => '',
  'player' => 1
}

play_turn(game_state)
draw(game_state['board'])