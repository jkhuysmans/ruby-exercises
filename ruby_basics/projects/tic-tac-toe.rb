class Board 
    attr_reader :cases
    
    def initialize
        @cases = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def display_board
        puts "
         #{cases[0]} | #{cases[1]} | #{cases[2]}
        -----------
         #{cases[3]} | #{cases[4]} | #{cases[5]}
        -----------
         #{cases[6]} | #{cases[7]} | #{cases[8]}"
    end

    def winner(symbol) 

        winning_combinations = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], 
        [2, 4, 6]
    ]


        winning_combinations.each do |combination|
            if combination.all? { |index| @cases[index] == symbol }
                return true 
            end
        end

    false
    end
end

class Players
    attr_reader :nickname, :symbol
  
    def initialize(nickname, symbol)
      @nickname = nickname
      @symbol = symbol
    end

    def get_move(board)
        puts "#{@nickname}, where would you like to place your marker?"
        player_move = gets.chomp.to_i

        if (1..9).include?(player_move)
            if board.cases[player_move - 1] != 'X' && board.cases[player_move - 1] != 'o'
              board.cases[player_move - 1] = @symbol
            else
              puts "Position already taken. Please choose an empty spot between 1 and 9."
              get_move(board)
            end
          else
            puts "Invalid choice. Please choose a number between 1 and 9."
            get_move(board)
        end
    end
end
  
def get_player_infos
    puts "Player A, please enter your nickname"
    nicknameA = gets.chomp
  
    puts "Player B, please enter your nickname"
    nicknameB = gets.chomp

    puts "#{nicknameA} will use X, #{nicknameB} will use o"
    [nicknameA, nicknameB]
end

def replaygame
    puts "Would you like to play another game? (yes / no)"
    replay_answer = gets.chomp.to_s
    replay_answer = replay_answer.downcase

    if replay_answer == "yes"
        puts "Restarting game..."
        restart
    elsif replay_answer == "no"
        puts "Game is over!"
    else 
        puts "Invalid input, please enter yes or no"
        replaygame
    end

end

def restart
    board = nil
    playerA = nil
    playerB = nil
    nicknames = nil

    startgame
end

def startgame
    board = Board.new
    board.display_board
    
    nicknames = get_player_infos
      
    playerA = Players.new(nicknames[0], "X")
    playerB = Players.new(nicknames[1], "o") 
    
    9.times do
        board.display_board
        playerA.get_move(board)
        if board.winner(playerA.symbol)
            puts "#{playerA.nickname} wins! Congratulations!"
            replaygame
            break 
          end
    
        board.display_board
        playerB.get_move(board)
        if board.winner(playerB.symbol)
            puts "#{playerB.nickname} wins! Congratulations!"
            replaygame
            break 
          end
    end
end

startgame


  
