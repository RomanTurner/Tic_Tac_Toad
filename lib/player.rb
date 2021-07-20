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
        x = gets.strip.split(",")
    end

    def validate_coordinates_format(coords)
        if coords.is_a?(Array) && coords.size == 2 
            true
        else
            puts "Your coordinates are in the improper format!"
        end
    end

end

