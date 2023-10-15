def missing(array)
  missing_array = []

  for num in (array[0]..array[-1])
    missing_array << num unless array.include?(num)
  end

  missing_array
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []