class Quicksort
  attr_accessor :arr

  def initialize(arr)
    @arr = arr
  end

  def sort!
    quicksort(arr)
  end

  def quicksort(arr)
    if arr.length < 2
      return arr
    end

    pivot_start, pivot_end = partition(arr)

    quicksort(arr[0...pivot_start])
      .push(*arr[pivot_start..pivot_end])
      .push(*quicksort(arr[pivot_end+1..-1]))
  end

  def partition(arr)
    len = arr.length

    # Pick a random pivot
    pivot_idx = rand(len)

    # Put your random pivot at the start
    arr[0], arr[pivot_idx] = arr[pivot_idx], arr[0]

    # Initialize variables required for in place pivot
    pivot = arr[0]
    pivot_start = 0
    pivot_end = 0
    low = 1
    high = len - 1

    # Iterate over arr moving pointers in
    while low <= high
      elem = arr[low]

      # If the element if less than the pivot then move it to pivot_start and
      # move pivot_start up by 1.
      if elem < pivot
        arr[pivot_start], arr[low] = arr[low], arr[pivot_start]
        pivot_start += 1
      # If the element is more than the pivot switch it with the top element and
      # move the top element down by 1
      elsif elem > pivot
        arr[high], arr[low] = arr[low], arr[high]
        high -= 1
      # Else the element is the pivot, move the low up by 1, and move the
      # pivot_end up by 1
      else
        low += 1
        pivot_end += 1
      end
    end

    [pivot_start, pivot_end]
  end
end

puts "✅" if Quicksort.new([4,2,3,1,6,5]).sort! == [1,2,3,4,5,6]
puts "✅" if Quicksort.new([5,5,5,5,5]).sort! == [5,5,5,5,5]
puts "✅" if Quicksort.new([4,2,3,1,1,1,6,5]).sort! == [1,1,1,2,3,4,5,6]
