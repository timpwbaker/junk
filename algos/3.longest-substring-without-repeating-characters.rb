def length_of_longest_substring(s)
  return 1 if s.length == 1
  return 0 if s.length == 0

  window_longest(s)
end

def window_longest(s)
  max = 0
  start_index = -1
  sliding_window = {}

  s.chars.each_with_index do |c, i|
    current_index = sliding_window[c]

    if current_index && current_index > start_index
      start_index = current_index
    end

    sliding_window[c] = i
    new_length = i - start_index
    max = new_length if new_length > max
  end
  max
end

# puts length_of_longest_substring("bbbbbbb") == 1
# puts length_of_longest_substring("bbtablud") == 6
# puts length_of_longest_substring("abcabcabc") == 3
# puts length_of_longest_substring("abcabdcabc") == 4
# puts length_of_longest_substring("dvdf") == 3
# puts length_of_longest_substring("aab") == 2

