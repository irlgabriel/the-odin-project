require 'pry'
require 'yaml'
require_relative 'randomizer.rb'

class HangMan
  include Randomizer

  attr_reader :master_word, :rounds, :current_guess, :master_word

  def initialize
    @master_word = get_random_word("dict.txt").downcase
    @rounds = 10
    @letters_used = {}
    @current_guess = "____________"[0..@master_word.length - 1]
    puts "H - A - N - G - M - A - N"
  end

  def guess
    puts "Pick a letter! #{@rounds} attempts left!"
    letter = gets.chomp.downcase
    
    while @letters_used.has_key? letter do
      puts "Letter #{letter} used, pick another one! #{@rounds} attempts left!"
      letter = gets.chomp.downcase
    end

    @letters_used[letter] = 1

    guessed_a_letter = false
    @current_guess.split('').each_with_index do |char, idx|
      if @master_word[idx] == letter
        #if we guess a letter then no rounds should be subtracted!
        guessed_a_letter = true
        @current_guess[idx] = letter
      else
        
      end
    end
    @rounds -= 1 unless guessed_a_letter == true

    puts @current_guess
  end

end

class Game
  attr_reader :game
  def initialize
    @game = HangMan.new
  end

  def play
    while @game.rounds > 0 && @game.master_word != @game.current_guess do
      @game.guess
    end

    #decide if game won or lost
    if @game.master_word == @game.current_guess
      puts "Congratulations, you guessed the word!"
    else
      puts "You lost! The word was #{@game.master_word}!"
    end

  end

  def save_game
    Dir.mkdir 'SaveGames' unless Dir.exists?('SaveGames')
    File.open('SaveGames/save_file', 'w') do |file|
      file.puts YAML.dump(self)
    end
  end

  def load_game
    puts "No saved games available!" if !File.exists?('SaveGames/save_file')
    @game = YAML.load(File.read('SaveGames/save_file'))
  end
end

new_game = Game.new
new_game.play