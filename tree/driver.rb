require_relative 'tree.rb'

#1 create binary tree
tree = Tree.new(Array.new(15) {rand(100)})

#2 balanced?
if tree.balanced?
  puts "Tree is balanced"
else
  puts "Tree is unbalanced"
end

#3 Travesals
p "Preorder: #{tree.preorder}"
p "Inorder: #{tree.inorder}"
p "Postorder: #{tree.postorder}"

#4,5,6,7 Unbalancing and balancing
15.times { tree.insert(rand(200).to_i) }
if tree.balanced?
  puts "Tree is balanced"
else
  puts "Tree is unbalanced"
end
tree.balance!
if tree.balanced?
  puts "Tree is balanced"
else
  puts "Tree is unbalanced"
end

#8 Travesals (again)
p "Preorder: #{tree.preorder}"
p "Inorder: #{tree.inorder}"
p "Postorder: #{tree.postorder}"

