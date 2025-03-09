require_relative 'lib/board.rb'
require_relative 'lib/player.rb'
require_relative 'lib/spot_value.rb'

def get_player_name()
  name = ''
  loop do
    print('Enter your name: ')
    name = gets.chomp
    print("Confirm your name is #{name}? (Y/N): ")
    confirmation = gets.chomp
    break if confirmation == 'Y'
  end
  puts("#{name} confirmed.")
  name
end

def clear_after_input_received(message)
  print(message)
  gets
  puts(`clear`)
end

def setup_players()
  player_one_name = get_player_name()
  clear_after_input_received('Press anything to setup next player...')
  player_two_name = get_player_name()
  clear_after_input_received('Press anything to finish setup...')

  player_one = Player.new(player_one_name, SpotValue::VALUE_X)
  player_two = Player.new(player_two_name, SpotValue::VALUE_O)

  return [player_one, player_two]
end

def main()
  players = setup_players()
  player_one = players[0]
  player_two = players[1]

  game_board = Board.new()
  active_player = player_one
  non_active_player = player_two

  loop do
    game_board.display_board()
    player_pick = 0
    loop do
      print("Where would you like to go #{active_player.name}? (1-9)")
      player_pick = gets.chomp.to_i
      break if player_pick.to_i.between?(1,9) && game_board.board_spots[player_pick.to_i-1].spot_value == SpotValue::VALUE_EMPTY
      puts('Invalid entry. (Spot occupied, or #1-9 not entered)')
    end

    game_board.board_spots[player_pick-1].spot_value = active_player.board_piece
    game_board.display_board()

    #Check for win condition or board full TODO

    clear_after_input_received('Game not over. Press anything to go to next player\'s move...')
    active_player, non_active_player = non_active_player, active_player
    
  end



end

main()





