class Player
    attr_accessor :name, :guess, :losses

    def initialize(name)
        @name = name
        @losses = 0
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

    def increment_loss
        self.losses = self.losses + 1
    end

end