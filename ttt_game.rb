require 'pry' 
class Player
    attr_accessor :piece
    attr_reader :name

    def initialize(name = "PLaya Playa", piece, board)
        @name = name
        @piece = piece
        @board = board
    end


    def get_coordinates
        loop do
            coords = ask_for_coordinates
            if validate_coordinates_format(coords)
                if @board.add_piece(coords, @piece)
                    break
                end
            end
        end
    end

    def ask_for_coordinates
        puts "#{@name}(#{@piece}), enter your coordinates in the form x,y :"
        gets.strip.split(",").map(&:to_i)
    end

    def validate_coordinates_format(coords)
        if coords.is_a?(Array) && coords.size == 2
            true
        else
            puts "Your coordinates are in the improper format!"
        end
    end

end

class TicTacToad
    attr_accessor :player_one, :player_two, :current_player

    def initialize
        @board = Board.new
        @moves = 0
    end

    def start
        set_up_player_one
        set_up_player_two
        loop do
            @board.display_board
            @current_player.get_coordinates
            break if win?
            switch_players
        end
    end

    def set_up_player_one
    puts "Enter your name Player One 🐸 "
    name = gets.strip
    @player_one = Player.new(name, "🐸", @board)
    @current_player = @player_one
    end

    def set_up_player_two
    puts "Enter your name Player Two 🍄"
    name = gets.strip
    @player_two = Player.new(name, "🍄", @board)
    end
        
    def win?
        check_win || check_draw
    end

    def check_win
      if @board.check_arr?
        end_game
      elsif @board.check_transposed?
        end_game
      elsif @board.diag_win?
        end_game
      else
        false
      end
    end

    def check_draw
        if @board.full?
            puts "The Toads Are Toungue TIED"
            true
        else
            false
        end
    end

    def switch_players
        if @current_player == @player_two
            @current_player = @player_one
            @moves = @moves + 1    
        else
          @current_player == @player_one
          @current_player = @player_two
          @moves = @moves + 1
        end
    end

    def end_game
        puts "#{@current_player.name} IS THE TOP TOAD"
        true
    end

end



class Board

    attr_accessor :board, :transposed

    def initialize
     @board = [
        ['0,0', '0,1', '0,2'], 
        ['1,0', '1,1', '1,2'], 
        ['2,0', '2,1', '2,2']
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
      puts "-----------"
      puts " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} "
      puts "-----------"
      puts " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} "
    end

    def full?
        @moves == 9
    end

    def valid_coordinates?(coords)
        if (0..2).include?(coords[0]) && (0..2).include?(coords[1])
            true
        else
            puts "Piece coordinates are out of bounds"
        end
    end

    def coordinates_available?(coords)
        if @board[coords[0]][coords[1]] != '🐸' || @board[coords[0]][coords[1]] != '🍄' 
            true
        else
            puts "A Toad Sits Upon That Spot Already"
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

t = TicTacToad.new
t.start