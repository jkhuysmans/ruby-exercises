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

puts "\n Drink count method"
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




