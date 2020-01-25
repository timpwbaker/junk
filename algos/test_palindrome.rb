class TestPalindrome
  attr_reader :string

  def initialize(string)
    @string = string.downcase!.gsub!(/\W/,'')
  end

  def is_palindrome?
    chars = string.chars
    len = string.length

    left = chars.first(len/2)
    right = chars.last(len/2)

    left == right.reverse
  end

  def alternative_palindrome?
    left_i = 0
    right_i = string.length - 1

    while left_i < right_i
      if string[left_i] != string[right_i]
        return false
      end

      left_i += 1
      right_i -= 1
    end

    return true
  end
end

require 'benchmark'

puts Benchmark.measure {
  500_000.times do
   TestPalindrome.new("A man, a plan, a canal, Panama.").is_palindrome? == true
  end
}

puts "**********************"

puts Benchmark.measure {
  500_000.times do
   TestPalindrome.new("A man, a plan, a canal, Panama.").alternative_palindrome? == true
  end
}
