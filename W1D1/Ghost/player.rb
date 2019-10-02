class Player
    attr_accessor :name, :guess

    def initialize(name)
        @name = name
    end

    def guess
        p "Make a guess below, it must be one character"
        guess = gets
        guess = guess.chomp
        return guess
    end

    def alert_invalid_guess
        p "entry was invalid please try again"
    end

end