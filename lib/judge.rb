class Judge
  def evaluate(secret, guess)
    exact = 0
    partial = 0
    temp_guess = []
    temp_secret = []

    secret.each_index do |i|
      
     if guess[i] == secret[i]
      exact += 1
     else 
      temp_guess << guess[i]
      temp_secret << secret[i]
     end  
    end

    temp_guess.each do |element|
      if temp_secret.include?(element)
        partial += 1
        index = temp_secret.find_index(element)
        temp_secret.delete_at(index)
      end 
    end 

    {exact: exact, partial: partial}
    
  end
end



