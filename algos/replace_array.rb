require 'pry'

class ReplaceArray
  attr_reader :arr

  def initialize(arr)
    @arr = arr
  end

  def replace
    nils = []
    as = []

    arr.each_with_index do |e, i|
      as << i if e == "a"
      if e == "b"
        arr[i] = nil
        nils << i
      end
    end

    nil_arr_idx = 0

    as.each do |a_idx|
      nil_idx = nils[nil_arr_idx]
      nil_arr_idx += 1

      if !nil_idx
        # shift right to end
        arr[a_idx+1..-1] = arr[a_idx..-1]
      elsif nil_idx > a_idx
        # shift right
        arr[a_idx+1..nil_idx] = arr[a_idx..nil_idx - 1]
      else
        # shift left
        arr[nil_idx..a_idx-1] = arr[nil_idx+1..a_idx]
      end
    end

    arr.map do |e|
      if e == "a"
        "d"
      else
        e
      end
    end
  end

  def alt_replace
    arr.join.gsub!("a", "dd").gsub!("b","").split("")
  end
end

puts ReplaceArray.new(["a", "b", "e", "a", "b", "b", "a", "a", "c"]).replace.to_s
puts ReplaceArray.new(["a", "b", "e", "a", "b", "b", "a", "a", "c"]).alt_replace.to_s
