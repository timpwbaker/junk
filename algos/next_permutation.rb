require 'pry'

class NextPermutation
  attr_reader :arr

  def initialize(arr)
    @arr = arr
  end

  def next
    smallest_idx = arr.length - 1 - interesting_parts_of_arr[:smallest_idx]
    idx = arr.length - 2 - interesting_parts_of_arr[:idx]

    arr[smallest_idx], arr[idx] = arr[idx], arr[smallest_idx]

    arr[0..idx].concat(arr[idx+1..-1].sort)
  end

  def interesting_parts_of_arr
    @_interesting_parts_of_arr ||=
      begin
        smallest = arr[0]
        index = 0
        smallest_idx = 0

        arr.reverse.each_with_index do |e, i|
          smallest = e && smallest_idx = i if (!smallest || e < smallest)
          index = i
          next if i == 0

          break unless arr[i+1]

          unless e < arr[i+1]
            break
          end
        end
    end

    {
      smallest_idx: smallest_idx,
      idx: index
    }
  end
end

puts NextPermutation.new([1,0,3,2]).next
