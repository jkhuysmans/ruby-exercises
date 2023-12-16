=begin def lab?(string)
    if string.include?("lab") 
        puts string
    else 
        puts "No 'lab' in this word"
    end
end

lab?("laboratory")
lab?("experiment")
lab?("Pans labyrinth")
lab?("elaborate")
lab?("polar bear") 
=end

def execute(&block)
    block.call
  end
  
  execute { puts "Hello from inside the execute method!" }