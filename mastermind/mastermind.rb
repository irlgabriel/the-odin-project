

class MasterMind
  def initialize
    #get code input
    puts "MASTERMIND"
    puts "6 Colors: Black, White, Red, Yellow, Blue, Green"
    retries = 3
    begin
      puts "Enter code to be guessed:"
      code = gets.chomp.upcase
      raise "Code must be 4 'colors' long (eg: RGBW - RED GREEN BLUE WHITE)" if code.length != 4
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
      rounds = gets.chomp.upcase
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

  end

  def make_guess
    retries = 3
    begin 
      puts "#{@rounds} left to guess the code"
      puts "Make a guess:"
      guess = gets.chomp.upcase
      raise "Code must be 4 'colors' long" if code.length != 4
    rescue => e
      puts e
      if retries > 0
        retries -= 1
        retry
      end
    end
    @guess = guess 
  end

  def assign_guess
    matching_characters = 0
    matching_pos = 0
    #matching positions and colors
    @guess.each_with_index do |val, idx|
      matching_pos += 1 if val == @code[idx]
    end
    #matching characters
        
      


  end

end

