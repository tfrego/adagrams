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

  describe 'score_word method' do
    it 'returns an accurate numerical score according to the score chart' do
      score_word("DOG").must_equal 5
      score_word("WHIMSY").must_equal 17
      score_word("TURMERIC").must_equal 12
    end

    it 'returns a score regardless of input case' do
      score_word("dog").must_equal 5
      score_word("wHiMsY").must_equal 17
      score_word("Turmeric").must_equal 12
    end

    it 'returns a score of 0 if given an empty input' do
      score_word("").must_equal 0
    end

    it 'returns an error if part of the input is a non-letter non-english character' do
      proc {
        score_word("invalid whitespace input")
      }.must_raise ArgumentError

      proc {
        score_word("num3r1c1npu7")
      }.must_raise ArgumentError

      proc {
        score_word("punctuated_input")
      }.must_raise ArgumentError
    end
  end
end
