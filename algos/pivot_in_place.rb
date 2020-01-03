require 'pry'

def pivot(arr, i)
  pivot_val = arr[i]
  less_than_idx = 0
  more_than_idx = arr.length - 1
  next_equal_position = 1

  while less_than_idx < more_than_idx
    if arr[less_than_idx] < pivot_val
      less_than_idx += 1
    else
      arr[less_than_idx], arr[more_than_idx] = arr[more_than_idx], arr[less_than_idx]
      more_than_idx -= 1
    end
  end

  more_than_idx = arr.length - 1

  while less_than_idx < more_than_idx
    if arr[less_than_idx] == pivot_val
      less_than_idx += 1
    else
      arr[less_than_idx], arr[more_than_idx] = arr[more_than_idx], arr[less_than_idx]
      more_than_idx -= 1
    end
  end

  arr
end

puts pivot([3,4,3,2,4,5,3,1,2,3,4,5,3,2], 3)
# puts pivot([3,4,3,2,5,3,1,2,3,5,3,2], 1)
