require 'set'
require 'base64'
include Base64

def max_two_each(nums)
  counts = Hash.new(0)
  nums.each_with_object([]) do |n, arr|
    (counts[n] = counts[n] + 1) && arr << n if counts[n] < 3
  end
end

def three_sum(nums)
  # pivot on zero
  # add positives to negatives
  # if negative add positives
  # if positive add negatives
  return [] if nums.length < 3

  nums = max_two_each(nums)

  solutions = []

  num_set = Set.new(nums)
  low_idx = 0
  high_idx = nums.length - 1
  pivot = 0
  while low_idx < high_idx
    n = nums[low_idx]
    if n < pivot
      low_idx += 1
    else
      nums[low_idx], nums[high_idx] = nums[high_idx], nums[low_idx]
      high_idx -= 1
    end
  end

  low_idx += 1 if nums[low_idx] < 0
  negative_end = low_idx
  high_idx = nums.length - 1
  low_idx = low_idx

  while low_idx < high_idx
    n = nums[low_idx]
    if n == pivot
      low_idx += 1
    else
      nums[low_idx], nums[high_idx] = nums[high_idx], nums[low_idx]
      high_idx -= 1
    end
  end

  low_idx += 1 if nums[low_idx] == 0

  positive_start = low_idx
  zero_count = positive_start - negative_end
  solutions << [0,0,0] if zero_count > 2

  positives = nums[positive_start...nums.length]
  negatives = nums[0...negative_end]

  two_sums = []
  negatives.each_with_index do |x, ni|
    positives.each_with_index do |y, pi|
      two_sums << [((x + y) * -1), [ni, pi + positive_start]]
    end
  end

  solution_set = Set.new

  two_sums.each do |pair|
    required = pair[0]
    next unless num_set.include?(required)

    indexes = [pair[1][0], pair[1][1]].sort
    xi = indexes.first
    yi = indexes.last
    remaining = Set.new(nums[0...xi].concat(nums[xi + 1...yi]).concat(nums[yi + 1..-1]))

    possible_solution = [nums[xi], nums[yi], pair[0]].sort
    if remaining.include?(pair[0]) && !solution_set.include?(encode64(possible_solution.pack 'G*'))
      solutions << [nums[xi], nums[yi], pair[0]].sort if remaining.include?(pair[0])
      solution_set.add(encode64(possible_solution.pack 'G*'))
    end
  end

  solutions
end

# puts three_sum([-1, 0, 0, 0, 1, 2, -1, -4]).to_s
# puts three_sum([-1, 0, 1]).to_s
# puts three_sum([-1, 0, 1, 2, -1, -4]).to_s
# puts three_sum([3,-2,1,0]).to_s
# puts three_sum([3,0,3,2,-4,0,-3,2,2,0,-1,-5]).to_s
# puts three_sum([0,0]).to_s
# puts three_sum([1,2,-2,-1]).to_s
puts three_sum([14,-11,-2,-3,4,-3,-3,-8,-15,11,11,-6,-14,-13,5,-10,-13,0,-12,-8,14,-12,-10,2,-4,9,13,10,2,7,-2,-7,4,11,5,-7,-15,10,-7,-14,6,11,-5,7,6,8,5,8,-7,8,-15,14,11,13,1,-15,7,0,10,-14,14,-15,-14,3,4,6,4,4,-7,12,5,14,0,8,7,13,1,-11,-2,9,12,-1,8,0,-11,-5,0,11,2,-13,4,1,-12,5,-10,-1,-12,9,-12,-11,-2,9,-12,5,-6,2,4,10,6,-13,4,3,-7,-11,11,-3,-9,-4,-15,8,-9,-4,-13,-14,8,14]).to_s

require 'pry'
def three_sum(nums)
  two_sums = []

  nums.each_with_index do |x, xi|
    nums.each_with_index do |y, yi|
      next if xi == yi
      two_sums << [(x + y) * -1, [xi, yi]]
    end
  end

  solutions = {}
  two_sums.each do |pair|
    indexes = [pair[1][0], pair[1][1]].sort
    xi = indexes.first
    yi = indexes.last
    remaining = Set.new(nums[0...xi].concat(nums[xi + 1...yi]).concat(nums[yi + 1..-1]))


    if remaining.include?(pair[0])
      arr = [nums[xi], nums[yi], pair[0]].sort

      solutions[arr.join("_")] = [nums[xi], nums[yi], pair[0]].sort
    end
  end

  solutions.values
end
