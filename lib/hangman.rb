require 'yaml'
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
puts "would you like to load a game"
answer = gets.chomp.downcase
if answer == 'yes'
   content = File.open('games/saved.yaml', 'r') { |file| file.read }
  YAML.load(content) # returns a Hangman object
elsif answer == 'no'
  
  while (guesses != 0 && win == false)
  puts display
  puts "Wrong guesses #{incorrect}"
  puts "Enter your letter"
  guess = gets.chomp
  if guess == 'save'
     Dir.mkdir('games') unless Dir.exist? 'games'
  filename = 'games/saved.yaml'
  File.open(filename, 'w') do |file|
    file.puts YAML.dump(self)
  end
  elsif word_array.none? { |w| w == guess} # add unfound letter to misses array, reduce turns
      incorrect << guess
      guesses -= 1
      puts "You have #{guesses} left"
  else
    word_array.each_with_index do |letter, i| # add letter to display array
      display[i] = letter if letter == guess
    end
     if display.none? { |i| i == '_' }
        result = "#{display.join('  ')}\nCongrats, you win!"
        win = true
    end
    puts result
end

if guesses == 0
	puts "You Lose, the word was #{word}"
end
end
end


 


		
  