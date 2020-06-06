def substrings(sentence, dict)
  new_hash = {}
  sentence.downcase.split(' ').each do |snt|
    dict.each do |word|
      word.downcase
      if snt.include?(word) 
        if new_hash.has_key?(word)
          new_hash[word] += 1;
        else
          new_hash[word] = 1;
        end
      end    
    end
  end
  return new_hash
end

puts 'enter string'
str = gets.chomp.to_s;
dict = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substrings(str, dict)