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
  game_board = Board.new()

  player_one, player_two = setup_players()
  active_player, non_active_player = player_one, player_two
  has_someone_won = false
  board_full = false

  loop do
    game_board.display_board()
    player_pick = 0

    loop do
      print("Where would you like to go #{active_player.name}? (#1-9) : ")
      player_pick = gets.chomp.to_i
      break if player_pick.to_i.between?(1,9) && game_board.board_spots[player_pick.to_i-1].spot_value == SpotValue::VALUE_EMPTY

      puts('Invalid entry. (Spot occupied, or #1-9 not entered)')
    end

    game_board.board_spots[player_pick-1].spot_value = active_player.board_piece
    game_board.display_board()

    has_someone_won = game_board.winner?()
    board_full = game_board.board_full?()
    break if has_someone_won || board_full

    clear_after_input_received('Game not over. Press anything to go to next player\'s move...')
    active_player, non_active_player = non_active_player, active_player
  end

  puts(`clear`)
  print('Game over! ')
  puts("#{active_player.name} wins!") if has_someone_won
  puts("Draw.") if board_full && (has_someone_won == false)
  game_board.display_board()
end

# main()





