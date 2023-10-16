def each_with_index(array)
  idx = 0
  while idx < array.size
    yield(array[idx], idx)
    idx += 1
  end

  array
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]