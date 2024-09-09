module UserGuess
  def user_letter(letter)
    letter = gets.chomp
    if random_word.include?(letter)
      puts "Correct #{letter} was included in the word."
    else 
      puts "Wrong #{letter} was not included in the word"
    end
  end
end

