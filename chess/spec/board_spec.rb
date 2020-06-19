require './lib/board.rb'

describe Board do
  describe '#initialize' do
    it 'creates the 2d array for the game table' do
      board = Board.new
      expect(board.board).to eql([
        [" ", " ", " ", " ", " ", " ", " ", " "],
        [" ", " ", " ", " ", " ", " ", " ", " "],
        [" ", " ", " ", " ", " ", " ", " ", " "],
        [" ", " ", " ", " ", " ", " ", " ", " "],
        [" ", " ", " ", " ", " ", " ", " ", " "],
        [" ", " ", " ", " ", " ", " ", " ", " "],
        [" ", " ", " ", " ", " ", " ", " ", " "],
        [" ", " ", " ", " ", " ", " ", " ", " "],
      ])
    end
  end
  describe '#fill_board' do
    it 'fills the board with the chess pieces'
  end
end