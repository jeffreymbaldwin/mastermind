class ComputerCodeMaker
  attr_reader :secret
  
  def make_code
    options = ["A", "B", "C", "D", "E", "F"]

    @secret = Array.new(4) {options.sample}
  end
  
end

