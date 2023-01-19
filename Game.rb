module Game
  # Defines every method as instance methods of the module
  class << self

    # Draws the current board
    def draw(game_state)
      puts <<-TEXT
      +---------------+
      || #{game_state['board'][0]} || #{game_state['board'][1]} || #{game_state['board'][2]} ||
      || #{game_state['board'][3]} || #{game_state['board'][4]} || #{game_state['board'][5]} ||
      || #{game_state['board'][6]} || #{game_state['board'][7]} || #{game_state['board'][8]} ||
      +---------------+
      TEXT
    end

    # Accepts player for input
    def player_input(game_state)
      puts "Player #{game_state['player'] ? 1 : 2}: Select position to take"
      gets.to_i
    end

    # Updates board using input, and increments turn if successful
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

    # Checks for winning combinations
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
    
    # Plays a full turn of tic tac toe
    def play_turn(game_state)
      puts "turn is: #{game_state['turn']}"
      draw(game_state)
      position = player_input(game_state)
      game_state['board'] = update_board(game_state, position)
      draw(game_state)
    end

    # Displays game over message
    def display_winner(game_state)
      case game_state['winner']
      when 1
        puts "Player 2 Wins!"
      when 2
        puts "Player 1 Wins!"
      else
        puts "Tie!"
      end
    end

  end
end