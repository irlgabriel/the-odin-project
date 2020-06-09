require 'pry'

class MasterMind
  attr_reader :rounds, :win, :exit, :code, :colors

  def initialize
    #get code input
    puts "MASTERMIND"
    puts "6 Colors: Black, White, Red, Yellow, ORANGE, Green"
    retries = 3
    begin
      puts "Enter code to be guessed:"
      code = gets.chomp.upcase
      raise "Code must be 4 'colors' long (eg: RGBW - RED GREEN ORANGE WHITE)" if code.length != 4
      #need to add color checking here too, very important (if we enter a non-color letter the game will never be won)
      raise "Code conatains non-color(B-W-R-Y-O-G only!)" if valid_code?(code) == false
    rescue => exception
      puts exception
      if retries > 0
        retries -= 1
        retry
      end
    end
    @code = code
    #get rounds input
    retries = 3
    begin
      puts "How many rounds(8-12)"
      rounds = gets.chomp.to_i
      raise "Number of rounds must be even" if rounds % 2 == 1 
      raise "Number of rounds must be between 8-12" if rounds < 8 || rounds > 12 
    rescue => exception
      puts exception
      if retries > 0
        retries -= 1
        retry
      end
    end
    @rounds = rounds

    @COLORS = {}
    @code.split('').each do |val|
      if @COLORS.has_key?(val)
        @COLORS[val] += 1
      else
        @COLORS[val] = 1
      end
    end

    @exit = false
    @win = false
  end

  def make_guess
    retries = 3
    begin 
      puts "#{@rounds} rounds left to guess the code"
      puts "Make a guess:"
      guess = gets.chomp.upcase
      raise "Code must be 4 colors long" if code.length != 4
    rescue => e
      puts e
      if retries > 0
        retries -= 1
        retry
      end
    end
    @guess = guess 
    @rounds -= 1
  end

  def assign_guess
    @matching_col = 0
    @matching_pos = 0

    #matching positions
    @guess.split('').each_with_index do |val, idx|
      @matching_pos += 1 if val == @code.split('')[idx]
    end

    #matching colors regardless of positions
    colors = {}
    @COLORS.each_key do |key|
      if colors.has_key?(key)
         colors[key] += 1
      else
        colors[key] = 1
      end
    end

    @guess.split('').each do |col|
      if @COLORS.has_key?(col)
        if colors[col] > 0
          @matching_col += 1 
          colors[col] -= 1
        end
      end
    end
    #check if we win or we lost
    win?
    exit?
    
    puts "You guessed: #{@matching_col} colors and #{@matching_pos} positions."
  end

  def win?
    @win = true if @matching_pos == 4
    puts "You won!" if @win
  end

  def exit?
    @exit = true if @rounds == 0
    puts "You lost!" if @exit
  end

  def valid_code?(code)
    #regexp?
    true #for now.
  end

end

def play
  game = MasterMind.new
  while game.win == false && game.exit == false
    game.make_guess
    game.assign_guess
  end
end


play
