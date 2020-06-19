

class Board
  attr_accessor :board
  def initialize
    @board = []
    8.times do 
      row = []
      8.times do
        row << " "
      end
      @board << row
    end
  end
end

