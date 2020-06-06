
require 'pry'

def caesar_cipher(str, shift)
  lower = ('a'..'z').to_a
  upper = ('A'..'Z').to_a
  output = ''
  str.split("").each do |char|
    if !(/[a-zA-Z]/.match(char)) 
      output += char
    else
      if /[a-z]/.match(char)
        output += lower[(lower.find_index(char) + shift) % 26]
      else
        output += upper[(upper.find_index(char) + shift) % 26]
      end
    end
  end
  p output
end

puts('enter string')
str = gets.chomp.to_s;
puts('enter number')
shift = gets.chomp.to_i;
caesar_cipher(str, shift)