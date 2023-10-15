# def one?(collection)
#   (0..(collection.size - 1)).each do |idx1|
#     if yield(collection[idx1])
#       ((idx1 + 1)..(collection.size - 1)).each do |idx2|
#         return false if yield(collection[idx2])
#       end
#       return true
#     end
#   end
#   return false
# end

def one?(collection)
  number_of_trues = 0
  collection.each do |value|
    number_of_trues +=1 if yield(value)
    return false if number_of_trues > 1
  end
  number_of_trues == 1 ? true: false
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false