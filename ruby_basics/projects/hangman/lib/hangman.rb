$dictionary = File.read('google-10000-english-no-swears.txt')
$dictionary = $dictionary.split(" ")
$dictionary.filter! { |item| item.length > 5 && item.length < 12 }

$word_to_guess = String.new
$correct_guesses = Array.new
$player_guess = String.new

def select_word()
    $word_to_guess.clear
    $word_to_guess = $dictionary.sample
end

def display_input()
    ($word_to_guess.length).times { $correct_guesses.push("_") }
end

def win()
    puts "\nYou won! The word was #{$word_to_guess.upcase}!"
    puts "You got the answer in #{$rounds} tries"
    puts "Would you like to play another game? Yes/No"
    answer = gets.chomp.downcase

    if answer == "yes"
        play_game()
    elsif answer == "no"
        puts "Thank you for playing!"
    else
        "Wrong input! please enter Yes or no"
        answer = gets.chomp.downcase
    end

end

def player_guess()
    $player_guess = ""
    $rounds += 1
    puts "\nRound #{$rounds}/11"
    puts "Guess: #{$correct_guesses.join(" ")}"
    puts 'Please enter either a single letter, or a full word. To save the game, enter "save"'

    until ($player_guess = gets.chomp.downcase).match?(/\A[a-z]+\z/)
        puts "Invalid input: Please enter only alphabet characters."
    end

    if $player_guess.length == 1
        letter_guess()
    elsif $player_guess.length > 1
        full_word_guess()
    end
end

def letter_guess()
    indices = {}

    $word_to_guess.each_char.with_index do |char, index|
        indices[index] = char if char == $player_guess
    end

    if indices.any?
        indices.each do |index, char|
            $correct_guesses[index] = $player_guess
        end
    
        if $correct_guesses.join("") == $word_to_guess
            win(dictionary)
        else
            player_guess()
        end
    else
        puts "No match"
        player_guess()
    end

end

def full_word_guess()
    if $player_guess == $word_to_guess
        win()
    else
        puts "Wrong word, next round!"
        player_guess()
    end
end

def play_game()
    $rounds = 0
    $correct_guesses.clear
    $player_guess.clear
    puts "The computer has chosen a word. You must guess it in less than 11 tries to win!"

    select_word()
    display_input()
    player_guess()

end

play_game()
    

