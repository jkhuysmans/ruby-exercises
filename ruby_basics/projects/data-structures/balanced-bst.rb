class Node
    attr_accessor :data, :left, :right

    def initialize(data)
        @data = data
        @left = nil
        @right = nil
    end
end

class Tree
    attr_accessor :root

    def initialize(arr)
        @root = build_tree(arr.uniq.sort)
    end
    
    def build_tree(arr)

        return nil if arr.empty?
    
        middle = (arr.length / 2).to_i
        node = Node.new(arr[middle])
        node.left = build_tree(arr[0...middle])
        node.right = build_tree(arr[middle + 1..-1])
        node
    end

    def insert(value)
        @root = insert_recursive(@root, value)
    end

    def insert_recursive(node, value)
        return Node.new(value) if node.nil?

        if value < node.data
            node.left = insert_recursive(node.left, value)
        elsif value > node.data
            node.right = insert_recursive(node.right, value)
        end
        node
    end

    def delete(value)
        @root = delete_recursive(@root, value)
    end

    def delete_recursive(node, value)
        return node if node.nil?
    
        if node.data > value
            node.left = delete_recursive(node.left, value)
        elsif node.data < value
            node.right = delete_recursive(node.right, value)
        else
            if node.left.nil?
                return node.right
            elsif node.right.nil?
                return node.left
            else
                successor_parent = node
                successor = node.right
    
                while !successor.left.nil?
                    successor_parent = successor
                    successor = successor.left
                end
    
                if successor_parent != node
                    successor_parent.left = successor.right
                else
                    successor_parent.right = successor.right
                end
    
                node.data = successor.data
            end
        end
        node
    end

    def find(input_value)
        input_value = input_value.to_i
        find_node(@root, input_value)
    end

    def find_node(node = @root, value)
        return nil if node.nil? 
        
        puts node.data if node.data == value

        if value < node.data
            find_node(node.left, value)
        elsif value > node.data
            find_node(node.right, value)
        end
    end

    def levelorder(node = @root, queue = [], result = [])
        return [] if node.nil?
        
        queue << node
        
        until queue.empty?
            current = queue.shift
            result << current.data
            
            queue << current.left unless current.left.nil?
            queue << current.right unless current.right.nil?
        end
        result
    end

    def preorder(node = @root, result = [])
        return [] if node.nil?
    
        result << node.data
        preorder(node.left, result)
        preorder(node.right, result)
    
        result
    end

    def inorder(node = @root, result = [])
        return [] if node.nil?

        inorder(node.left, result)
        result << node.data
        inorder(node.right, result)

        result
    end

    def postorder(node = @root, result = [])
        return [] if node.nil?

        postorder(node.left, result)
        postorder(node.right, result)
        result << node.data

        result
    end

    def height(node = @root)
        return 0 if node.nil?

        left_height = height(node.left)
        right_height = height(node.right)

        [left_height, right_height].max + 1
    end

    def depth(node, current = @root, depth = 0)
        return depth if current.nil? || current == node
      
        if node < current.data
          depth(node, current.left, depth + 1)
        else
          depth(node, current.right, depth + 1)
        end
    end

    def balanced?(node = @root)
        return true if node.nil?
      
        left_height = height(node.left)
        right_height = height(node.right)
      
        return false if (left_height - right_height).abs > 1
      
        balanced?(node.left) && balanced?(node.right)
    end

    def rebalance
        nodes = inorder(@root)
        @root = build_tree(nodes)
      end

end

arr = (1..20).to_a.shuffle.take(10)
tree = Tree.new(arr)
root_node = tree.root

puts "Level order, preorder, inorder and postorder methods"
p tree.levelorder(root_node)
p tree.inorder(root_node)
p tree.postorder(root_node)
p tree.preorder(root_node)

puts "Insert a node"
tree.insert(9)
p tree.preorder(root_node)
puts "Delete a node"
tree.delete(5)
p tree.preorder(root_node)
puts "Find method"
tree.find(4)
tree.find(11)
puts "Print height"
p tree.height(root_node)
puts "Print depth of a selected node"
p tree.depth(4)
p tree.depth(9)
puts "Is the tree balanced?"
p tree.balanced?

puts "Rebalance the tree"
tree.rebalance
p tree.preorder(root_node)