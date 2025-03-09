require_relative './board_spot.rb'
require_relative './spot_value.rb'

class Board
  attr_accessor :board_spots

  def initialize()
    @board_spots = Array.new(9, BoardSpot.new(SpotValue::VALUE_EMPTY))
  end
end