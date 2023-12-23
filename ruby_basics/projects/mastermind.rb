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
    puts "Please enter your guesses for each peg. The available colors are: blue, red, green, yellow, orange, purple."
    
    4.times do
        input = gets.chomp.downcase

        until available_colors.include?(input)
            puts "Invalid color! Please enter a color from: #{available_colors.join(', ')}"
            input = gets.chomp.downcase
        end

        player_input.push(input)

    end

    puts "You picked #{player_input.join(", ")}"
end

player_guesses(player_input, available_colors)
    