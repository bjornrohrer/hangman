module WordSelector
  def random_word
    words = File.readlines('google-10000-english-no-swears.txt').map(&:strip)
    valid_words = words.select { |word| (5..12).include?(word.length) }
    puts "The word is #{valid_words.sample.length} letters long"
  end
end

# Select a random word between 5 and 12 characters long from the google dictionary.
#tell the user how long the word is.  
