i = 0

        # loop

loop do
    puts "i is #{i}"
    i += 1
    break if i == 10
end 

        # while loop

while i < 10 do
    puts "i is #{i}"
    i += 1
end

        # unless loop

until i >= 10 do
    puts "i is #{i}"
    i += 1
end

        # range each loop

(5..10).each do |i|
    puts "i is #{i}"
end

        # for loop with range

for i in 0..5
    puts "#{i} zombies incoming"
end

        # times loop with range

5.times do |number|
    puts "i is #{number}"
end

        #up to loop

5.upto(10) { |num| puts "#{num} " }

        #down to loop

10.downto(5) { |num| puts "#{num} " }
