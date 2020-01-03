require 'pry'

def sort(arr)
  size = arr.size
  if size == 1
    return arr
  end

  left = arr.take(size/2)
  right = arr.drop(size/2)

  sorted_left = sort(left)
  sorted_right = sort(right)

  merge(sorted_left, sorted_right)
end

def merge(left, right)
  if left.empty?
    return right
  end

  if right.empty?
    return left
  end

  shortest = if left.first < right.first
               left.shift
             else
               right.shift
             end

  [shortest].concat(merge(left, right))
end

puts sort([2,4,1,3,5,6]).to_s
