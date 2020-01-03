require 'pry'

def merge_sort(arr)
  len = arr.length
  if len == 1
    return arr
  end

  left = arr.take(len/2)
  right = arr.drop(len/2)

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

    shortest = if left.first > right.first
                 right.shift
               else
                 left.shift
               end

    sorted << shortest
  end

  sorted
end

# start_arr = (1..1000000).map{|n| n}
# shuff_arr = start_arr.shuffle
# end_arr = merge_sort(shuff_arr)

# puts end_arr == start_arr

puts merge_sort([1,3,2,5,6,4])
