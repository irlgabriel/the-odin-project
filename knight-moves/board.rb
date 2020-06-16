#Implementation copied from https://github.com/rryand/knight_moves/blob/master/classes/graph.rb
#I just couldn't ever figure something like this by myself.


require_relative 'node.rb'

class Board
  attr_accessor :arr
  def initialize
    @nodes = {}
  end

  def build_board
    build_nodes
    build_edges
  end

  def build_nodes
    (0..7).each do |x|
      (0..7).each do |y|
        @nodes[[x,y]] = Node.new([x, y])
      end
    end
  end

  def build_edges
    @nodes.each_key do |x, y|
      [[x + 1, y + 2], [x + 2, y + 1],
       [x + 2, y - 1], [x + 1, y - 2],
       [x - 1, y - 2], [x - 2, y - 1],
       [x - 2, y + 1], [x - 1, y + 2]].each do |x2, y2|
        add_edge([x, y], [x2, y2]) if edge_is_valid?([x, y], [x2, y2])

       end
    end
  end

  def add_edge(node1, node2)
    @nodes[node1].add_edge(@nodes[node2])
    @nodes[node2].add_edge(@nodes[node1])

  end

  def edge_is_valid?(pos1, pos2)
    x2, y2 = pos2
    x2.between?(0, 7) && y2.between?(0, 7) &&
    !@nodes[pos1].adjacent_nodes.include?(pos2)
  end

  def bfs(queue, final, moves = [], parent = {})
    pos = queue.shift
    moves << pos
    return parent if pos == final
    @nodes[pos].adjacent_nodes.each do |child_node|
      unless moves.include?(child_node.pos)
        queue << child_node.pos
        parent[child_node.pos] = pos
      end
    end
    bfs(queue, final, moves, parent)
  end

  def backtrace(parent, initial, final) 
    return initial if parent.empty?
    path = [final]
    while path[-1] != initial
      path << parent[path[-1]]
    end
    path.reverse
  end

  def trace_route(initial, final) 
    queue = [initial]
    parent = bfs(queue, final)
    backtrace(parent, initial, final)
  end

end


board = Board.new
board.build_board
5.times {p board.trace_route([rand(7).to_i, rand(7).to_i], [rand(7).to_i, rand(7).to_i])}