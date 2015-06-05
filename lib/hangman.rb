def pick_random_line
  chosen_line = nil
  File.foreach("5desk.txt").each_with_index do |line, number|
    chosen_line = line if rand < 1.0/(number+1)
  end
  return chosen_line
end

word = pick_random_line
word_array = word.split(//)

guesses = 6
win = false
display = Array.new((word.length - 1), '_')
incorrect = []
puts word



  while (guesses != 0 && win == false)
  puts display
  puts "Wrong guesses #{incorrect}"
  puts "Enter your letter"
  guess = gets.chomp
  if word_array.none? { |w| w == guess} # add unfound letter to misses array, reduce turns
      incorrect << guess
      guesses -= 1
      puts "You have #{guesses} left"
  else
    word_array.each_with_index do |letter, i| # add letter to display array
      display[i] = letter if letter == guess
    end
end

if guesses == 0
	puts "You Lose, the word was #{word}"
end
end



 


		
  