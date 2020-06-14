
class Node
  attr_accessor :data, :left, :right
  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

class Tree
  def initialize(arr)
    @arr = arr
    @root = build_tree(arr, 0, arr.length - 1)
  end
  def build_tree(arr, left, right)
    nil if left > right

    mid = (left + right) / 2
    root = Node.new(arr[mid])
    root.left = build_tree(arr, left, mid)
    root.right = build_tree(arr, mid + 1, right)
    root
  end
end

arr = []
15.times do
  arr.push(rand(15))
end
tree = Tree.new(arr)
puts tree