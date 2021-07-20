
class Board
    attr_accessor :board, :transposed

    def initialize
     @board = [
        [' 0,0 ', ' 0,1 ', ' 0,2 '], 
        [' 1,0 ', ' 1,1 ', ' 1,2 '], 
        [' 2,0 ', ' 2,1 ', ' 2,2 ']
      ] 
     
     @transposed = [] 
    end

    def check_arr?
      for i in @board do 
        if i.uniq.length == 1 
          return true
        end
      end
      false
    end

    def check_transposed?
      @transposed = @board.transpose
      for i in @transposed do 
        if i.uniq.length == 1 
          return true
        end
      end
      false
    end

    def diag_win?
      diagL = [@board[0][0], @board[1][1],@board[2][2]]
      diagR = [@board[0][2], @board[1][1],@board[2][0]]
      diagL.uniq.length == 1 || diagR.uniq.length == 1
    end

    def display_board
      puts " #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} "
      puts "------------------"
      puts " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} "
      puts "------------------"
      puts " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} "
    end

    def full?(moves)
        moves == 8
    end

    def valid_coordinates?(coords)
        
        if coords[0].match(/[0-2]/) && coords[1].match(/[0-2]/)
            true
        else
            puts "Piece coordinates are out of bounds, or not a number"
        end
    end

    def coordinates_available?(coords)
        coords = coords.map!(&:to_i)
        if @board[coords[0]][coords[1]] == ' 🐸 ' || @board[coords[0]][coords[1]] == ' 🍄 ' 
            puts "A Toad Sits Upon That Spot Already"
        else
            true
        end
    end

    def location_valid?(coords)
        if valid_coordinates?(coords)
            coordinates_available?(coords)
        end
    end

    def add_piece(coords, piece)
        if location_valid?(coords)
            @board[coords[0]][coords[1]] = piece
            true
        else
            false
        end
    end
       
end