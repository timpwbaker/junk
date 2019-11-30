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

    smallest = if left.first < right.first
                 left.shift
               else
                 right.shift
               end

    sorted << smallest
  end

  sorted
end

puts merge_sort([1,4,2,3,6,5])
