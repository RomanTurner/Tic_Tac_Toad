class TicTacToad
    attr_accessor :player_one, :player_two, :current_player

    def initialize
        @board = Board.new
        @moves = 0
    end

    def start
       play
    end

    def play
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
    @player_one = Player.new(name, " 🐸 ", @board)
    @current_player = @player_one
    end

    def set_up_player_two
    puts "Enter your name Player Two 🍄"
    name = gets.strip
    @player_two = Player.new(name, " 🍄 ", @board)
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
        if @board.full?(@moves)
            @board.display_board
            puts "🐸🍄🐸🍄 The Toads Are Toungue TIED 🐸🍄🐸🍄"
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
        @board.display_board
        if @current_player == @player_one
            puts "🐸🐸🐸🐸 #{@current_player.name} IS THE TOP TOAD 🐸🐸🐸🐸"
        else
            puts "🍄🍄🍄🍄 #{@current_player.name} IS THE TOP TOAD 🍄🍄🍄🍄"
        end
        true
    end

end