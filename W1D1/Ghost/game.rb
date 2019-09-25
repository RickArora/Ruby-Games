require 'byebug'
require 'set'
class Game
    attr_accessor :fragment, :players, :dictionary, :current_player
    def initialize(list_of_players)
        words = File.readlines("dictionary.txt", chomp: true)
        @fragment = ""
        @players = list_of_players
        @dictionary = words.to_set
        @current_player = players[0]
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

    def play_round 
        # implement methods below and call them here
    end

    def current_player()
        @current_player
    end

    def previous_player()
        @players[(@players.index(@current_player))-1]
    end

    def nextplayer!()
        @players = @players[(@players.index(@current_player))+1]
    end

    def take_turn(player)
        @current_player.guess
    end

    def play_around
        # ????
    end

end

new_game = Game.new
p new_game.valid_play?("l")