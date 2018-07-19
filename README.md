# Adagrams

## At a Glance
- Pair, [stage 2](https://github.com/Ada-Developers-Academy/pedagogy/blob/master/rule-of-three.md#stage-2) project
- Due before class, **DATE HERE**

## Introduction

An [anagram](https://en.wikipedia.org/wiki/Anagram) is a word or phrase formed by rearranging the letters of a different word or phrase. _Adagrams_ is a fictional game in which a player is given a random set of letters and must make an anagram using those letters. _Adagrams_ has a specific scoring system, so that the player's submitted anagram scores points. The rules for Adagrams are roughly inspired by the "Letter Round" portion of the British game show [Countdown](https://en.wikipedia.org/wiki/Countdown_%28game_show%29%23Letters_round).

While working on _Adagrams_, it may help to think of a physical metaphor for this game, such as other common word games like _Scrabble_ or _Bananagrams_. These analog games all feature a _pile_ of letter _tiles_ that the player _draws_ from.

![an image of a pile of letter tiles](assets/letter-tiles.jpg)

## Learning Goals

- Write Ruby code with methods that store data, read data, and manipulate data
- Write Ruby code that takes in user input
- Use pair-programming techniques
- Instill the habit of running unit tests to verify that the program works as expected

## Objective

We will make a Ruby implementation of _Adagrams_ that runs [in the command line](https://en.wikipedia.org/wiki/Command-line_interface). The player will run this program. The program should give some output, wait for user interaction, and calculate output afterwards.

The program should also pass the provided unit tests.

## Getting Started

* From the project root, you are able to execute all of your specs by running `rake` in Terminal

<details>
<summary>For the curious about `rake`, click here</summary>
`rake` [(official site)](https://github.com/ruby/rake) is a program that runs tasks that we define. In this case, we have a pre-defined task that executes the tests. By running `rake`, we are saying something like, "Please run the tasks, which includes the task that executes the tests."
</details>

### Tests
We have provided unit tests for you to run. A complete project will pass all 16 provided tests.

To run the tests, in the command line, navigate to the project root and then run the command `$ rake` (without the `$`. Remember, `$` indicates that it is a command line command.)

When you first open the project and run the tests with `rake`, you should have 0 passing tests and 16 failures. You should see something similar to the following screenshots:

![failing tests error stack trace that reads "no method defined"](assets/failing-tests-error.png)
![failing tests error reading "16 failures"](assets/failing-tests-screenshot.png)

What do these errors mean? These errors should help guide you with the next step to completing the project.

The tests for this project are written in [minitest](https://github.com/seattlerb/minitest), a testing framework by Seattle Ruby Brigade.

Do not move onto a new wave of requirements until the minimum requirements of the previous wave are complete and your specs are green across the board.

### Pair Programming
Utilize good pair programming practices. Refer to articles from the [Agile Alliance](http://guide.agilealliance.org/guide/pairing.html), the [Agile Institute](http://powersoftwo.agileinstitute.com/2015/02/benefits-of-pair-programming-revisited.html), and [our own suggestions for pairing](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/00-programming-fundamentals/programming-techniques-pairs-or-solo.md#pair-programming) if you need a refresher for some best practices. Switch _driver_ and _navigator_ roles often. When there is uncertainty or confusion, step away from the keyboard and discuss, plan, and document on paper or whiteboard before continuing.

### Driver Code
We have provided some driver code for your Adagrams game in the files `wave-1-game.rb`, `wave-2-game.rb`, and `wave-3-game.rb`. Running `$ ruby wave-1-game.rb` will begin a command-line game that uses your Scrabble code. The boilerplate code will break the first time you run it: working through the waves specified below should create a running version of the game. **Implementing code to make this game run is not a substitute for making the tests pass**. It is simply there for you and your pair to reference how the Game may run during each wave, to have better perspective of what your program can do, and to get some practice reading other peoples' code. We fully expect you to create the specified methods to specification and making the tests pass.

## Baseline
### Setup
1. You'll be working with an assigned pair. High-five your pair.
1. Choose **one person** to fork the project repo.
1. Add the other person in the pair (who didn't fork) to the forked repo as a _collaborator_. Instructions [here](https://help.github.com/articles/inviting-collaborators-to-a-personal-repository/).
1. Both individuals will clone the forked repo: `$ git clone [YOUR FORKED REPO URL]`
1. Both individuals `cd` into the dir created.

### Requirements
#### Pair Plan
First, come up with a "plan of action" for how you want to work as a pair. Discuss your learning style, how you prefer to receive feedback, and one team communication skill you want to improve with this experience. Then, review the requirements for Wave 1 and come up with a "plan of action" for your implementation.

#### Implementation
- Read through the file `lib/scoring.rb`. Inside this file, you should find:
    - A `Scrabble` module
    - A `Scrabble::Scoring` **class**
- Add some sort of data structure to `Scrabble::Scoring` to store the **individual letter scores** listed below
- Read through the spec file `specs/scoring_spec.rb`, which corresponds to your `Scrabble::Scoring` class. This file has some tests pre-written and some test stubs that you will need to fill in.
- Be able to execute the tests using `rake` from the project root.

#### Score chart
|Letter                        | Value|
|:----------------------------:|:----:|
|A, E, I, O, U, L, N, R, S, T  |   1  |
|D, G                          |   2  |
|B, C, M, P                    |   3  |
|F, H, V, W, Y                 |   4  |
|K                             |   5  |
|J, X                          |   8  |
|Q, Z                          |   10 |

## Wave 1
### Primary Requirements
For wave 1 you are given some scaffolding: tests and test stubs in `specs/scoring_spec.rb`, and method stubs in `lib/scoring.rb`.

Complete the `Scrabble::Scoring` class with __full unit testing/specs__. All provided tests should pass, and all stubbed tests should be fully implemented (and pass). The class should have the following **class methods**:

- `self.score(word)`: returns the total score for the given word. The word is input as a string (case insensitive). The chart in the baseline requirements shows the point value for a given letter.
    - A seven letter word means that a player used all the tiles. Seven letter words receive a __50__ point bonus.
    - Tests for `Scoring.score` are _already written_. Your job is to write code to make them pass.
- `self.highest_score_from(array_of_words)`: returns **the word in the array with the highest score**. In the case of tie, use these tie-breaking rules:
    - It’s better to use fewer tiles, in the case of a tie, prefer the word with the fewest letters.
    - There is a bonus for words that are seven letters. If the top score is tied between multiple words and one used all seven letters, choose the one with seven letters over the one with fewer tiles.
    - If the there are multiple words that are the same score and same length, pick the first one in the supplied list.
    - Tests for this logic are _stubbed_, meaning the test has a name but no code written. You will have to implement them as you work on this method.
    - Ensure that `self.highest_score_from(array_of_words)` works correctly regardless of the order of the words. Write a test for this case

## Wave 2
### Primary Requirements
For waves 2 and 3, you are given no starter code. You and your pair will have to create all files and classes and write all the tests yourselves.

Create a `Scrabble::Player` class with __full unit testing/specs__. You should have a spec that tests all pieces of functionality and logic.

The constructor for `Scrabble::Player` should take exactly one argument: the player's `name`. Instances of the class should respond to the following messages:

- `#name`: returns the value of the `@name` instance variable
- `#plays`: returns an Array of the words played by the player
- `#play(word)`: Adds the input word to the `plays` Array
    - Returns `false` if player has already won
    - Otherwise returns the score of the `word`
- `#total_score`: Returns the sum of scores of played words
- `#won?`: If the player has over 100 points, returns `true`, otherwise returns `false`
- `#highest_scoring_word`: Returns the highest scoring played word
- `#highest_word_score`: Returns the `highest_scoring_word` score

For example,

```ruby
player = Scrabble::Player.new("Ada")
player.name           # => "Ada"
player.play('cat')    # => 5
player.play('lizard') # => 16
puts player.highest_scoring_word
# prints out "lizard"
```

## Wave 3
### Primary Requirements
#### `TileBag`
Create a `Scrabble::TileBag` class with __full unit testing/specs__. You should have a spec that tests all pieces of functionality and logic. It should have the following class and instance methods:

- `#initialize` Should set up the instance with a collection of all default tiles
- `#draw_tiles(num)` returns a collection of random tiles, removes the tiles from the default set
- `#tiles_remaining` returns the number of tiles remaining in the bag

##### Initial Distribution of Letters
| Letter : Qty. | Letter : Qty. |
|:------:|:-----:|
| A : 9  | N : 6 |
| B : 2  | O : 8 |
| C : 2  | P : 2 |
| D : 4  | Q : 1 |
| E : 12 | R : 6 |
| F : 2  | S : 4 |
| G : 3  | T : 6 |
| H : 2  | U : 4 |
| I : 9  | V : 2 |
| J : 1  | W : 2 |
| K : 1  | X : 1 |
| L : 4  | Y : 2 |
| M : 2  | Z : 1 |

#### Modifications to `Player`
Create specs for and add to the `Player` class the following instance methods:

- `#tiles` a collection of letters that the player can play (max 7)
- `#draw_tiles(tile_bag)` fills tiles array until it has 7 letters from the given tile bag
    - It is not in the primary requirements to modify the existing `#play(word)` to use `#tiles` or check against the player's tiles

### Optional Enhancements
These need to be tested too!
- Modify in `Player` the `#play(word)` method to only allow the player to play words using letters that the player has tiles for.
- Create a `Scrabble::Dictionary` class that includes a method (class or instance) for searching a list of words to determine if a given word is valid (__must have tests__).
- Create a `Scrabble::Board` class (__must have tests__) that has a matrix (array of arrays) of tile places. Check if a word can be played on a given tile place in a certain direction (up/down or left/right).

## What Instructors Are Looking For
Check out the [feedback template](feedback.md) which lists the items instructors will be looking for as they evaluate your project.
