class Secret 
	
	def pick_word
		list = [] 
		File.open("5desk.txt", "r") do |f|
			f.each_line do |line|
			list << line
        end
		end
        
	end
end

word = Secret.new
puts word.pick_word