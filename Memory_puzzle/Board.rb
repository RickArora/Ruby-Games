class Board

  def initialize(array_of_cards)
    render
  end

  def render
    p "0 1 2 3"
    p "0\n 1\n 2\n 3\n 4"
    #while array_of_cards != 0
    #end
  end

  def won?
  end

  def reveal
  end

end

Board = Board.new([1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12])
