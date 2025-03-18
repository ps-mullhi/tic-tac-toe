require_relative '../lib/board.rb'

describe Board do
  describe '#winner?' do
    subject(:board) {described_class.new}  

    context 'when someone has won' do
      it 'using top row' do
        board.board_spots[0].spot_value = 1
        board.board_spots[1].spot_value = 1
        board.board_spots[2].spot_value = 1
        expect(board).to be_winner
      end

      it 'using middle row' do
        board.board_spots[3].spot_value = 1
        board.board_spots[4].spot_value = 1
        board.board_spots[5].spot_value = 1
        expect(board).to be_winner
      end

      it 'using bottom row' do
        board.board_spots[6].spot_value = 0
        board.board_spots[7].spot_value = 0
        board.board_spots[8].spot_value = 0
        expect(board).to be_winner
      end

      it 'using first column' do
        board.board_spots[0].spot_value = 1
        board.board_spots[3].spot_value = 1
        board.board_spots[6].spot_value = 1
        expect(board).to be_winner
      end

      it 'using second column' do
        board.board_spots[1].spot_value = 0
        board.board_spots[4].spot_value = 0
        board.board_spots[7].spot_value = 0
        expect(board).to be_winner
      end

      it 'using bottom row' do
        board.board_spots[2].spot_value = 0
        board.board_spots[5].spot_value = 0
        board.board_spots[8].spot_value = 0
        expect(board).to be_winner
      end

      it 'using top-to-bottom diagonal' do
        board.board_spots[0].spot_value = 0
        board.board_spots[4].spot_value = 0
        board.board_spots[8].spot_value = 0
        expect(board).to be_winner
      end

      it 'using bottom-to-top diagonal' do
        board.board_spots[2].spot_value = 1
        board.board_spots[4].spot_value = 1
        board.board_spots[6].spot_value = 1
        expect(board).to be_winner
      end
    end

    context 'when someone has not won' do
      it 'with empty board' do
        expect(board).not_to be_winner
      end

      it 'with partial board' do 
        board.board_spots[0].spot_value = 1
        board.board_spots[1].spot_value = 0
        board.board_spots[2].spot_value = 1
        expect(board).not_to be_winner
      end
      
      it 'with full board' do
        board.board_spots[0].spot_value = 1
        board.board_spots[1].spot_value = 0
        board.board_spots[2].spot_value = 1
        board.board_spots[3].spot_value = 0
        board.board_spots[4].spot_value = 0
        board.board_spots[5].spot_value = 1
        board.board_spots[6].spot_value = 1
        board.board_spots[7].spot_value = 1
        board.board_spots[8].spot_value = 0
        expect(board).not_to be_winner
      end
    end
  end

  describe '#board_full?' do
    subject(:board) {described_class.new}  

    context 'when board is not full' do
      it 'should return false' do
        board.board_spots[0].spot_value = 1
        board.board_spots[1].spot_value = 0
        expect(board).not_to be_board_full
      end
    end

    context 'when board is full' do
      it 'should return true' do
        board.board_spots[0].spot_value = 1
        board.board_spots[1].spot_value = 0
        board.board_spots[2].spot_value = 1
        board.board_spots[3].spot_value = 0
        board.board_spots[4].spot_value = 0
        board.board_spots[5].spot_value = 1
        board.board_spots[6].spot_value = 1
        board.board_spots[7].spot_value = 1
        board.board_spots[8].spot_value = 0
        expect(board).to be_board_full
      end
    end
  end
end