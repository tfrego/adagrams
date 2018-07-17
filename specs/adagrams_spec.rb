require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/adagrams'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Adagrams' do
  describe 'draw_letters method' do
    it 'draws ten letters from the letter pool' do
      drawn_letters = draw_letters
      drawn_letters.size.must_equal 10
    end

    it 'returns an array, and each item is a single-letter string' do
      drawn_letters = draw_letters
      drawn_letters.size.must_equal 10

      drawn_letters.must_be_instance_of Array
      drawn_letters.each do |letter|
        letter.must_be_instance_of String
        letter.length.must_equal 1
      end
    end
  end
end
