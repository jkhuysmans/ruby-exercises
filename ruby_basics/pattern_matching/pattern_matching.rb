def cool_method(&my_block)
    my_block.call
  end
  
  cool_method { puts "cool" }
  