require_relative 'judge'
require_relative 'codemaker'
require_relative 'humanbreaker'
require_relative 'renderer'


class Game
  def initialize
    @judge = Judge.new
    @renderer = Renderer.new
    @turn = 1
    @history = []
  end

  def play
    setup_roles
    play_loop  
  end

  def setup_roles
    
  end

  def play_loop
    @renderer.render_header
    @renderer.legend
    loop do
    guess = @breaker.get_guess
    feedback = @judge.evaluate(@secret, guess)
    @history << [guess, feedback]
    @renderer.render_turn(@history)
      if feedback[:exact] == 4
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

