require_relative 'judge'
require_relative 'codemaker'


class Game
  def initialize
    @codemaker = CodeMaker.new
    @breaker
    @humanbreaker
    @judge = Judge.new
    @turn = 1
    @history = []
  end

  def play
    @secret = @codemaker.secret
    #loop until the game is done method
      #ask breaker for guess
      #ask judge to evaulate
      #store result
      #render
      #increment turn
  end


end

