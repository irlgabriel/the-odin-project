#Game of Connect Four. Colors are represented by number 0 and 1


module TwoDArray
  def create_2d_array(rows = 6, cols = 7)
    arr = []
    rows.times do 
      row = []
      cols.times do
        row << ("[ ]")
      end
      arr << row
    end
    arr
  end

  def print_array(array)
    array.each do |row|
      p row
    end
  end

end


class ConnectFour
  include TwoDArray
  attr_accessor :arr, :winner
  def initialize
    @arr = create_2d_array
    @winner
    @color = 0 #0 is always first 
    puts 'C O N N E C T - F O U R'.center(50)
    puts
    print_board
  end

  def get_pos
    begin
      puts "Enter column to place #{@color} in: "
      col = gets.chomp.to_i
      raise "Column #{col} is full. Select another one." if @arr[0][col] != '[ ]'
    rescue => exception
      puts exception
      retry
    end
    
    [5, col]
  end

  def place(pos = get_pos)
    if @arr[pos.first][pos.last] != '[ ]'
      return place([pos.first - 1, pos.last])
    else
      @arr[pos.first][pos.last] = "[#{@color}]"
      @color = @color == 1 ? 0 : 1
    end
  end

  def print_board(array = @arr)
    print_array(array)
  end

  def win?
    #check for winner on the line
    arr.each do |row|
      @winner = 0 if row.join.include?('[0][0][0][0]')
      @winner = 1 if row.join.include?('[1][1][1][1]')
    end
    return @winner unless @winner == nil

    #check for winner on column
    7.times do |i|
      col = []
      6.times do |j|
        col << @arr[j][i]
      end
      @winner = 0 if col.join.include?('[0][0][0][0]')
      @winner = 1 if col.join.include?('[1][1][1][1]')
    end
    return @winner unless @winner == nil

    #check for winner on 'secondary' diagonal
    @arr.each_with_index do |row, row_idx|
      row.each_with_index do |cell, col_idx|
        if row_idx <= 3 && col_idx >= 3
          if cell != '[ ]'
            @winner = (@arr[row_idx + 1][col_idx - 1] == cell &&
                       @arr[row_idx + 2][col_idx - 2] == cell &&
                       @arr[row_idx + 3][col_idx - 3] == cell
                      ) ? cell[1].to_i : nil
          end
        end
        return @winner unless @winner == nil
      end
    end

    #check for winner on 'primary' diagonal
    @arr.each_with_index do |row, row_idx|
      row.each_with_index do |cell, col_idx|
        if row_idx <= 3 && col_idx <= 3
          if cell != '[ ]'
            @winner = (@arr[row_idx + 1][col_idx + 1] == cell &&
                       @arr[row_idx + 2][col_idx + 2] == cell &&
                       @arr[row_idx + 3][col_idx + 3] == cell
                      ) ? cell[1].to_i : nil
          end
        end
        return @winner unless @winner == nil
      end
    end
  end

end

