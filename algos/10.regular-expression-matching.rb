require "pry"

def is_match(s, p)
  p_index = 0
  s_index = 0

  while s_index <= s.length
    s_idx = s[s_index]
    p_idx = p[p_index]

    binding.pry
    if char_type(p_idx) == :char
      if char_type(p[p_index + 1]) == :star
        p_index = p_index + 1
        next
      elsif p_idx == s_idx
        p_index = p_index + 1
        s_index = s_index + 1
        next
      else
        return false
      end
    end

    if char_type(p_idx) == :dot && char_type(p[p_index + 1]) != :star
      p_index = p_index + 1
      s_index = s_index + 1
      next
    end

    if char_type(p_idx) == :star
      preceeding = p[p_index - 1]
      succeeding = p[p_index + 1]
      interesting = s[s_index]
      max_length = s.length
      tmp_p_index = p_index
      skip = true

      while succeeding == interesting
        max_length = max_length - 1
        tmp_p_index = tmp_p_index + 1
        succeeding = p[tmp_p_index + 1]
      end

      while interesting == preceeding && s_index < max_length
        skip = false
        s_index = s_index + 1
        interesting = s[s_index]
      end

      if skip
        binding.pry
        if p_index - 2 < 0
          p = p[p_index + 1..-1]
        else
          p = p[0..p_index - 2] + p[p_index + 1..-1]
        end
        binding.pry
        p_index = p_index - 1
        next
      end


      p_index = p_index + 1
      next
    end

    if char_type(p_idx) == :dot && char_type(p[p_index + 1]) == :star
      string_index = p_index + 2
      next_string = ""
      type = char_type(p[string_index])

      while type != :dot && type != :star && string_index < p.length
        next_string = next_string + p[string_index]
        string_index = string_index + 1
        type = char_type(p[string_index])
      end

      if string_index == s.length
        s_index = s.length
      end

      found_idx = s.index(next_string, s_index)

      if found_idx
        s_index = found_idx
        p_index = p_index + 2
      else
        return false
      end
    end
  end

  return true
end

def char_type(c)
  if c == "."
    :dot
  elsif c == "*"
    :star
  else
    :char
  end
end

# puts is_match("foobarbaz", "f.*bar.*bat") == false
# puts is_match("foobarbaz", "f.*bar.*baz") == true
# puts is_match("az", ".*") == true
# puts is_match("fooooo", "fo*") == true
# puts is_match("foo", "foo") == true
# puts is_match("foo", "fo.") == true
# puts is_match("aab", "c*a*b") == true
# puts is_match("aaaaaa", "a*") == true
# puts is_match("mississippi", "mis*is*p*.") == false
# puts is_match("a", "aa") == false
# puts is_match("aaa", "a*a") == true
puts is_match("aaa", "ab*a*c*a") == true
# puts is_match("aaa", "ab*ac*a") == true
