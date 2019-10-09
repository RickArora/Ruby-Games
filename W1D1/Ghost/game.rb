require 'byebug'
require 'set'
require_relative 'player'
class Game
    attr_accessor :fragment, :players, :dictionary, :current_player, :score
    
    def initialize(list_of_players)
        words = File.readlines("dictionary.txt", chomp: true)
        @fragment = ""
        @players = list_of_players
        @dictionary = words.to_set
        @current_player = players[0]
        @score = @players.map { |player| [player.name, player.losses] }.to_h
    end
    
    def valid_play?(character)
        character = character.chomp
        if character.length == 1 && character.count("a-zA-Z") == 1
            p @fragment
            dictionary.each do |word|
                if word.index(fragment+character) == 0
                    @fragment = fragment + character
                    return true
                end
            end
            p @fragment + "end"
            return false
        end
    end
    
    def play_round 
        while (take_turn(@current_player) && !score.key(5))
            if fragment.split.to_set.subset?(dictionary)
                p @score
                p "word spelled: " + @fragment
                round_over(@current_player)
                @fragment = ""
            end
        end
        round_over(@current_player)
        p "valid play, next players turn"
        nextplayer!
    end

    def round_over(player)
        @score[@current_player.name] = @score[@current_player.name] + 1
        if !score.key(5)
            p player.name + " loses this round their current score is " + @score[@current_player.name].to_s
        else 
            game_over(player)
            exit(true)
        end
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

    def run()
        play_round
    end

    def game_over(player)
        p "GHOST" + @current_player.name + " has lost the game"
        p "Game over"
    end
end
    
    players_list = []
    players_list.push(Player.new('Ricky'))
    players_list.push(Player.new('Sharan'))
    game = Game.new(players_list)
    game.run