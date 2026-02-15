class Renderer
SYMBOLS = { "A"=>"◆", "B"=>"▲", "C"=>"■", "D"=>"★", "E"=>"✚", "F"=>"✖" }


  def render_history(history)
    render_header
    history.each_with_index do |(guess, feedback), idx|
      turn = idx + 1
      guess_str = format_guess(guess)
      feedback_str = format_feedback(feedback)

      puts "#{turn.to_s.ljust(4)} | #{guess_str.ljust(12)} | #{feedback_str}"
    end
  end

  def render_header
    puts "Turn | Guess         | Feedback"
    separator
  end 

  def render_symbol_legend
    puts "Legend:
A = ◆   B = ▲   C = ■   D = ★   E = ✚   F = ✖"    
  end

  def render_peg_legend
    puts "● = correct position
○ = correct symbol, wrong position"
  end

  def render_turn(history)
    render_history(history)
    render_symbol_legend
    render_peg_legend
    separator
  end
  
  private

  def separator
    puts "-" * 35
  end

  def format_guess(guess)
    letters = guess.is_a?(String) ? guess.chars : guess
    letters.map { |ch| SYMBOLS[ch] }.join (" ")
  end

  def format_feedback(feedback)
  exact_pegs = Array.new(feedback[:exact], "●")
  partial_pegs = Array.new(feedback[:partial], "○")
  (exact_pegs + partial_pegs).join(" ")
  end


end

