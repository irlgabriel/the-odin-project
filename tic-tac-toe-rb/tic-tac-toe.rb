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
  attr_reader :exit, :win, :winner
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
      @@sign == 'X' ? @@sign = 'O' : @@sign = 'X' #swap sign
      win?
    end
  end

  def win?
    #check if anyone won
    #check lines
    @arr.each do |row|
      row.each_with_index do |cell, idx|
        if cell == '[X]' || cell == '[O]'
          if row[idx - 1] == cell && row[idx + 1] == cell
            @win = true
            @winner = cell[1]
          end
        end
      end
    end
    #check columns
    @arr.each_with_index do |row, row_idx|
      row.each_with_index do |cell, col_idx|
        if cell == '[X]' || cell == '[O]'
          if @arr[row_idx - 1][col_idx] == cell && @arr[row_idx + 1][col_idx] == cell
            @win = true
            @winner = cell[1]
          end
        end
      end
    end
    #check diagonals
    @arr.each_with_index do |row, row_idx|
      row.each_with_index do |cell, col_idx|
        if cell == '[X]' || cell == '[O]'
          if (@arr[row_idx - 1][col_idx - 1] == cell && @arr[row_idx + 1][col_idx + 1] == cell) or
             (@arr[row_idx - 1][col_idx + 1] == cell && @arr[row_idx + 1][col_idx - 1] == cell)
            @win = true
            @winner = cell[1]
          end
        end
      end
    end
    #return
    @win
  end

end

def play
  game = TicTacToe.new
  while game.win == false && game.exit == false
    game.show_table
    game.place
  end
  if game.exit == true
    puts "Game quit!"
  end
  if game.win == true
    game.show_table
    puts "Game over. #{game.winner} Won!"
  end
end

play()