class Game
    def initalize()
        @fragment = ""
    end

    def is_valid?(character)
        if character.count() == 1 && character.count("a-zA-Z") == 1
        end
        return "invalid play"
    end
end