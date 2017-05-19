require 'spec_helper'
require 'move'

RSpec.describe Move do
  shared_examples 'parses move' do |raw_move:, turn:, distance:|
    context "for #{raw_move}" do
      subject(:move) { described_class.new(raw_move) }

      it 'sets turn' do
        expect(move.turn).to eq(turn)
      end

      it 'sets distance' do
        expect(move.distance).to eq(distance)
      end
    end
  end

  include_examples 'parses move', raw_move: 'R7', turn: :right, distance: 7
  include_examples 'parses move', raw_move: 'L15', turn: :left, distance: 15
end
