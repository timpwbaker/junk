class AddBits
  attr_accessor :arr1, :arr2
  def initialize(s1, s2)
    @arr1 = s1.split("").reverse.map(&:to_i)
    @arr2 = s2.split("").reverse.map(&:to_i)
  end

  def add
    arr1.each_with_index do |e, i|
      if e == 1
        increment_other(i)
      end
    end

    arr2.reverse.join.to_i(2)
  end

  def increment_other(i)
    while true
      if arr2[i] == 1
        arr2[i] = 0
        i += 1
      else
        arr2[i] = 1
        break
      end
    end
  end
end

puts AddBits.new("1001", "1001").add
