
require 'pry'

def shift_char(char, shift) 
  lower = ('a'..'z').to_a
  upper = ('A'..'Z').to_a
  if !(/[a-zA-Z]/.match(char)) 
    char
  else
    if /[a-z]/.match(char)
      lower[(lower.find_index(char) + shift) % 26]
    else
      upper[(upper.find_index(char) + shift) % 26]
    end
  end
end

def caesar_cipher(str, shift)
  p str.split("").map { |char| shift_char(char, shift)}.join
end

puts('enter string to be encrypted')
str = gets.chomp.to_s;

puts('enter number to shift letters by')
shift = gets.chomp.to_i;

caesar_cipher(str, shift)