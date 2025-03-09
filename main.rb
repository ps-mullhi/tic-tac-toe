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
  gets.chomp
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

  

end

main()





