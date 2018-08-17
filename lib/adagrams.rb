
require 'awesome_print'
require 'csv'

# Draws letters and returns an array of 10 strings
def draw_letters
  # Empty array to hold drawn letters
  drawn_letters = []
  # Array of all the letters available to be drawn
  available_letters = %w(A A A A A A A A A B B C C D D D D E E E E E E E E E E E E
  F F G G G H H I I I I I I I I I J K L L L L M M N N N N N N O O O O O O O O P P
  Q R R R R R R S S S S T T T T T T U U U U V V W W X Y Y Z)
  # Randomly draw letter
  10.times do
    # Assign random letter
    letter = available_letters.sample
    # Push random letter
    drawn_letters << letter
    # Delete drawn letter from available_letters
    available_letters.delete_at(available_letters.index(letter))
  end
  return drawn_letters
end

# Validates input against letters_in_hand
def uses_available_letters?(input, letters_in_hand)
  # Capitalizing input
  input.upcase!
  # Empty array to hold results
  letter_results = []
  # Validating quantitiy
  input.chars.each do |letter|
    if input.count(letter) > letters_in_hand.count(letter)
      letter_results << false
    else
      letter_results << true
    end
  end
  # Returns true if input quantity is valid
  return letter_results.all?(true)
end

# Scores word
def score_word(word)
  # Starting score at 0
  score = 0
  # Capitalizing word
  word.upcase!

  # Updating score based on letter
  word.chars.each do |letter|
    case letter
    when 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'
      score += 1
    when 'D', 'G'
      score += 2
    when 'B', 'C', 'M', 'P'
      score += 3
    when 'F', 'H', 'V', 'W', 'Y'
      score += 4
    when 'K'
      score += 5
    when 'J', 'X'
      score += 8
    when 'Q', 'Z'
      score += 10
    end
  end
  # Adding bonus points based on word length
  score += 8 if word.chars.length.between?(7,10)
  return score
end

# Returning winning word/score
def highest_score_from(words)
  # Makes an array of words and associated score
  word_scores = words.map { |word| {:word => word, :score => score_word(word)} }

  # Assignign the top score value
  top_score = word_scores.max_by{ |k| k[:score] } [:score]

  # Selecting hashes in word_scores that have winning score
  potential_winners = word_scores.select { |h| h[:score] == top_score }

  # Checking length of potential winners array
  if potential_winners.length > 1

    # If greater than one, there's a tie
    potential_winners.each do |potential_winner|
      # Adding word lengths to potential winner hash
      potential_winner[:word_length] = potential_winner[:word].length
    end

    # Creating an array if word length is 10
    length_of_10 = potential_winners.select { |h| h[:word_length] == 10 }

    # Checking if length_of_10 is not empty
    if length_of_10.length > 0
      # Returning first word/score in the length_of_10 array
      return { :word => length_of_10[0][:word], :score => length_of_10[0][:score]}
    else
      # Returning first word/score and rejecting word_length key/value pair
      return potential_winners.min_by { |potential_winner| potential_winner[:word_length]}\
      .reject! { |k| k == :word_length
       }
    end
  else
    # Returning the value of potential_winners if there is no tie
    return potential_winners[0]
  end
end

# Verify if word exists in English dictionary
def is_in_english_dict?(input)
  # return array of dictionary words
  dictionary = CSV.read('assets/dictionary-english.csv')
  ap dictionary
  # check if input is in dictionary

end

is_in_english_dict?('word')
