#takes a number and returns an array containing that many numbers from the 
#Fibonacci sequence. Using an example input of 8, 
#this method should return the array [0, 1, 1, 2, 3, 5, 8, 13].

def fibs(n)
    numberA = 0
    numberB = 1
    sum = 0
    result_array = [numberA]
    for i in 1..(n - 1)
        sum = numberA + numberB
        numberA = numberB
        numberB = sum
        result_array.push(numberA)
    end
    return result_array
end

puts "Fibonacci method"
p fibs(7)
p fibs(8)
p fibs(9)

def fibs_rec(n)
    result_array = [0]
    if n == 0
        return result_array
    elsif n == 1
        return result_array.push(1)
    else
        result_array = fibs_rec(n - 1)
        result_array << result_array[-1] + result_array[-2]
    end
end

puts "\nFibonacci recursive method"
p fibs_rec(0)
p fibs_rec(1)
p fibs_rec(7)
p fibs_rec(8)
p fibs_rec(9)