class KnightMoves
    def initialize
      @moves = [
        [-1, -2], [-1, 2], [1, -2], [1, 2],
        [-2, -1], [-2, 1], [2, -1], [2, 1]
      ]
    end
  
    def knight_moves(start, target)
        queue = [[start]]
        visited = [start]
        
        until queue.empty?
            path = queue.shift
            current_square = path.last
            
            print_path(path) if current_square == target
            
            @moves.each do |move|
                new_square = [current_square[0] + move[0], current_square[1] + move[1]]
                
                if new_square[0].between?(0, 7) && new_square[1].between?(0, 7) && !visited.include?(new_square)
                    new_path = path.dup << new_square
                    queue << new_path
                    visited << new_square
                end
            end
        end
  
      "No valid path found."
    end

    def print_path(path)
        puts "You made it in #{path.length} moves! Here's your path:"

        for i in 0..(path.length - 1)
            puts "#{path[i]}"
        end

    end
end

knight = KnightMoves.new
knight.knight_moves([1,1], [4,4])

knight.knight_moves([2,1], [5,7])

knight.knight_moves([6,2], [0,0])
