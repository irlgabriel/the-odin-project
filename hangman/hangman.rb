
def get_random_word
  words = []
  File.readlines('dict.txt').each do |line|
    line = line.chomp
    words.push(line) if line.length >= 5 && line.length <= 12
  end
  words[(words.length * rand).to_i]
end

class HangMan
  attr_reader :word, :progress
  def initialize
    @word = get_random_word
    @progress = "_ _ _ _ _ _ _ _ _ _ _ _"[0..@word.length * 2 - 2]
    @rounds = 8
  end

  def make_guess
    puts "Choose a letter! (#{@rounds} guesses left!)"
    guess = gets.chomp.downcase[0]
    @rounds -= 1
  end

  def assess_guess(letter)
    @word.split.each do |l
  end

end

game = HangMan.new
