class Mastermind
    def initialize
      @computer_colors = []
      @available_colors = %w[blue red green yellow orange purple]
      @player_input = []
      @matching_pegs = []
      @rounds = 1
    end
  
    def get_colors
      4.times { @computer_colors.push(@available_colors.sample) }
    end
  
    def player_guesses
      input = gets.chomp.downcase.split(/[\s,]+/)
      until input.length == 4 && input.all? { |color| @available_colors.include?(color) }
        puts "Invalid input! Please enter 4 colors from: #{@available_colors.join(', ')}"
        input = gets.chomp.downcase.split(/[\s,]+/)
      end
      @player_input.replace(input)
    end
  
    def is_matching
      @player_input.each_with_index do |peg, index|
        if @computer_colors[index] == peg
          @matching_pegs.push("match")
        elsif @computer_colors.include?(peg)
          @matching_pegs.push("misplaced")
        else
          @matching_pegs.push("no match")
        end
      end
      @matching_pegs
    end
  
    def start_codebreaker
      puts "Round 1"
      puts "The computer has chosen 4 colors. You must guess it in less than 12 tries to win."
      puts "The available colors are: blue, red, green, yellow, orange, purple."
      get_colors
  
      12.times do
        player_guesses
  
        if @player_input == @computer_colors
          puts "You won!"
          replay
          break
        else
          is_matching
          @rounds += 1
          print "\e[A"
          print " " * 40
          print "\r"
          puts ""
          puts "Round #{@rounds}"
          puts "Your guess: #{@player_input.join(", ")}."
          puts "\rYour match: #{@matching_pegs.join(", ")}."
          @player_input.clear
          @matching_pegs.clear
        end
  
        if @rounds > 12
          puts "You lost!"
          replay
        end
      end
    end
  
    def start_codemaker
      puts "Please input a code of 4 different colors. You may add additional colors to your liking."
      player_code = gets.chomp.downcase.split(/[\s,]+/)
  
      until player_code.length == 4
        puts "Invalid input! Please put a code with 4 different colors."
        player_code = gets.chomp.downcase.split(/[\s,]+/)
      end
  
      computer_guess = []
  
      player_code.each do |color|
        @available_colors.push(color) unless @available_colors.include?(color)
      end
  
      puts "Your code is: #{player_code.join(", ")}. The computer will now try to guess your code."
  
      12.times do
        4.times { computer_guess.push(@available_colors.sample) }
  
        puts "Round #{@rounds}: #{computer_guess.join(", ")}."
  
        if computer_guess == player_code
          puts "The computer has won!"
        end
  
        computer_guess.clear
        @rounds += 1
        sleep(1)
      end
  
      if @rounds > 12
        puts "The computer couldn't find your code!"
        replay
      end
    end
  
    def intro
      puts 'If you want to be the codemaker, enter "maker". If you want to be the codebreaker, enter "breaker"'
  
      player_answer = gets.chomp.downcase
  
      if player_answer == "maker"
        start_codemaker
      elsif player_answer == "breaker"
        start_codebreaker
      else
        puts "Invalid answer. Please choose between maker or breaker."
        intro
      end
    end
  
    def replay
      @rounds = 1
      @computer_colors.clear
      puts 'Would you like to play another game? Yes/no'
      replay_answer = gets.chomp.downcase
  
      if replay_answer == "yes"
        puts ""
        intro
      elsif replay_answer == "no"
        puts "Thank you for playing!"
      else
        puts 'Wrong input. Please enter "yes" or "no" '
      end
    end
  
    def play_game
      puts "Welcome to Mastermind!"
      intro
    end
  end
  
  game = Mastermind.new
  game.play_game
  