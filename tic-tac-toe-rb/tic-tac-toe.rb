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
  attr_writer :exit
  @@sign = 'X'
  def initialize
    attempts = 3
    begin
      puts "Choose a grid size(3-10)"
      grid_size = gets.chomp.to_i
      if grid_size < 3 || grid_size > 10
        raise "Invalid input. Try Again"
      end
    rescue Exception=>e
      puts "#{e}"
      if(attempts > 0)
        attempts -= 1
        retry
      end
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

      if valid_pos(row, col) 
        @arr[row][col] = "[#{@@sign}]" #place sign
        @@sign == 'X' ? @@sign = 'O' : @@sign = 'X' #swap sign next player
      else
        raise "Invalid Input"
      end

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

  def put
    pos = getPos
    row = pos.first
    col = pos.last
    if valid_pos(row, col) == false #if false after 3 attempts then we exit
      @exit = true
    end
  end

  def win?
    @win
  end

end


game = TicTacToe.new
while game.win? == false && game.exit == false
  game.show_table
  game.put
end