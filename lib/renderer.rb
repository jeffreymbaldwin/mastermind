class Renderer
  def render_header
    puts "Turn | Guess         | Feedback"
    separator
  end 

  def separator
    puts "-" * 35
  end

  def legend
    puts "Legend:
    A = ◆   B = ▲   C = ■   D = ★   E = ✚   F = ✖
    ● = correct position
    ○ = correct symbol, wrong position"
  end
end

example = Renderer.new
example.render_header
example.legend
example.separator





#3 methods
  #render board (history)
  #render legend
  #render separator
  #guess from breaker (called by game)