require_relative 'judge'
require_relative 'computer_code_maker'
require_relative 'human_breaker'
require_relative 'renderer'
require_relative 'computer_breaker'
require_relative 'human_code_maker'

class Game
  MAX_TURNS = 11
  def initialize
    @judge = Judge.new
    @renderer = Renderer.new
    @history = []
  end

  def play
    setup_roles
    play_loop  
  end

  #this needs to be loop do
  def setup_roles 
    puts "Choose your role. Enter 1 or 2. 
  1 = Try to break the code within 12 rounds
  2 = Try to create a code the computer cannot solve in 12 rounds"
    loop do
      role = gets.chomp
      case role
      when "1"
        #breaker setup
        @codemaker = ComputerCodeMaker.new
        @codemaker.make_code
        @breaker = HumanBreaker.new
        break
      when "2"
        #maker setup
        @codemaker = HumanCodeMaker.new
        @renderer.legend
        @codemaker.make_code
        @breaker = ComputerBreaker.new
        break
      else
        puts "Invalid input. Try again. Enter 1 or 2. "
      end
    end
    @secret = @codemaker.secret
  end

  def play_loop
    @renderer.legend
    loop do
      guess = @breaker.get_guess
      feedback = @judge.evaluate(@secret, guess)
      @history << [guess, feedback]
      @renderer.render_turn(@history)
      if feedback[:exact] == 4
        puts "You win! Good job!"
        break
      elsif @history.length == 12
        puts "You are out of turns. You lose!"
        break  
      end
    end 
  end


end

