
module Randomizer
  #get random word of length [5,12]
  def get_random_word(file)
    words = []
    File.readlines(file).each do |line|
      words.push(line.chomp) if line.length > 5 && line.length <= 12
    end
    words[(words.length * rand).to_i]
  end
end