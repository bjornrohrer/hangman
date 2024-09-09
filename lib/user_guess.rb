class Hangman
  def random_word
    words = File.readlines('google-10000-english-no-swears.txt').map(&:strip)
    @valid_words = words.select { |word| (5..12).include?(word.length) }
    @random_word = @valid_words.sample
    puts "The word is #{valid_words.sample.length} letters long"
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

new_game = Hangman.new
puts new_game.random_word.user_letter()

