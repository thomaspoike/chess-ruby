# frozen_string_literal: true

require_relative '../lib/bishop'
# require 'lib/chessboard'

describe Bishop do
  let(:bishop) { described_class.new([0, 0], 'white') }

  describe('#legal_move?') do
    it 'returns true if the move is legal' do
      expect(bishop.legal_move?([2, 2])).to eq(true)
    end
    it 'false if the move is not legal' do
      expect(bishop.legal_move?([2, 3])).to eq(false)
    end
  end

  describe '#move' do
    it 'moves the bishop to the new position' do
      bishop.move([2, 2])
      expect(bishop.position).to eq([2, 2])
    end
    it 'does not move the bishop if the move is not legal' do
      bishop.move([2, 3])
      expect(bishop.position).to eq([0, 0])
    end
  end

  describe '#initialize' do
    it 'sets the position' do
      expect(bishop.position).to eq([0, 0])
    end
    it 'sets the color' do
      expect(bishop.color).to eq('white')
    end
  end
end
