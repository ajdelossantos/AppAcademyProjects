require '../algorithms-data_structures/lib/00_tree_node.rb'

class KnightPathFinder

  def self.valid_moves(pos)
    moves = [[1,2],[2,1],[-1,2],[2,-1],[-1,-2],[-2,-1],[-2,1],[1,-2]]
    # start pos -> add to each move -> return ones between 0 and 7
    moves.map! do |move|
      new_move = []
      unless
      new_move[0] = pos[0] + move[0]
      new_move[1] = pos[1] + move[1]
    end
  end

  def initialize(start_pos)
    @start_pos = start_pos
    @board = Array.new(8) { Array.new(8) }
    @visited_positions = [@start_pos]
    build_move_tree
  end

  def find_path(pos)

  end

  def build_move_tree
    # @move_tree
    # use #new_move_positions
  end

  def new_move_positions(pos)
    # calls KnightPathFinder.valid_moves
    # filters out visited_positions
  end

  # add bracket methods

end
