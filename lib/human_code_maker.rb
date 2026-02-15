class HumanCodeMaker
  attr_reader :secret


  def make_code
    puts "Enter your 4 letter code."
     code = gets.chomp.upcase

    until code.match?(/\A[A-F]{4}\z/)
      puts "Invalid input. Be sure to only enter 4 letters between A-F"
      code = gets.chomp.upcase
    end

    @secret = code.chars

  end
end