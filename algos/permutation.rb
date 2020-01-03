p = ["a", "b", "c"]
pi = [2, 0, 1]

# puts pi.map{ |n| n = p[n] }

pi.length.times do
  i = pi.shift
  pi << p[i]
end
puts pi
