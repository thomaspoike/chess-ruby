# frozen_string_literal: true

require 'lib/bishop.rb'
require 'lib/chessboard.rb'

describe Bishop do
  let(:bishop) { described_class.new([0, 0], 'white') }

  describe('#legal_move?') do
    it 'returns true if the move is legal' do
      expect(bishop.legal_move?([2, 2])).to eq(true)
    end
  end
end