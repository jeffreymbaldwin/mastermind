require_relative 'symbols'
class ComputerBreaker
  

  def initialize
    @last_guess = nil
    @last_feedback = nil
  end

  def get_guess
    return random_guess if @last_feedback.nil?

    exact_count = @last_feedback[:exact]

    new_guess = []

    4.times do |i|
      if i < exact_count
        new_guess << @last_guess[i]
      else 
        new_guess << Symbols::OPTIONS.sample
      end
    end
    new_guess
  end

  def receive_feedback(guess, feedback)
    @last_guess = guess
    @last_feedback = feedback
  end

  def random_guess
    Array.new(4) { Symbols::OPTIONS.sample }
  end
end