require 'spec_helper'
require 'coords'

RSpec.describe Coords do
  describe '#move' do
    shared_examples 'moving one axis' do |axis:, steps:, exp_x:, exp_y:|
      context "moving on #{axis.to_s.upcase} axis" do
        subject(:coords) { described_class.new(0, 0) }

        axis_direction = steps.positive? ? 'positive' : 'negative'
        it "moves #{steps.abs} on #{axis.to_s.upcase} axis " \
          "in #{axis_direction} direction" do
          c = coords.move(axis, steps)
          expect(c.x).to eq(exp_x)
          expect(c.y).to eq(exp_y)
        end
      end
    end

    shared_examples 'moving both axis' do |axis1:, steps1:, axis2:, steps2:, exp_x:, exp_y:|
      context "moving on both axis" do
        subject(:coords) { described_class.new(0, 0) }

        it "moves #{steps1} on #{axis1.to_s.upcase} and #{steps2} on #{axis2.to_s.upcase}" do
          c = coords.move(axis1, steps1).move(axis2, steps2)
          expect(c.x).to eq(exp_x)
          expect(c.y).to eq(exp_y)
        end
      end
    end

    include_examples 'moving one axis', axis: :x, steps: 5, exp_x: 5, exp_y: 0
    include_examples 'moving one axis', axis: :x, steps: -10, exp_x: -10, exp_y: 0
    include_examples 'moving one axis', axis: :y, steps: 5, exp_x: 0, exp_y: 5
    include_examples 'moving one axis', axis: :y, steps: -10, exp_x: 0, exp_y: -10

    include_examples 'moving both axis', axis1: :x, steps1: 100, axis2: :y, steps2: 100, exp_x: 100, exp_y: 100
    include_examples 'moving both axis', axis1: :y, steps1: -10, axis2: :x, steps2: 5, exp_x: 5, exp_y: -10
  end

  describe '#distance_to' do
    shared_examples 'calc distance' do |from:, to:, exp_distance:|
      context "distance from (#{from.x}, #{from.y}) to (#{to.x}, #{to.y})" do
        subject(:coords) { from }

        it "returns #{exp_distance}" do
          expect(coords.distance_to(to)).to eq(exp_distance)
        end
      end
    end

    include_examples 'calc distance', from: Coords.new,
      to: Coords.new(100, 100), exp_distance: 200
    include_examples 'calc distance', from: Coords.new(-100, 0),
      to: Coords.new(0, 10), exp_distance: 110
    include_examples 'calc distance', from: Coords.new(-5, -5),
      to: Coords.new(5, 5), exp_distance: 20
  end

end
