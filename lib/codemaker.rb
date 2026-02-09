class CodeMaker
  attr_reader :secret
  
  def initialize
    make_code
  end


  def make_code
    options = ["A", "B", "C", "D", "E", "F"]

    @secret = Array.new(4) {options.sample}
  end
end

    #while @secret.length < 4
      #choice = options.sample
      #@secret << choice