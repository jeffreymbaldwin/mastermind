class HumanBreaker

  def get_guess

    puts "Enter your 4 letter guess."
    guess = gets.chomp.upcase

    until guess.match?(/\A[A-F]{4}\z/)
      puts "Invalid input. Be sure to only enter 4 letters between A-F."
      guess = gets.chomp.upcase

    end

    guess.chars
    
  end
end

