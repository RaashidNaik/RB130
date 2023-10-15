class Tree
  include Enumerable

  def each
  end

  def <=>
  end
end

new_tree = Tree.new

new_tree.all?
new_tree.map
new_tree.select
new_tree.sort