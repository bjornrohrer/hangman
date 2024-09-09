class Hangman
  def random_word
    words = File.readlines('google-10000-english-no-swears.txt').map(&:strip)
    valid_words = words.select { |word| (5..12).include?(word.length) }
    puts "The word is #{valid_words.sample.length} letters long"
  end

  def user_letter(letter)
    puts "Guess a letter"
    letter = gets.chomp
    if random_word.include?(letter)
      puts "Correct #{letter} was included in the word."
    else 
      puts "Wrong #{letter} was not included in the word"
    end
  end
end





