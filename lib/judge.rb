class Judge
  def evaluate(secret, guess)
    black = 0
    white = 0
    temp_guess = []
    temp_secret = []

    secret.each_index do |i|
      
     if guess[i] == secret[i]
      black += 1
     else 
      temp_guess << guess[i]
      temp_secret << secret[i]
     end  
    end

    temp_guess.each do |element|
      if temp_secret.include?(element)
        white += 1
        index = temp_secret.find_index(element)
        temp_secret.delete_at(index)
      end 
    end 

    feedback = {black: black, white: white}
    
  end
end



