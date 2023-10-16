require 'pry'

def drop_while(array)
  idx = 0
  loop do
    break if !yield(array[idx]) || idx == array.size
    idx += 1
  end
  array[idx..-1]
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? }  == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true }  == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []