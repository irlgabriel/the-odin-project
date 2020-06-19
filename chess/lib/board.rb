#
class Board
  def initialize
    @board = []
    8.times do 
      row = []
      8.times do
        row << ""
      end
      @board << row
    end
    @board
  end

  def is_valid(pos)
    pos >= 0 && pos <= 7
  end

  def is_legal(from, to)
    
  end

end