require_relative 'symbols'
class ComputerBreaker
  

  def initialize
    @last_guess = nil
    @last_feedback = nil
    @working_options = Symbols::OPTIONS.dup
  end

  def get_guess
    if @last_feedback.nil?
      return random_guess
    elsif @total_matches == 4
      return @working_options.shuffle
    else 

      exact_count = @last_feedback[:exact]

      new_guess = []

      4.times do |i|
        if i < exact_count
        new_guess << @last_guess[i]
        else 
          new_guess << @working_options.sample
        end
      end

      new_guess

      
    end
    
  end

  def receive_feedback(guess, feedback)
    @last_guess = guess
    @last_feedback = feedback
    @total_matches = @last_feedback[:exact] + @last_feedback[:partial]
    if @total_matches == 0
      @working_options -= @last_guess
    elsif @total_matches == 4
      @working_options = @last_guess.dup
    end

  end

  def random_guess
    Array.new(4) { Symbols::OPTIONS.sample }
  end
end