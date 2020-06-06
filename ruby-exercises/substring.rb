def substrings(sentence, dict)
  new_hash = {}
  sentence.split(' ').each do |snt|
    dict.each do |word|
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


str = "Howdy partner, sit down! How's it going?"
dict = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substrings(str, dict)