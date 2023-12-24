computer_colors = []
available_colors = ["blue", "red", "green", "yellow", "orange", "purple"]

def get_colors(computer_colors, available_colors)

    4.times do
        computer_colors.push(available_colors.sample)
    end
    
end

get_colors(computer_colors, available_colors)
p computer_colors

player_input = []

def player_guesses(player_input, available_colors)
    
4.times do
    input = gets.chomp.downcase

    until available_colors.include?(input)
        puts "Invalid color! Please enter a color from: #{available_colors.join(', ')}"
        input = gets.chomp.downcase
    end

    player_input.push(input)

end

puts "You picked #{player_input.join(", ")}."
end

matching_pegs = []

def is_matching(player_input, computer_colors, matching_pegs)

    player_input.each_with_index do |peg, index|
        if computer_colors[index] == peg
            matching_pegs.push("true")
        elsif computer_colors.include?(peg)
            matching_pegs.push("almost")
        else
            matching_pegs.push("false")
        end
    end

    matching_pegs
end

def gamestart(player_input, computer_colors, matching_pegs, available_colors)
=begin 
    12.times do
        puts "
        XXX | XXX | XXX
        ---------------"
    end 
=end
    puts "Please enter your guesses for each peg. The available colors are: blue, red, green, yellow, orange, purple."


12.times do 
    player_guesses(player_input, available_colors)

    if player_input == computer_colors
        puts "You won!"
        break
    else
        is_matching(player_input, computer_colors, matching_pegs)
        puts "Your results are: #{matching_pegs[0]} | #{matching_pegs[1]} | #{matching_pegs[2]} | #{matching_pegs[3]}. Please try again:"
        
        matching_pegs = []
        player_input = []
    end

end

end

gamestart(player_input, computer_colors, matching_pegs, available_colors)


    