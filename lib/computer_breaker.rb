require_relative 'symbols'
class ComputerBreaker
  

  def initialize
    @last_guess = nil
    @last_feedback = nil
  end

  def get_guess
    Array.new(4) { Symbols::OPTIONS.sample}
  end

  def receive_feedback(guess, feedback)
    @last_guess = guess
    @last_feedback = feedback
  end


end