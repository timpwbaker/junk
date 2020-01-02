require 'pry'
require 'set'
require 'base64'
include Base64

def max_two_each(nums)
  counts = Hash.new(0)
  three_zeros = false
  arr = nums.each_with_object([]) do |n, arr|
    (counts[n] = counts[n] + 1)
    if counts[n] < 3
      arr << n
    end

    if ( n == 0 && counts[n] ==3 )
      three_zeros = true
    end
  end

  [arr, three_zeros]
end

def merge_sort(arr)
  length = arr.length
  if length == 1
    return arr
  end

  left = arr.take(length/2)
  right = arr.drop(length/2)

  sorted_left = merge_sort(left)
  sorted_right = merge_sort(right)

  merge(sorted_left, sorted_right)
end

def merge(left, right)
  sorted = []

  while left.any? || right.any?

    if left.empty?
      sorted << right.shift
      next
    end

    if right.empty?
      sorted << left.shift
      next
    end

    smallest = if left.first > right.first
                 right.shift
               else
                 left.shift
               end

    sorted << smallest
  end

  sorted
end

def three_sum(nums)
  return [] if nums.length < 3

  solutions = Set.new

  nums = merge_sort(nums)


  i = 0

  until i > nums.length - 3
    j = i + 1
    k = nums.length - 1

    while j < k
      sum = nums[i] + nums[j] + nums[k]

      if sum < 0
        j += 1
        next
      elsif sum > 0
        k -= 1
        next
      else
        solutions.add([nums[i], nums[j], nums[k]].sort)
        j += 1
        k -= 1
      end
    end

    i += 1
  end

  solutions.to_a
end

puts three_sum([-1, 0, 0, 0, 1, 2, -1, -4]).to_s
puts three_sum([0,0,0]).to_s
puts three_sum([-1, 0, 1]).to_s
# puts three_sum([-1, 0, 1, 2, -1, -4]).to_s
# puts three_sum([3,-2,1,0]).to_s
# puts three_sum([3,0,3,2,-4,0,-3,2,2,0,-1,-5]).to_s
# puts three_sum([0,0]).to_s
# puts three_sum([1,2,-2,-1]).to_s
# puts three_sum([14,-11,-2,-3,4,-3,-3,-8,-15,11,11,-6,-14,-13,5,-10,-13,0,-12,-8,14,-12,-10,2,-4,9,13,10,2,7,-2,-7,4,11,5,-7,-15,10,-7,-14,6,11,-5,7,6,8,5,8,-7,8,-15,14,11,13,1,-15,7,0,10,-14,14,-15,-14,3,4,6,4,4,-7,12,5,14,0,8,7,13,1,-11,-2,9,12,-1,8,0,-11,-5,0,11,2,-13,4,1,-12,5,-10,-1,-12,9,-12,-11,-2,9,-12,5,-6,2,4,10,6,-13,4,3,-7,-11,11,-3,-9,-4,-15,8,-9,-4,-13,-14,8,14]).to_s
