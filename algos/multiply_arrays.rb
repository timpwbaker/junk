require 'pry'
class MultiplyArrays
  attr_accessor :arr1, :arr2

  def initialize(arr1, arr2)
    @arr1 = arr1.reverse
    @arr2 = arr2.reverse
    @carry = 0
  end

  def multiply
    outputs = []

      if arr1.length > arr2.length
        shortest, longest = arr2, arr1
      else
        longest, shortest = arr2, arr1
      end

    shortest.each_with_index do |n, i|
      output = []

      i.times{ output << 0 }
      longest.each do |x|
        product = (x * n) + @carry
        @carry = 0

        if product > 9
          @carry = product / 10
          output << product % 10
        else
          output << product
        end
      end

      outputs << output
    end

    final = []

    @carry = 0
    outputs.last.each_with_index do |n, i|
      product = outputs.inject(0){|t, output| t = t + output[i].to_i } + @carry
      if product > 9
        @carry = product / 10
        final << product % 10
      else
        @carry = 0
        final << product
      end
    end

    puts final.reverse.to_s
  end
end


MultiplyArrays.new([1,2,3], [1,2,6]).multiply
