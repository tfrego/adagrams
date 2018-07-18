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

  describe 'uses_available_letters? method' do

    it 'returns true if the submitted letters are valid against the drawn letters' do
      drawn_letters = ['D', 'O', 'G', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
      test_word = 'DOG'

      is_valid = uses_available_letters? test_word, drawn_letters

      is_valid.must_equal true
    end

    it 'returns false word contains letters not in the drawn letters' do
      drawn_letters = ['D', 'O', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
      test_word = 'DOG'

      is_valid = uses_available_letters? test_word, drawn_letters

      is_valid.must_equal false
    end

    it 'returns false word contains repeated letters more than in the drawn letters' do
      drawn_letters = ['A', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
      test_word = 'AAA'

      is_valid = uses_available_letters? test_word, drawn_letters

      is_valid.must_equal false
    end

  end

  describe 'is_alpha? method' do

    it 'returns an error if part of the input is a non-letter non-english character' do
      is_alpha?("invalid whitespace input").must_equal false

      is_alpha?("num3r1c1npu7").must_equal false

      is_alpha?("punctuated_input").must_equal false
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
  end


end
