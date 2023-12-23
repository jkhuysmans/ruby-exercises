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

end

board = Board.new
board.display_board



class Players
    attr_reader :nickname, :symbol
  
    def initialize(nickname, symbol)
      @nickname = nickname
      @symbol = symbol
    end

    def get_move
        puts "#{nicknameA}, where would you like to place your marker?"
        playerMove = gets.chomp

        if playerMove =~ /^[1-9]$/
            ---
        else 
            puts "Invalid choice, please put a number between 1 and 9"
        end
  end
  



  def get_player_infos
    puts "Player A, please enter your nickname"
    nicknameA = gets.chomp
  
    puts "Player B, please enter your nickname"
    nicknameB = gets.chomp
  
    [nicknameA, nicknameB]
  end
  
  nicknames = get_player_infos
  
  playerA = Players.new(nicknames[0], "X")
  playerB = Players.new(nicknames[1], "O") 
  p playerA
  p playerB
