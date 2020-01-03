#
# @lc app=leetcode id=8 lang=ruby
#
# [8] String to Integer (atoi)
#
# https://leetcode.com/problems/string-to-integer-atoi/description/
#
# algorithms
# Medium (14.84%)
# Total Accepted:    440.9K
# Total Submissions: 3M
# Testcase Example:  '"42"'
#
# Implement atoi which converts a string to an integer.
#
# The function first discards as many whitespace characters as necessary until
# the first non-whitespace character is found. Then, starting from this
# character, takes an optional initial plus or minus sign followed by as many
# numerical digits as possible, and interprets them as a numerical value.
#
# The string can contain additional characters after those that form the
# integral number, which are ignored and have no effect on the behavior of this
# function.
#
# If the first sequence of non-whitespace characters in str is not a valid
# integral number, or if no such sequence exists because either str is empty or
# it contains only whitespace characters, no conversion is performed.
#
# If no valid conversion could be performed, a zero value is returned.
#
# Note:
#
#
# Only the space character ' ' is considered as whitespace character.
# Assume we are dealing with an environment which could only store integers
# within the 32-bit signed integer range: [−2^31,  2^31 − 1]. If the numerical
# value is out of the range of representable values, INT_MAX (2^31 − 1) or
# INT_MIN (−2^31) is returned.
#
#
# Example 1:
#
#
# Input: "42"
# Output: 42
#
#
# Example 2:
#
#
# Input: "   -42"
# Output: -42
# Explanation: The first non-whitespace character is '-', which is the minus
# sign.
# Then take as many numerical digits as possible, which gets 42.
#
#
# Example 3:
#
#
# Input: "4193 with words"
# Output: 4193
# Explanation: Conversion stops at digit '3' as the next character is not a
# numerical digit.
#
#
# Example 4:
#
#
# Input: "words and 987"
# Output: 0
# Explanation: The first non-whitespace character is 'w', which is not a
# numerical
# digit or a +/- sign. Therefore no valid conversion could be performed.
#
# Example 5:
#
#
# Input: "-91283472332"
# Output: -2147483648
# Explanation: The number "-91283472332" is out of the range of a 32-bit signed
# integer.
# Thefore INT_MIN (−2^31) is returned.
#
#
# @param {String} str
# @return {Integer}

SIGNED_MAX = (2 ** 31)
DEFAULT_SIGN_MULTIPLIER = 1

def provided_sign_multiplier(str)
  c = str[0]

  if c == "-"
     -1
  elsif c == "+"
     1
  end
end

def max(sign_multiplier)
  final_action = 0
  final_action = -1 if sign_multiplier == 1

  SIGNED_MAX * sign_multiplier + final_action
end

def my_atoi(str)
  str.strip!
  sign_multiplier = provided_sign_multiplier(str)
  str[0] = '' if sign_multiplier
  sign_multiplier = sign_multiplier || DEFAULT_SIGN_MULTIPLIER


  digits = []
  str.chars.each do |c|
    try_int = c.to_i
    if c == "0"
      digits << 0
    elsif c != " " && try_int != 0
      digits << try_int
    else
      break
    end
  end

  multiplier = 1
  total = 0
  while digits.length > 0
    total = total + (digits.pop * multiplier)
    if total >= SIGNED_MAX
      return max(sign_multiplier)
    end
    multiplier = multiplier * 10
  end

  total * sign_multiplier
end

puts my_atoi("2147483648")

