class ReverseWords
  attr_reader :s

  def initialize(s)
    @s = s
  end

  def reverse
    arr = s.split(" ")

    left_idx = 0
    right_idx = arr.length - 1

    while left_idx < right_idx
      arr[left_idx], arr[right_idx] = arr[right_idx], arr[left_idx]
      left_idx += 1
      right_idx -= 1
    end

    arr.join(" ")
  end

  def reverse_in_place
    s.reverse!


    start_idx = 0
    finish_idx = 0

    while true
      if s[finish_idx] == nil
         s[start_idx..finish_idx-1] = s[start_idx..finish_idx-1].reverse!
        break
      end

      if s[finish_idx] == " "
        s[start_idx..finish_idx-1] = s[start_idx..finish_idx-1].reverse!
        start_idx = finish_idx + 1
      end

      finish_idx = finish_idx + 1
    end
    s
  end
end

puts ReverseWords.new("Bob likes Alice").reverse == "Alice likes Bob"
puts ReverseWords.new("Bob likes Alice").reverse_in_place == "Alice likes Bob"
