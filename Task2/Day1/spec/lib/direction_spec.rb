require 'spec_helper'
require 'direction'

RSpec.describe Direction do
  context 'direction turns' do
    shared_examples 'direction turns' do |from:, to:, turn:|
      context "for #{from}" do
        subject(:direction) { from }

        it "turns #{turn} from #{from} to #{to}" do
          expect(direction.send(turn)).to eq(to)
        end
      end
    end

    include_examples 'direction turns', from: East, to: North, turn: :left
    include_examples 'direction turns', from: East, to: South, turn: :right

    include_examples 'direction turns', from: North, to: West, turn: :left
    include_examples 'direction turns', from: North, to: East, turn: :right

    include_examples 'direction turns', from: South, to: East, turn: :left
    include_examples 'direction turns', from: South, to: West, turn: :right

    include_examples 'direction turns', from: West, to: South, turn: :left
    include_examples 'direction turns', from: West, to: North, turn: :right
  end

  context 'direction coefficients' do
    shared_examples 'direction coeffs' do |dir:, axis:, value:|
      context "for #{dir}" do
        subject(:direction) { dir }

        axis_direction = value.positive? ? 'positive' : 'negative'
        it "moves #{value.abs} step(s) on #{axis.to_s.upcase} axis in " \
          "#{axis_direction} direction" do
          expect(direction.coeff.axis).to eq(axis)
          expect(direction.coeff.value).to eq(value)
        end
      end
    end

    include_examples 'direction coeffs', dir: North, axis: :y, value: 1
    include_examples 'direction coeffs', dir: East, axis: :x, value: 1
    include_examples 'direction coeffs', dir: South, axis: :y, value: -1
    include_examples 'direction coeffs', dir: West, axis: :x, value: -1
  end
end
