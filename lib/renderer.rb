class Renderer
  def render()
    
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
example.legend
example.separator




#3 methods
  #render board (history)
  #render legend
  #render separator
  #guess from breaker (called by game)