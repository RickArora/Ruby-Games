class Game

  attr_accessor :array_of_cards

  def initialize
    array_of_cards = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12]
    game_board = new Board(array_of_cards)
    play(game_board)
  end

  def play
  end

  def previous_guess
  end

  def clear
    system("clear")
  end

end