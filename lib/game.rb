require_relative 'judge'
require_relative 'codemaker'
require_relative 'humanbreaker'


class Game
  def initialize
    @codemaker = CodeMaker.new
    @breaker = HumanBreaker.new
    @judge = Judge.new
    @secret = @codemaker.secret
    @turn = 1
    @history = []
  end

  def play
    guess = @breaker.get_guess
    feedback = @judge.evaluate(@secret, guess)
    @history << [guess, feedback]
    #play around code
    puts @history
    #loop until the game is done method
      #render
      #increment turn
  end


end

