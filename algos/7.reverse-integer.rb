#
# @lc app=leetcode id=7 lang=ruby
#
# [7] Reverse Integer
#
# https://leetcode.com/problems/reverse-integer/description/
#
# algorithms
# Easy (25.53%)
# Total Accepted:    858.3K
# Total Submissions: 3.4M
# Testcase Example:  '123'
#
# Given a 32-bit signed integer, reverse digits of an integer.
#
# Example 1:
#
#
# Input: 123
# Output: 321
#
#
# Example 2:
#
#
# Input: -123
# Output: -321
#
#
# Example 3:
#
#
# Input: 120
# Output: 21
#
#
# Note:
# Assume we are dealing with an environment which could only store integers
# within the 32-bit signed integer range: [−2^31,  2^31 − 1]. For the purpose
# of this problem, assume that your function returns 0 when the reversed
# integer overflows.
#
#
# @param {Integer} x
# @return {Integer}

def reverse(x)
    sign_multiplier = x < 0 ? -1 : 1
    abs = x.abs

    divisor = 1
    digits = []
    while divisor <= abs do
      digit = abs/divisor%10
      digits << digit
      divisor = divisor * 10
    end

    multiplier = 1
    total = 0
    while multiplier <= abs do
      total = total + (digits.pop * multiplier)
      return 0 if total > (2 ** 31) - 1
      multiplier = multiplier * 10
    end

    total * sign_multiplier
end

puts reverse(1534236469)
