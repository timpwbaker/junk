class IncrementArray
  attr_accessor :reversed_arr
  attr_accessor :carry

  def initialize(arr)
    @reversed_arr = arr.reverse
    @carry = false
  end

  def increment
    reversed_arr.each_with_index do |n, i|
      if carry == true
        reversed_arr[i] += 1
      end

      if n == 9
        reversed_arr[i] = 0
        carry = true
      else
        reversed_arr[i] += 1
        carry = false
      end

      if carry == false
        break
      else
        deal_with_increment(i)
      end

    end
    reversed_arr.reverse
  end

  def deal_with_increment(i)
    if i == reversed_arr.length - 1
      reversed_arr << 0
    end
  end
end

puts IncrementArray.new([9, 2, 1]).increment
