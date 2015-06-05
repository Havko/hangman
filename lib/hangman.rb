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
display = word.gsub(/[a-zA-Z]/ ,"_ ")
display = display.split
h = Hash[word_array.zip(display)]





  while (guesses != 0)
 
  h.each do |k, v|
  	puts v
  end
  puts "Enter your letter"
  guess = gets.chomp
  h.each do |k, v| 
  if (guess == k)
  h[k] = guess
  end
end
h.each do |k, v|
  	puts v
  end
  guesses -= 1
  end
if guesses == 0
	puts "You Lose, the word was #{word}"

end



 


		
  