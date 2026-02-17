require_relative 'symbols'

class ComputerCodeMaker
  attr_reader :secret
  
  def make_code
    @secret = Array.new(4) {Symbols::OPTIONS.sample}
  end
  
end

