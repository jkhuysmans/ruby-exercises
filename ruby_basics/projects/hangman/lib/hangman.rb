dictionary = File.read('google-10000-english-no-swears.txt')
dictionary = dictionary.split(" ")
dictionary.filter! { |item| item.length > 5 && item.length < 12 }

$word_to_guess = String.new
$word = Array.new

def select_word(dictionary)
    $word_to_guess.clear
    $word_to_guess = dictionary.sample
end

def display_input()
    ($word_to_guess.length).times { $word.push("_ ") }
end

def player_guess()
    until (guess = gets.chomp.downcase).match?(/\A[a-z]+\z/)
        puts "Invalid input: Please enter only alphabet characters."
    end

    if guess.length == 1
        # update_display()
        puts "You entered a letter"
    elsif guess.length > 1
        # full_word_guess()
        puts "You entered a word"
    end

    p guess
end

select_word(dictionary)
puts $word_to_guess
display_input()
p $word
player_guess()

