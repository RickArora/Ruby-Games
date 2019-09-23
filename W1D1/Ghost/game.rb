require 'byebug'
require 'set'
class Game
    attr_accessor :fragment, :players, :dictionary
    def initialize()
        words = File.readlines("dictionary.txt", chomp: true)
        @fragment = ""
        @players = ""
        @dictionary = words.to_set
    end

    def valid_play?(character)
        if character.length == 1 && character.count("a-zA-Z") == 1
            @fragment = fragment + character
            dictionary.each do |word|
                if word.index(fragment) == 0
                    return true
                end
            end
        else 
            p "invalid play, try again"
            return false
        end
    end

    def current_player()
    end

    def previous_player()
    end

    def nextplayer!()
    end

    def take_turn(player)
    end

    def play_around
    end

end

new_game = Game.new
new_game.valid_play?("l")