require './lib/tic-tac-toe.rb'

describe TicTacToe do
  it "correctly assesses the winner on the line" do
    game = TicTacToe.new
    game.arr = [["[X]", "[X]", "[X]"],
                ["[O]", "[ ]", "[ ]"],
                ["[O]", "[O]", "[ ]"]]
    game.win?
    expect(game.winner).to eql('X')
  end

  it "correctly assesses the winner on the column" do
    game = TicTacToe.new
    game.arr = [["[O]", "[X]", "[X]"],
                ["[O]", "[ ]", "[X]"],
                ["[O]", "[ ]", "[ ]"]]
    game.win?
    expect(game.winner).to eql('O')
  end

  it "correctly assesses the winner on the 'primary' diagonal" do
    game = TicTacToe.new
    game.arr = [["[O]", "[X]", "[X]"],
                ["[X]", "[O]", "[X]"],
                ["[O]", "[ ]", "[O]"]]
    game.win?
    expect(game.winner).to eql('O')
  end
  
  it "correctly assesses the winner on the 'primary' diagonal" do
    game = TicTacToe.new
    game.arr = [["[X]", "[X]", "[O]"],
                ["[X]", "[O]", "[X]"],
                ["[O]", "[ ]", "[O]"]]
    game.win?
    expect(game.winner).to eql('O')
  end

end
