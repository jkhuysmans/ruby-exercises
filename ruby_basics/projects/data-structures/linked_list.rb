class LinkedList
    attr_accessor :head

    def initialize
        @head = nil
        @count = 0
    end

    def new_node(value)
        @count += 1
        Node.new(value)
    end

    def append(value)
        new_node = new_node(value)
        
        if head.nil?
            @head = new_node
        else
            current = @head
            current = current.next_node while current.next_node
            current.next_node = new_node
        end
    end

    def prepend(value)
        new_node = new_node(value)

        if head.nil?
            @head = new_node
        else
            new_node.next_node = @head
            @head = new_node
        end
    end

    def size
        count = @count
        puts count
    end

    def head_value
        puts @head.value
    end

    def tail_value
        return nil if @head.nil?

        current = @head
        current = current.next_node while current.next_node
        puts current.value
    end

    def at(index)
        return nil if @head.nil?

        current = @head
        for i in 1..index
            current = current.next_node
        end
        puts current.value
    end

    def pop
        return nil if @head.nil?

        current = @head
        prev = nil
        
        while current.next_node
            prev = current
            current = current.next_node
        end

        prev.next_node = nil
    end

    def contains?(input_value)
        input_value = input_value.to_i

        return nil if @head.nil?
        current = @head
        while current
            return true if current.value == input_value
            current = current.next_node
        end
        
        false
    end

    def find(input_value)
        input_value = input_value.to_i
        current = @head
        index = 0
        while current
            return index if current.value == input_value
            current = current.next_node
            index += 1
        end
        "nil"
    end
        
    def to_s
        list_arr = arr.new(0)
        current = @head
        while current
            list_arr << current.value
            current = current.next_node
        end
        list_arr << "nil"
        puts list_arr.join(" -> ")

    end
end

class Node
    attr_accessor :value, :next_node

    def initialize(value = nil)
        @value = value
        @next_node = nil
    end
end

list = LinkedList.new

list.append(5)
list.append(10)
list.append(15)
list.append(20)
list.append(25)
puts "Size of the list"
list.size
puts "\nHead of the list"
list.head_value
puts "\nTail of the list"
list.tail_value
puts "\nReturn node at given index"
list.at(1)
list.at(3)
list.pop
puts "\nCheck if the list contains the input number"
puts list.contains?(5)
puts list.contains?(6)
puts "\nGet the index of the input number if it exists"
puts list.find(15)
puts list.find(12)
puts "\nReturn complete list as a string"
list.to_s

