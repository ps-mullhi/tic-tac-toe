require_relative './board_spot.rb'
require_relative './spot_value.rb'

class Board
  attr_accessor :board_spots
  WINNING_COMBOS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize()
    @board_spots = Array.new(9){BoardSpot.new(SpotValue::VALUE_EMPTY)}
  end

  def display_board()
    9.times do |i|
      puts() if i % 3 == 0
      
      if board_spots[i].spot_value == SpotValue::VALUE_X
        print 'X'
      elsif board_spots[i].spot_value == SpotValue::VALUE_O
        print 'O'
      elsif board_spots[i].spot_value == SpotValue::VALUE_EMPTY
        print '_'
      else
        print 'YOU SHOULD NOT SEE THIS'
      end

    end

    puts()
  end

  def winner?()
    WINNING_COMBOS.any? do |combo|
      a,b,c = combo
      board_spots[a].spot_value == board_spots[b].spot_value &&
      board_spots[b].spot_value == board_spots[c].spot_value &&
      board_spots[a].spot_value != SpotValue::VALUE_EMPTY
    end
  end

  def board_full?()
    board_spots.all? do |spot|
      spot.spot_value != SpotValue::VALUE_EMPTY
    end
  end
end