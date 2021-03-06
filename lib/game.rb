class TicTacToad
    include GameTitle
    attr_accessor :player_one, :player_two, :current_player

    def initialize
        @board = Board.new
        @moves = 0
    end

    def start
      clear
      self.print_title
      set_up_player_one
      set_up_player_two
      play
    end

    def play
        loop do
            clear
            self.print_title
            @board.display_board
            @current_player.get_coordinates
            break if win?
            switch_players
        end
        puts "Thanks for Playing"
    end


    def clear
       system("clear") || system("cls")
    end

    def set_up_player_one
    puts "Enter your name Player One πΈ "
    name = gets.strip
    @player_one = Player.new(name, " πΈ ", @board)
    @current_player = @player_one
    end

    def set_up_player_two
    puts "Enter your name Player Two π"
    name = gets.strip
    @player_two = Player.new(name, " π ", @board)
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
            clear
            self.print_title
            @board.display_board
            puts "πΈππΈπ The Toads Are Toungue TIED πΈππΈπ"
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
        clear
        @board.display_board
        if @current_player == @player_one
            self.print_green(@current_player.name)
            puts "πΈπΈπΈπΈ IS THE TOP TOAD πΈπΈπΈπΈ"
        else
            self.print_red(@current_player.name)
            puts "ππππ IS THE TOP TOAD ππππ"
        end
        true
    end

end