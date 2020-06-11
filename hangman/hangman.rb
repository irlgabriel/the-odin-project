require 'pry'
require 'yaml'


def get_random_word
  words = []
  File.readlines('dict.txt').each do |line|
    line = line.chomp
    words.push(line) if line.length >= 5 && line.length <= 12
  end
  words[(words.length * rand).to_i]
end


def save_this(obj) 
  Dir.mkdir 'SavedGames' unless Dir.exists? 'SavedGames'
  filename = 'SavedGames/save'
  File.open(filename, 'w') do |file|
    save = YAML.dump(self)
    file.puts save
  end
end


class HangMan
  attr_reader :word, :rounds, :progress
  def initialize
    @word = get_random_word
    @progress = "____________"[0..@word.length - 1]
    @rounds = 8

    puts "Welcome to Command Line Hangman!"
  end

  def show_progress
    prog = ''
    @progress.split('').each do |letter|
      prog += letter + ' '
    end
    puts prog

  end

  def make_guess
    puts "Choose a letter! (#{@rounds} guesses left!)"
    @letter = gets.chomp.downcase
    @letter
  end

  def assess_guess
    decrease_rounds = true
    @word.split('').each_with_index do |letter, idx|
      if @word[idx] == @letter
        @progress[idx] = @letter
        decrease_rounds = false #dont decrease rounds if we guess letter
      end
    end
    @rounds -= 1 if decrease_rounds == true
  end

  def win?
    !progress.include?('_')
  end

end


class Game
  def initialize
    @game = HangMan.new
    @game.show_progress
    @guessed_letters = {}
    @exit = false 

    while @game.rounds > 0 && !@game.win? && @exit == false
      begin
        letter = @game.make_guess  
        raise "Letter already used, chose another one!" if @guessed_letters.has_key?(letter)
      rescue => exception
        puts exception
        retry  
      end

      @guessed_letters[letter] = 1 unless letter == 'save' || letter == 'save'
      if letter == 'save'
        @exit = true
        save_this(self)
      end
      if letter == 'load'
        loaded_game = YAML.load(File.read('SavedGames/save'))
        
      end
      if @exit == false
        @game.assess_guess
        @game.show_progress
      end
    end

    if @exit == false
      if @game.win?
        puts "Congratulations! You guessed the word!"
      else 
        puts "You lost!"
      end
      puts "The word was: #{@game.word}"
      puts "Try Again?(y/n)"
      ans = gets.chomp.downcase
      Game.new if ans == 'y'
    end

  end

end

Game.new