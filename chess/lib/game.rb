
class Game
  def initialize
    @board = Board.new

    (0..8).each do |x|
      @board[1][x] = Node.new(:white, :pawn)
      @board[6][x] = Node.new(:black, :pawn)
    end

    @board[0][0] = Node.new(:white, :rook)
    @board[0][1] = Node.new(:white, :knight)
    @board[0][2] = Node.new(:white, :bishop)
    @board[0][3] = Node.new(:white, :queen)
    @board[0][4] = Node.new(:white, :king)
    @board[0][5] = Node.new(:white, :bishop)
    @board[0][6] = Node.new(:white, :knight)
    @board[0][7] = Node.new(:white, :rook)

    @board[7][0] = Node.new(:black, :rook)
    @board[7][1] = Node.new(:black, :knight)
    @board[7][2] = Node.new(:black, :bishop)
    @board[7][3] = Node.new(:black, :queen)
    @board[7][4] = Node.new(:black, :king)
    @board[7][5] = Node.new(:black, :bishop)
    @board[7][6] = Node.new(:black, :knight)
    @board[7][7] = Node.new(:black, :rook)
  end
end