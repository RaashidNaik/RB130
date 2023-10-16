def step(start, finish, increment)
  value = start
  while value <= finish do
    yield(value)
    value += increment
  end
  value
end


step(1, 10, 3) { |value| puts "value = #{value}" }