require 'spec_helper'
require 'map'

RSpec.describe Map do
  shared_examples 'applying moves' do |moves:, exp_x:, exp_y:|
    context "for #{moves}" do
      subject(:map) { described_class.new }

      before do
        moves.map { |raw_move| Move.new(raw_move) }.each do |move|
          map.apply(move)
        end
      end

      it 'moves to coords' do
        expect(map.coords.x).to eq(exp_x)
        expect(map.coords.y).to eq(exp_y)
      end
    end
  end

  include_examples 'applying moves', moves: ['R2', 'L3'], exp_x: 2, exp_y: 3
  include_examples 'applying moves', moves: ['R2', 'R2', 'R2'], exp_x: 0, exp_y: -2
  include_examples 'applying moves', moves: ['R5', 'L5', 'R5', 'R3'], exp_x: 10, exp_y: 2

  describe '#distance' do
    subject(:map) { described_class.new }

    before { map.go }

    it 'walks through the path' do
      expect(map.distance).to eq(231)
    end
  end

  describe '#first_crossing' do
    subject(:map) { described_class.new }

    before { map.go }

    it 'finds distance to first crossing' do
      expect(map.first_crossing).to eq(147)
    end
  end
end
