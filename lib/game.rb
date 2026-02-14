require_relative 'judge'
require_relative 'autocodemaker'
require_relative 'humanbreaker'
require_relative 'renderer'
require_relative 'computerbreaker'
require_relative 'humancodemaker'

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

  #this needs to be loop do
  def setup_roles 
    puts "Choose your role. Enter 1 or 2. 
    1 = Try to break the code within 12 rounds
    2 = Try to create a code the computer cannot solve in 12 rounds"
    role = gets.chomp
    case role
    when "1"
      #breaker setup
      @codemaker = Autocodemaker.new
      @breaker = HumanBreaker.new
    when "2"
      #maker setup
      @codemaker = Humancodemaker.new
      @breaker = ComputerBreaker.new
    else
      puts "Invalid input"
    end
    @secret = @codemaker.secret
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

