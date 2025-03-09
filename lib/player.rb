class Player
  attr_reader :name, :board_piece

  def initialize(name, board_piece)
    @name = name
    @board_piece = board_piece
  end

end