def factorial(n)
    if n == 0
      return 1
    else
      return n * factorial(n-1)
    end
end

puts "Factorial method"
puts factorial(3)
puts factorial(6)
puts factorial(12)

def palindrome(string)
    if string.length == 1 || string.length == 0
      true
    else
      if string[0] == string[-1]
        palindrome(string[1..-2])
      else
        false
      end
    end
  end

puts "\nPalindrome method"
puts palindrome("level")
puts palindrome("hello")

def drink_count(n)
    if n == 0
        return "No more bottles on the wall"
    else
        puts "#{n} bottles on the wall"
        drink_count(n - 1)
    end

end

puts "\nDrink count method"
puts drink_count(5)

def fibonacci(n)
    if n == 0
        return 0
    elsif n == 1
        return 1
    else
        return fibonacci(n - 1) + fibonacci(n - 2)
    end
end

puts "\nFibonacci method"
puts fibonacci(5)
puts fibonacci(6)
puts fibonacci(10)

def flatten_array(array, result = [])
    contains_nested_array = array.any? { |element| element.is_a?(Array) }
    if contains_nested_array
        array.each do |element|
            if element.is_a?(Array)
                flatten_array(element, result)
            else
                result << element
            end
        end
    else
        result.concat(array)
    end

    result
end

puts "\nFlatten array method"
p flatten_array([[1, 2], [3, 4]])
p flatten_array([[1, [8, 9]], [3, 4]])

$roman_mapping = {   1000 => "M",   900 => "CM",   500 => "D",   400 => "CD",   100 => "C",   90 => "XC",   50 => "L",   40 => "XL",   10 => "X",   9 => "IX",   5 => "V",   4 => "IV",   1 => "I" }

def integer_to_roman(integer, result = "")
    return result if integer == 0
    value = $roman_mapping.keys.find { |key| key <= integer }
    remaining = integer - value
    $roman_mapping[value] + integer_to_roman(remaining)
end

puts "\nInteger to roman numerals method"
puts integer_to_roman(100)
puts integer_to_roman(46)
puts integer_to_roman(242)

def roman_to_integer(str, result = 0)
    return result if str.empty?
    $roman_mapping.each do |roman, numeral|
      if str.start_with?(numeral)
        result += roman
        str = str.slice(numeral.length, str.length)
        return roman_to_integer(str, result)
      end
    end
end

puts "\nRoman to integer method"
puts roman_to_integer("C")
puts roman_to_integer("XLVI")
puts roman_to_integer("CCXLII")






