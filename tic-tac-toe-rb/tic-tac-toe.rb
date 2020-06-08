require 'pry'


module TwoDArrays
  def create_2d_array(size)
    arr = []
    size.times do
      row = []
      size.times do
        row.push("[ ]")
      end
      arr.push(row)
    end
    arr
  end

  def print(arr, size) 
    arr.each do |row|
      p row.join()
    end
  end

end

class TicTacToe 
  include TwoDArrays
  attr_reader :exit, :win
  @@sign = 'X'
  def initialize
    begin
      puts "Choose a grid size(3-10)"
      grid_size = gets.chomp.to_i
        raise "Invalid input. Defaulted to 3" if grid_size < 3 || grid_size > 10
    rescue Exception=>e
      puts "#{e}"
      grid_size = 3
    end

    @grid_size = grid_size
    @arr = create_2d_array(grid_size)
    @win = false
    @exit = false
  end

  def show_table
    print(@arr, @grid_size)
  end

  def valid_pos(row, col)
    row < @grid_size && col < @grid_size && @arr[row][col] == '[ ]'
  end

  def getPos
    retries = 3 #number of attempts
    begin
      puts "Choose a row(#{0..@grid_size}) to place #{@@sign} in: "
      row = gets.chomp.to_i;
      puts "Choose a column(#{0..@grid_size}) to place #{@@sign} in: "
      col = gets.chomp.to_i;
    raise "Invalid Input" if valid_pos(row, col) == false
    rescue Exception=>e
      puts "#{e}"
      if(retries > 0) 
        puts "retries left: #{retries}"
        retries -= 1
        retry
      end
    end
    [row, col]
  end

  def place
    pos = getPos
    row = pos.first
    col = pos.last
    if valid_pos(row, col) == false #quit after 3 false attempts
      @exit = true
    else
      @arr[row][col] = "[#{@@sign}]" #place sign
      @@sign == 'X' ? @@sign = 'O' : @@sign = 'X' #swap sign next player
    end
  end


end


game = TicTacToe.new
while game.win == false && game.exit == false
  game.show_table
  game.place
end