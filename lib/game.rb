require_relative 'judge'
require_relative 'computer_code_maker'
require_relative 'human_breaker'
require_relative 'renderer'
require_relative 'computer_breaker'
require_relative 'human_code_maker'

class Game
  MAX_TURNS = 12
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
        @human_role = :breaker
        break
      when "2"
        #maker setup
        @codemaker = HumanCodeMaker.new
        @renderer.render_symbol_legend
        @codemaker.make_code
        @breaker = ComputerBreaker.new
        @human_role = :codemaker
        break
      else
        puts "Invalid input. Try again. Enter 1 or 2. "
      end
    end
    #put the flag here 
    @secret = @codemaker.secret
  end

  def play_loop
    winner_role = nil
    @renderer.render_symbol_legend
    @renderer.render_peg_legend
    loop do
      guess = @breaker.get_guess
      feedback = @judge.evaluate(@secret, guess)

      if @breaker.respond_to?(:receive_feedback)
        @breaker.receive_feedback(guess, feedback)
      end
      
      @history << [guess, feedback]
      @renderer.render_turn(@history)

      if feedback[:exact] == 4
        winner_role = :breaker
        break
      elsif @history.length == MAX_TURNS
        winner_role = :codemaker
        break  
      end
      
    end 

    if winner_role == @human_role
      @renderer.render_win
    else 
      @renderer.render_lose
    end
  end

  


end

