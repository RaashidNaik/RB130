def divisors(int)
  if int.even?
    last_num = int/2
  else
    last_num = (int/2.0).round
  end
  first_half = (1..last_num).select { |div| int % div == 0 }

  second_half = first_half.map { |num| num * 2 }.select do
    |num| int % num == 0 && !first_half.include?(num)
  end

  result = first_half + second_half
  result << int if int.odd?
  result.sort.uniq
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
a = Time.new
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
b = Time.new
puts "Total time: #{b-a} seconds"