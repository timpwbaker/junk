#
# @lc app=leetcode id=14 lang=ruby
#
# [14] Longest Common Prefix
#
# https://leetcode.com/problems/longest-common-prefix/description/
#
# algorithms
# Easy (34.33%)
# Total Accepted:    584.8K
# Total Submissions: 1.7M
# Testcase Example:  '["flower","flow","flight"]'
#
# Write a function to find the longest common prefix string amongst an array of
# strings.
#
# If there is no common prefix, return an empty string "".
#
# Example 1:
#
#
# Input: ["flower","flow","flight"]
# Output: "fl"
#
#
# Example 2:
#
#
# Input: ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.
#
#
# Note:
#
# All given inputs are in lowercase letters a-z.
#
#
# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.empty?

  sorted = strs.sort
  first = sorted.first
  last = sorted.last

  shortest = if first.length > last.length
               last
             else
               first
             end
  prefix = ""

  shortest.chars.each_with_index do |c, i|
    if first[i] == last[i]
      prefix = prefix + c
    else
      break
    end
  end

  return prefix
end

puts longest_common_prefix(["flower","flow","flight"])
puts longest_common_prefix(["dog","racecar","car"])
puts longest_common_prefix(["","",""])
