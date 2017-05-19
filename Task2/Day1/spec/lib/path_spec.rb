require 'spec_helper'
require 'path'

RSpec.describe Path do
  describe 'parsing moves' do
    file = File.expand_path('../fixtures/input.txt', File.dirname(__FILE__))  
    exp_output = ['R2', 'L3', 'R10', 'L100', 'R5', 'R3'].map do |e|
      Move.new(e)
    end

    subject(:path) { described_class.new(file) }

    it 'should parse file' do
      moves = path.moves
      exp_output.each.with_index do |e, i|
        expect(moves[i].turn).to eq(e.turn)
        expect(moves[i].distance).to eq(e.distance)
      end
    end
  end
end
