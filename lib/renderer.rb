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

  def legend
    puts "Legend:
    A = ◆   B = ▲   C = ■   D = ★   E = ✚   F = ✖
    ● = correct position
    ○ = correct symbol, wrong position"
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

# example = Renderer.new
# history = [
#   ["ABCD", { exact: 2, partial: 1 }],
#   ["AFFF", { exact: 1, partial: 0 }]
# ]

# example.render_history(history)