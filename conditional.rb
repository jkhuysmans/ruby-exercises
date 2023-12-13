puts "Put in a number"
a = gets.chomp.to_i

if a == 3
  puts "a is 3"
elsif a == 4
  puts "a is 4"
else
  puts "a is neither 3, nor 4"
end

puts "Put in a string"
b = gets.chomp.to_s

if b.length >= 10
  puts b.upcase
else b.length <= 10
  puts b
end

puts "Put a number between 0 and 100"
c = gets.chomp.to_i

if (c >= 0) && (c <= 50)
  puts "#{c} is under 51"
elsif (c <= 51) && c <= 100
  puts "#{c} is over 51"
elsif c > 100
  puts "Number is out of range"
end