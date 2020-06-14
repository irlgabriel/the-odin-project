
class LinkedList
  attr_accessor :size, :head, :tail
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(val)
    #check if there is any element in the list
    node = Node.new(val)
    if @head == nil
      @head = node
    else
      @tail.next_node = node
    end
    @tail = node
    @size += 1
  end

  def prepend(val)
    node = Node.new(val)
    if @head == nil
      @head = node
    else
      node.next_node = @head
      @head = node
    end
    @size += 1
  end

  def at(index)
    temp = @head
    cur_idx = 0
    while cur_idx != index
      temp = temp.next_node
      cur_idx += 1
    end
    temp
  end

  def pop
    if @head == nil
      puts "List is empty"
    end

    if @head == @tail
      @tail = nil
      @head = nil
    else
      current = @head
      while current.next_node != @tail
        current = current.next_node
      end
      current.next_node = nil
    end
    @size -= 1
    @tail = current #returns tail
  end

  def contains?(val)
    temp = @head
    contains = false
    while temp != tail
      contains = true if temp.value == val 
      temp = temp.next_node
      break if contains
    end
    contains
  end

  def find(val)
    index = 0
    temp = @head
    while temp != tail
      return index if temp.value == val
      temp = temp.next_node
      index += 1
    end
    nil
  end

  def to_s
    temp = @head
    until temp.nil? do
      print "( #{temp.value} ) -> "
      temp = temp.next_node
    end
  end

end

class Node
  attr_accessor :next_node, :value

  def initialize(val = nil)
    @value = val
    @next_node = nil
  end

end

list = LinkedList.new
10.times do 
  list.append(rand(10).to_i)
end
#list.pop
#p list.to_s
p list.find(5)
p list.contains?(5)