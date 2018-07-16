require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/adagrams'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Adagrams' do
  describe 'score' do
    it 'has a running test' do
      true.must_equal true
    end
  end
end
