dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(user_string, dictionary)
    result = Hash.new(0)
    user_string.gsub!(/[^[:alpha:]\s]/, '')
    user_string = user_string.downcase.split(" ")
    
    user_string.each do |word|
        if dictionary.include?(word)
            result[word] += 1
        end
    end

    puts result
        
end

substrings("Howdy partner, sit down! How's it going?", dictionary)