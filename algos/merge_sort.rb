require 'pry'
def merge_sort(arr)
  length = arr.length
  if length == 1
    return arr
  end

  left = arr.take(length/2)
  right = arr.drop(length/2)

  left_sorted = merge_sort(left)
  right_sorted = merge_sort(right)

  merge = merge2(left_sorted, right_sorted)
  merge
end

def merge(left, right)
  if left.empty?
    return right
  end

  if right.empty?
    return left
  end

  smallest = if left.first > right.first
               right.shift
             else
               left.shift
             end

  [smallest].concat(merge(left,right))
end

def merge2(left, right)
  sorted = []
  while left.length > 0 || right.length > 0
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


start_arr = (1..1000000).map{|n| n}
shuff_arr = start_arr.shuffle
end_arr = merge_sort(shuff_arr)

puts end_arr == start_arr

# puts merge_sort([1,3,2,5,6,4])
