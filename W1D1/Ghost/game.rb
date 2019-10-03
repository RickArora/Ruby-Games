require 'byebug'
require 'set'
require_relative 'player'
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
        character = character.chomp
        if character.length == 1 && character.count("a-zA-Z") == 1
            dictionary.each do |word|
                if word.index(fragment+character) == 0
                    @fragment = fragment + character
                    return true
                end
            end
            p @fragment
            return false
        end
    end
    
    def play_round 
        while (take_turn(@current_player))
            if fragment.split.to_set.subset?(dictionary)
                round_over(@current_player)
            end
            p "valid play, next players turn"
            nextplayer!
        end
    end

    def round_over(player)
        p player.name + " loses this round"
        player.increment_loss
        @fragment = ""
        return "Game over" + player.name + " loses the game"
    end

    def current_player()
        @current_player
    end
    
    def previous_player()
        @players[(@players.index(@current_player))-1]
    end
    
    def nextplayer!()
        if @players[players.length-1] == @current_player
            @current_player = @players[0]
        else
            @current_player = @players[(@players.index(@current_player))+1]
        end
    end
    
    def take_turn(player)
        while valid_play?(player.guess) != true
            player.alert_invalid_guess
        end
        return true
    end
end
    
    players_list = []
    players_list.push(Player.new('Ricky'))
    players_list.push(Player.new('Sharan'))
    game = Game.new(players_list)
    game.play_round