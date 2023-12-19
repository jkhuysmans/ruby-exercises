def caesar_cipher
    puts "Enter prompt:"
    prompt = gets.chomp.to_s

    puts "Enter shift:"
    shift = gets.chomp.to_i

    char_values = prompt.chars
    char_values.map! do |value|
        if value.match(/[a-zA-Z]/) 
            shifted = value.ord + (shift % 26)
            if value.ord.between?(97, 122) 
                shifted > 122 ? (shifted - 26).chr : shifted.chr 
            elsif value.ord.between?(65, 90)
                shifted > 90 ? (shifted - 26).chr : shifted.chr 
            end
        else
            value 
        end
    end
    new_prompt = char_values.join

    puts new_prompt

end

caesar_cipher