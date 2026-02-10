require_relative 'judge'
require_relative 'codemaker'
require_relative 'humanbreaker'


class Game
  def initialize
    @codemaker = CodeMaker.new
    @breaker = HumanBreaker.new
    @judge = Judge.new
    @secret = @codemaker.secret
    puts @secret
    @turn = 1
    @history = []
  end

  def play
    loop do
    guess = @breaker.get_guess
    feedback = @judge.evaluate(@secret, guess)
    @history << [guess, feedback]
    pp feedback #render the board (include turn order? Where is turn order gonna live)
      if feedback[:black] == 4
        puts "You win! Good job!"
        break
      elsif @turn == 12
        puts "You are out of turns. You lose!"
        break   
      else 
        @turn += 1 
      end
    end 
  end


end

