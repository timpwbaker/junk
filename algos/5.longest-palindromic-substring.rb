#
# @lc app=leetcode id=5 lang=ruby
#
# [5] Longest Palindromic Substring
#
# https://leetcode.com/problems/longest-palindromic-substring/description/
#
# algorithms
# Medium (28.16%)
# Total Accepted:    697.6K
# Total Submissions: 2.5M
# Testcase Example:  '"babad"'
#
# Given a string s, find the longest palindromic substring in s. You may assume
# that the maximum length of s is 1000.
#
# Example 1:
#
#
# Input: "babad"
# Output: "bab"
# Note: "aba" is also a valid answer.
#
#
# Example 2:
#
#
# Input: "cbbd"
# Output: "bb"
#
#
#
# @param {String} s
# @return {String}
require "pry"
def longest_palindrome(s)
  return "" if s == ""
  max_length = s.length/2
  longest = s[0]

  s.chars.each_with_index do |c, i|
    # Either
    #
    # n to the left of i == reverse of n to the right of i
    #
    # or
    #
    # n - 1 to the left of i (excluding i) == n to the right of i (including
    # i)
    (i).downto(longest.length/2).each do |n|
      if s[i-n..i-1] == s[i+1..i+n].reverse
        palindrome = s[i-n..i+n]
        longest = palindrome if palindrome.length > longest.length
        break
      end

      if s[i-n..i-1] == s[i..i+n-1].reverse
        palindrome = s[i-n..i+n-1]
        longest = palindrome if palindrome.length > longest.length
        break
      end
    end
  end
  longest
end

puts longest_palindrome("abb")
puts longest_palindrome("aaaaaasfsdasdfbdbsdfbb")
puts longest_palindrome("aaaa")
puts longest_palindrome("vbbaabb")
puts longest_palindrome("bbacabb")
