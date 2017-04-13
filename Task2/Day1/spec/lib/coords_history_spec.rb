require 'spec_helper'
require 'coords_history'

RSpec.describe CoordsHistory do
  subject(:coords_history) { described_class.new }

  context 'adding and viewing history elements' do
    context 'adding coords (5, 10)' do
      it 'contains (5, 10) as a last element' do
        c = Coords.new(5, 10)
        expect(coords_history.add(c).history.last).to eq(c)
      end
    end

    context 'consecutive adding' do
      it 'contains all added elements' do
        c1 = Coords.new(1, 1)
        c2 = Coords.new(5, 10)
        h = coords_history.add(c1).add(c2).history
        expect(h.include?(c1)).to eq(true)
        expect(h.include?(c2)).to eq(true)
        expect(h.index(c2) - h.index(c1)).to eq(1)
      end
    end
  end

  context 'finding crossings' do
    subject(:coords_history) do
      CoordsHistory.new(Coords.new(0, 0))
        .add(Coords.new(1, 1))
        .add(Coords.new(0, 0))
        .add(Coords.new(2, 2))
        .add(Coords.new(1, 1))
    end

    it 'finds all crossings' do
      c = coords_history.crossings
      expect(c.length).to eq(2)
      expect(c.has_key?(Coords.new(1, 1))).to eq(true)
      expect(c.has_key?(Coords.new(0, 0))).to eq(true)
      expect(c.has_key?(Coords.new(2, 2))).to eq(false)
    end

    it 'finds first crossing' do
      first = coords_history.first_crossing
      expect(first).to eq(Coords.new(0, 0))
    end
  end 
end
