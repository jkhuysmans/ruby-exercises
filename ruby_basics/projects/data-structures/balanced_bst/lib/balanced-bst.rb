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
    
    def preorder(node = @root, result = [])
        return [] if node.nil?
    
        result << node.data
        preorder(node.left, result)
        preorder(node.right, result)
    
        result
    end

end

arr = [1, 2, 3, 4, 5, 6, 7]
tree = Tree.new(arr)
root_node = tree.root

p tree.preorder(root_node)

tree.insert(9)

p tree.preorder(root_node)

tree.delete(5)

p tree.preorder(root_node)