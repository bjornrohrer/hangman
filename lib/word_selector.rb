def select_random_word
  word = File.readlines('google-10000-english-no-swears.txt').sample
  word_length = word.length
  puts "The word is #{word_length} letters long"
end

# Select a random word between 5 and 12 characters long from the google dictionary.
#tell the user how long the word is.  

puts select_random_word