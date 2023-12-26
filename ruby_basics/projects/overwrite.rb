puts "Original text"
puts "Original text 2"
sleep(2)
print "\e[A\e[A"

sleep(20)
sleep(2)  # Wait for 2 seconds
print "\r"  # Move the cursor to the beginning of the line
sleep(2)
print " " * 13  # Print spaces to cover the old text ("Original text")
sleep(2)
print "\r"  # Move the cursor back to the beginning of the line
sleep(2)
print "New text"  # Print the new text