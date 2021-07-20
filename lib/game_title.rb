module GameTitle

    @@font = TTY::Font.new("3d")
    @@name = TTY::Font.new("starwars")
    @@pastel = Pastel.new

    def print_title
       puts @@pastel.red(@@font.write('TIC-TAC-'), @@pastel.green(@@font.write('TOAD')))
    end

    def print_red(word)
        puts @@pastel.red(@@name.write("#{word}"))
    end

    def print_green(word)
        puts @@pastel.green(@@name.write("#{word}"))
    end

end