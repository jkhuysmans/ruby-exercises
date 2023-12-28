$dictionary = File.read('google-10000-english-no-swears.txt')
$dictionary = $dictionary.split(" ")
$dictionary.filter! { |item| item.length > 5 && item.length < 12 }

$word_to_guess = String.new
$correct_guesses = Array.new
$player_guess = String.new

def select_word
    $word_to_guess.clear
    $word_to_guess = $dictionary.sample
end

def display_input
    ($word_to_guess.length).times { $correct_guesses.push("_") }
end

def save
    $rounds -= 1
    puts "Saving..."

    game_state = {
    word_to_guess: $word_to_guess,
    correct_guesses: $correct_guesses,
    rounds: $rounds
  }

  File.open('saved_game_state.txt', 'w') do |file|
    file.write(Marshal.dump(game_state))
  end

  player_guess
end

def load
    if File.exist?('saved_game_state.txt')
        saved_state = File.read('saved_game_state.txt')
        game_state = Marshal.load(saved_state)
    
        $word_to_guess = game_state[:word_to_guess]
        $correct_guesses = game_state[:correct_guesses]
        $rounds = game_state[:rounds]
    
        puts "Game state loaded!"
        player_guess
      else
        puts "No saved game state found."
        intro
    end
end

def replay
    puts "Would you like to play another game? Yes/No"
    answer = gets.chomp.downcase

    if answer == "yes"
        play_game
    elsif answer == "no"
        puts "Thank you for playing!"
    else
        "Wrong input! please enter Yes or no"
        answer = gets.chomp.downcase
    end
end

def win
    puts "\nYou won! The word was #{$word_to_guess.upcase}!"
    puts "You got the answer in #{$rounds} tries"
    replay
end

def end_game
    puts "\nYou lost! The word was #{$word_to_guess.upcase}!"
    replay
end

def player_guess
    $player_guess = ""
    $rounds += 1
    end_game if $rounds == 11

    puts "\nRound #{$rounds}/11"
    puts "Guess: #{$correct_guesses.join(" ")}"
    puts 'Please enter either a single letter, or a full word. Enter "save" to save the game, or "quit" to go back to menu.'

    until ($player_guess = gets.chomp.downcase).match?(/\A[a-z]+\z/)
        puts "Invalid input: Please enter only alphabet characters."
    end

    save if $player_guess == "save"
    intro if $player_guess == "quit"

    if $player_guess.length == 1
        letter_guess
    elsif $player_guess.length > 1 && $player_guess != "save"
        full_word_guess
    end
end

def letter_guess
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
            player_guess
        end
    else
        puts "No match"
        player_guess
    end

end

def full_word_guess
    if $player_guess == $word_to_guess
        win
    else
        puts "Wrong word, next round!"
        player_guess
    end
end

def play_game
    $rounds = 0
    $correct_guesses.clear
    $player_guess.clear

    puts "The computer has chosen a word. You must guess it in less than 11 tries to win!"
    select_word
    display_input
    player_guess

end

def intro
    puts '\nWelcome to Hangman, a game where you have to guess the computer word!'
    puts 'Start a new game with "new", load your last save state with "load", or quit with "quit"'
    user_input = gets.chomp.downcase
    if user_input == "new"
        play_game
    elsif user_input == "load"
        load
    elsif user_input == "quit"
        puts "Thank you for playing!"
    else
        puts 'Incorrect input, please either enter "new", "load", or "quit".'
        user_input = gets.chomp.downcase
    end
end

intro

    

