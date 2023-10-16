require 'pry'

def max_by(array)
  max_block_value = nil
  max_value = nil
  array.each do |value|
    if max_block_value == nil || yield(value) > max_block_value
       max_block_value = yield(value)
       max_value = value
    end
  end
  max_value
end


p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil