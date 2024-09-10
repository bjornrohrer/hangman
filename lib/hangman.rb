# frozen_string_literal: true

class Hangman # rubocop:disable Style/Documentation
  MAX_GUESSES = 10

  def initialize
    @guessed_letters = []
    @remaining_guesses = MAX_GUESSES
    @word_progress = []
  end

  def random_word
    words = File.readlines('google-10000-english-no-swears.txt').map(&:strip)
    @valid_words = words.select { |word| (5..12).include?(word.length) }
    @random_word = @valid_words.sample
    @word_progress = Array.new(@random_word.length, '_')
    puts "The word is #{@random_word.length} letters long"
    @random_word
  end

  def user_letter # rubocop:disable Metrics/MethodLength
    puts 'Guess a letter'
    letter = gets.chomp.downcase
    if @guessed_letters.include?(letter)
      puts 'You have already guessed that letter, Try again.'
    else
      @guessed_letters << letter
      if @random_word.include?(letter)
        puts "Correct! '#{letter}' is in the word."
        update_word_progress(letter)
      else
        @remaining_guesses -= 1
        puts "Wrong! '#{letter}' is not in the word. You have #{@remaining_guesses} guesses left."
      end
    end
  end

  def update_word_progress(letter)
    @random_word.chars.each_with_index do |char, index|
      @word_progress[index] = letter if char == letter
    end
  end

  def display_game_state
    puts "\nWord: #{@word_progress.join(' ')}"
    puts "Guessed letters: #{@guessed_letters.join(', ')}"
    puts "Remaining guesses: #{@remaining_guesses}"
  end

  def game_over?
    @word_progress.join == @random_word || @remaining_guesses.zero?
  end

  def display_result
    if @word_progress.join == @random_word
      puts "Congratulations! You've guessed the word: #{@random_word}"
    else
      puts "Game over! The word was: #{@random_word}"
    end
  end

  def play
    random_word
    until game_over?
      display_game_state
      user_letter
    end
    display_result
  end
end

new_game = Hangman.new
new_game.play
