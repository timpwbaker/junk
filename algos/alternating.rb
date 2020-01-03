class Alternating
  attr_reader :arr

  def initialize(arr)
    @arr = arr
  end

  def alternative_alternate
    greater = true
    i = 0

    while i < arr.length - 1
      if arr[i] < arr[i + 1] && !greater
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        next
      end

      if arr[i] > arr[i + 1] && greater
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        next
      end

      puts arr.to_s
      i += 1
      greater = !greater
    end

    arr
  end

  def alternate
    sorted = arr.sort
    alternated = []

    while sorted.length > 0
      if sorted.any?
        alternated << sorted.shift
      end

      if sorted.any?
        alternated << sorted.pop
      end
      puts alternated.to_s
    end

    puts alternated.to_s
    alternated
  end

  def validate
    greater = false

    arr.each_with_index do |e, i|
      return true unless arr[i + 1]

      if e > arr[i + 1] && !greater
        return false
      elsif e < arr[i + 1] && greater
        return false
      end

      greater = !greater
    end

    return true
  end
end

puts Alternating.new(Alternating.new([1,5,4,6,3,7,6].shuffle).alternative_alternate).validate
puts Alternating.new([1,5,4,6,3,7,6]).validate
