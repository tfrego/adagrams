

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

  # create hash of input letter quantities for word and hand
  word = input.chars.inject(Hash.new(0)) { |total, letter| total[letter] += 1 ;total}
  hand = letters_in_hand.inject(Hash.new(0)) { |total, letter| total[letter] += 1 ;total}
  puts "here's our hand #{hand}"
  # check if letter is in letters_in_hand with right quantities
  word.each do |word_letter, word_quantitiy|
    # For each letter, select hash in hand
    match = hand.select { |hand_letter, hand_quantity| word_letter == hand_letter }
    # If there's no match, what do we do? Empty is true
    if match.empty?
      return false
    end
    # If there is a match, is the quantity in the word more than the quantity in the hand?
    puts "MATCH #{match}, Class #{match.class} Empty #{match.empty?}"
  end
    # 2) create

    # 3) compare to letters in hand





    # if total count of letter < total count of letter in letters_in_hand
      # => True


    # True if EVERY letter in input is available

    # False if not (letter not present in letters in hand or has too many of that letter)

end

puts "Please enter your anagram: "
word = gets.chomp.upcase

 uses_available_letters?(word, draw_letters)
