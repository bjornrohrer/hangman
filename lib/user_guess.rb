class Hangman
  def random_word
    words = File.readlines('google-10000-english-no-swears.txt').map(&:strip)
    @valid_words = words.select { |word| (5..12).include?(word.length) }
    @random_word = @valid_words.sample
    puts "The word is #{@random_word.length} letters long"
    @random_word
  end

  def user_letter
    puts "Guess a letter"
    letter = gets.chomp.downcase 
    if @random_word.include?(letter)
      puts "Correct #{letter} was included in the word."
    else 
      puts "Wrong #{letter} was not included in the word"
    end
  end
end

#Add a loop so the game continues to run until either the word is guessed or the user is out of guesses.

new_game = Hangman.new
new_game.random_word
new_game.user_letter

