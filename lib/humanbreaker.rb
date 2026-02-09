class HumanBreaker
  def initialize
    
  end

  def get_guess

    puts "Enter your 4 letter guess."
    input = gets.chomp.upcase

    until input.match?(/^[A-F]{4}$/)
      puts "Invalid input. Be sure to only enter 4 letters between A-F."
      input = gets.chomp.upcase

    end

    input.chars
    
  end
end

#ask user for guess string
#vaildate it (length 4 A-F)
#convert to the interal array format ["A", "C", "F", "B"]
#return that to Game