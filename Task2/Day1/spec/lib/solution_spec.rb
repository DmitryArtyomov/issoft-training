require 'spec_helper'

RSpec.describe Solution do
  subject(:solution) { described_class.new }

  describe '#path_distance' do
    context 'given nil path' do
      it 'returns 0' do
        expect(solution.path_distance(nil)).to eq(0)
      end
    end

    context 'given empty path' do
      it 'returns 0' do
        expect(solution.path_distance('')).to eq(0)
      end
    end

    context 'valid path' do
      context 'given "R2, L3"' do
        it 'returns 5' do
          expect(solution.path_distance('R2, L3')).to eq(5)
        end
      end

      context 'given "R2, R2, R2"' do
        it 'returns 2' do
          expect(solution.path_distance('R2, R2, R2')).to eq(2)
        end
      end

      context 'given "R5, L5, R5, R3"' do
        it 'returns 12' do
          expect(solution.path_distance('R5, L5, R5, R3')).to eq(12)
        end
      end
    end
  end

  describe '#twice_visited_distance' do
    context 'given nil path' do
      it 'returns nil' do
        expect(solution.twice_visited_distance(nil)).to eq(nil)
      end
    end

    context 'given empty path' do
      it 'returns nil' do
        expect(solution.twice_visited_distance('')).to eq(nil)
      end
    end

    context 'valid path' do
      context 'given "R8, R4, R4, R8"' do
        it 'returns 4' do
          expect(solution.twice_visited_distance('R8, R4, R4, R8')).to eq(4)
        end
      end

      context 'given "L4, R2, R3, R10"' do
        it 'returns 1' do
          expect(solution.twice_visited_distance('L4, R2, R3, R10')).to eq(1)
        end
      end      
    end
  end
end
