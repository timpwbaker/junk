#
# @lc app=leetcode id=6 lang=ruby
#
# [6] ZigZag Conversion
#
# https://leetcode.com/problems/zigzag-conversion/description/
#
# algorithms
# Medium (33.79%)
# Total Accepted:    378.7K
# Total Submissions: 1.1M
# Testcase Example:  '"PAYPALISHIRING"\n3'
#
# The string "PAYPALISHIRING" is written in a zigzag pattern on a given number
# of rows like this: (you may want to display this pattern in a fixed font for
# better legibility)
#
#
# P   A   H   N
# A P L S I I G
# Y   I   R
#
#
# And then read line by line: "PAHNAPLSIIGYIR"
#
# Write the code that will take a string and make this conversion given a
# number of rows:
#
#
# string convert(string s, int numRows);
#
# Example 1:
#
#
# Input: s = "PAYPALISHIRING", numRows = 3
# Output: "PAHNAPLSIIGYIR"
#
#
# Example 2:
#
#
# Input: s = "PAYPALISHIRING", numRows = 4
# Output: "PINALSIGYAHRPI"
# Explanation:
#
# P     I    N
# A   L S  I G
# Y A   H R
# P     I
#
#
# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  if s == ""
    return ""
  end
  # numRows added
  # numRows - 2 added diagonally
  # numRows added at index + 3
  # repeat

  @row_max_index = num_rows - 1
  @index = 0
  @chars = s.chars
  @rows = {}
  @output = ""

  (0..@row_max_index).each do |n|
    @rows[n] = []
  end

  while @chars.length > 0
    down
    @index = @index + 1

    accross
  end

  (0..@row_max_index).each do |n|
    @output = @output + @rows[n].reject{|x| x.nil? || x == ''}.join('')
  end

  @output

end

def down
  (0..@row_max_index).each do |n|
    @rows[n][@index] = @chars.shift
  end
end

def accross
  (@row_max_index - 1).downto(1).each do |n|
    @rows[n][@index] = @chars.shift
    @index = @index + 1
  end
end


puts convert("PAYPALISHIRING", 4) == "PINALSIGYAHRPI"
