class UniformDistributor
  attr_reader :elements, :probabilities

  def initialize(elements, probabilities)
    @elements = elements
    @probabilities = probabilities
  end

  def distribute(n)
    distribution = elements.map{|n| 0}

    (0...n).map do |x|
      idx = buckets.index{|b| b > rand }
      distribution[idx] = distribution[idx] + 1
    end

    distribution
  end

  def buckets
    @buckets ||=
      begin
        count = 0

        probabilities.map do |p|
          count = count + p
          count
        end
      end
  end
end

puts UniformDistributor.new([1,2,3,4,5], [1/2r,1/2r,0/1r,0/1r,0/1r]).buckets == [1/2r,1/1r,1/1r,1/1r,1/1r]
puts UniformDistributor.new([1,2,3,4,5], [1/1r,0/1r,0/1r,0/1r,0/1r]).distribute(5) == [5,0,0,0,0]
