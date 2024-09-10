class Hangman
  MAX_GUESSES = 6

  def initialize
    @guessed_letters = []
    @remaining_guesses = MAX_GUESSES
    @word_progress = []
  end

  def play
    random_word
    until game_over?
      display_game_state
      user_letter
      update_game_state
    end
    display_result
  end

  def random_word
    words = File.readlines('google-10000-english-no-swears.txt').map(&:strip)
    @valid_words = words.select { |word| (5..12).include?(word.length) }
    @random_word = @valid_words.sample
    @word_progress = Array.new(@random_word.length, '_')
    puts "The word is #{@random_word.length} letters long"
    @random_word
  end

  def user_letter
    puts "Guess a letter"
    letter = gets.chomp.downcase
    if @guessed_letters.include?(letter)
      puts "You've already guessed that letter. Try again."
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

  def update_game_state
    # This method is called after each guess, but doesn't need to do anything
    # since we update the game state in other methods
  end

  def game_over?
    @word_progress.join == @random_word || @remaining_guesses == 0
  end

  def display_result
    if @word_progress.join == @random_word
      puts "Congratulations! You've guessed the word: #{@random_word}"
    else
      puts "Game over! The word was: #{@random_word}"
    end
  end
end

# Create and start a new game
game = Hangman.new
game.play