

letter_pool = {
  :A => 9,
  :B => 2,
  :C => 2,
  :D => 4,
  :E => 12,
  :F => 2,
  :G => 3,
  :H => 2,
  :I => 9,
  :J => 1,
  :K => 1,
  :L => 4,
  :M => 2,
  :N => 6,
  :O => 8,
  :P => 2,
  :Q => 1,
  :R => 6,
  :S => 4,
  :T => 6,
  :U => 4,
  :V => 2,
  :W => 2,
  :X => 1,
  :Y => 2,
  :Z => 1
}

# Method to draw letters and return an array of 10 strings
def draw_letters
  # Empty array to hold drawn letters
  drawn_letters = []
  # Array of all the letters available to be drawn from pool
  available_letters = %w(A A A A A A A A A B B C C D D D D E E E E E E E E E E E E
  F F G G G H H I I I I I I I I I J K L L L L M M N N N N N N O O O O O O O O P P
  Q R R R R R R S S S S T T T T T T U U U U V V W W X Y Y Z)
  # randomly draw letter from pool
  10.times do
    letter = available_letters.sample
    # push random letter
    drawn_letters << letter
    # delete drawn letter from available_letters array
    available_letters.delete_at(available_letters.index(letter))
  end
  return drawn_letters
end

draw_letters

def uses_available_letters?(input, letters_in_hand)
input.upcase!
letter_results = []
  # check if letter is in letters_in_hand with right quantities
  input.chars.each do |letter|
    if input.count(letter) > letters_in_hand.count(letter)
      letter_results << false
    else
      letter_results << true
    end
  end
  return letter_results.all?(true)
end


def score_word(word)
  score = 0
  word.upcase!

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

  if word.chars.length.between?(7,10)
    score += 8
  end

  return score
end

# method to find highest scoring word
def highest_score_from_words(words)
  word_scores = words.map do |word|
    {:word => word, :score => score_word(word)}
  end

  # Determine the winning score
    # word_score array - find top score
    top_score = word_scores.max_by{ |k| k[:score] } [:score]
    puts "Top Score : #{top_score}"
  # Select hashes in word_scores that have winning score
    potential_winners = word_scores.select { |h| h[:score] == top_score }

    puts "Potential winners with top score: #{potential_winners}"
  # Checking length of potential winners array
  if potential_winners.length > 1
    # If greater than one, there's a tie
    puts "TIE!"
    potential_winners.each do |potential_winner|
      # Adding word lengths to potential winners
      potential_winner[:word_length] = potential_winner[:word].length
    end

    puts "POTENTIAL WINNERS #{potential_winners}"
    # Select if length is 10, return first as winner
    length_of_10 = potential_winners.select { |h| h[:word_length] == 10 }
    if length_of_10.length > 0
      winner = { :word => length_of_10[0][:word], :score => length_of_10[0][:score]}
    end
    puts "Winner: #{winner}"

    # One 10 - winner

    # More than one 10 - pick the first one

    # No tens, pick fewest letters

    # If all the same length pick the first one

  else
    # If there's just one word, return that hash
    return potential_winners[0]
  end

    # One word is 10 letters

  # IF same length, RETURN first word

# Return a single hash with winning word and score

end

highest_score_from_words(["hi", "aeiou","dg", "aaaaaaaaaa", "eeeeeeeeee"])
