require_relative '../main.rb'

# frozen_string_literal: true

RSpec.describe do
  describe "#get_player_name" do
    context 'when given terminating confirmation message on first try' do 
      before do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Mike', 'Y')
        allow_any_instance_of(Kernel).to receive(:print) 
        allow_any_instance_of(Kernel).to receive(:puts)
      end
      
      it 'the loop stops' do
        expect(get_player_name).to eq('Mike')
      end
    end

    context 'when failing confirmation twice, then confirming correctly on third try' do 
      before do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Mike', 'N', 'Tun', 'dfasdf', 'Joe', 'Y')
        allow_any_instance_of(Kernel).to receive(:print) 
        allow_any_instance_of(Kernel).to receive(:puts)
      end
      
      it 'the loop stops' do
        expect(get_player_name).to eq('Joe')
      end
    end
  end

  describe '#setup_players' do
    context 'when valid inputs are given' do
      before do 
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Sarah', 'Y', '', 'Mason', 'Y', '')
      end

      it 'returns the two setup players' do
        players = setup_players
        expect(players[0].name).to eql('Sarah')
        expect(players[1].name).to eql('Mason')
      end
    end
  end
end
