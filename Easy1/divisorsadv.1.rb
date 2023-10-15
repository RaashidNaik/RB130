# with Further exploration
def divisors(int)
  results = []
  1.upto(Integer::sqrt(int)) do |n|
    if int % n == 0
      results << n
      results << int / n
    end
  end
  results.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
a = Time.new
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
b = Time.new
puts "Total time: #{b-a} seconds"