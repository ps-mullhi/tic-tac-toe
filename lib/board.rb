require_relative './board_spot.rb'
require_relative './spot_value.rb'

class Board
  attr_accessor :board_spots

  def initialize()
    @board_spots = Array.new(9, BoardSpot.new(SpotValue::VALUE_EMPTY))
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
end