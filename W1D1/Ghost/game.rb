class Game
    def initalize()
        @fragment = ""
    end

    def valid_play?(character)
        if character.count() == 1 && character.count("a-zA-Z") == 1
            fragment = fragment + character 
        else 
            p "invalid play, try again"
    end
end