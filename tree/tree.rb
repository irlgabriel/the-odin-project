require_relative 'node.rb'

class Tree

  def initialize(arr)
    @root = build_tree(arr.uniq.sort)
  end

  def build_tree(arr)
    return nil if arr.empty?
    return Node.new(arr.first) if arr.length < 2
    mid = arr.length / 2
    root = Node.new(arr[mid])
    root.left = build_tree(arr.take(mid))
    root.right = build_tree(arr.drop(mid + 1))
    root
  end

  def insert(val)
    root = @root
    while true
      if val == root.data
        puts "Can't insert duplicate value"
        break
      end
      if val < root.data
        if root.left != nil
          root = root.left
        else #we insert and break
          root.left = Node.new(val)
          break
        end
      else
        if root.right != nil
          root = root.right
        else
          root.right = Node.new(val)
          break
        end
      end    
    end
  end

  def delete(val)
    # ?????/
  end

  def find(val)
    root = @root
    until root.data == val
      root = root.data < val ? root.left : root.right
      return nil if root.nil?
    end
    root
  end

  def level_order(output = [])
    queue = []
    queue << @root
    while !queue.empty?
      root = queue.shift
      output << root.data
      queue << root.left unless root.left.nil?
      queue << root.right unless root.right.nil?
    end
    output
  end

  def preorder(root = @root, output = [])
    return if root.nil?
    output << root.data
    preorder(root.left, output)
    preorder(root.right, output)
    output
  end

  def inorder(root = @root, output = [])
    return if root.nil?
    inorder(root.left, output)
    output << root.data
    inorder(root.right, output)
    output
  end

  def postorder(root = @root, output = [])
    return if root.nil?
    postorder(root.left, output)
    postorder(root.right, output)
    output << root.data
  end
  
  def depth(node = @root) 
    node = self.find(node)
    return "Node doesn't exit" if node.nil?
    find_depth(node)
  end

  def find_depth(node)
    return -1 if node.nil?
    left_depth = find_depth(node.left)
    right_depth = find_depth(node.right)
    left_depth > right_depth ? left_depth + 1 : right_depth + 1
  end

  def balanced?
    (find_depth(@root.left) - find_depth(@root.right)).abs <= 1
  end

  def balance!
    return "Tree is balanced already" if balanced?
    @root = build_tree(level_order.sort.uniq)
  end

end

