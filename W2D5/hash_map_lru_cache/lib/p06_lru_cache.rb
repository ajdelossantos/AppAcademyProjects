require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)

    if @map[key]
      update_node!(@map[key])
    else
      calc!(key)
    end

    if count > @max
      eject!
    end

    @map[key].val
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    @store.append(key, @prc.call(key))
    @map[key] = @store.last
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    @store.remove(node.key)
    @store.append(node.key, node.val)
    @map[node.key] = @store.last
    # suggested helper method; move a node to the end of the list
  end

  def eject!
    @store.remove(@store.first.key)
  end
end
