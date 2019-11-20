#
# @lc app=leetcode id=11 lang=ruby
#
# [11] Container With Most Water
#
# https://leetcode.com/problems/container-with-most-water/description/
#
# algorithms
# Medium (47.55%)
# Total Accepted:    488.7K
# Total Submissions: 1M
# Testcase Example:  '[1,8,6,2,5,4,8,3,7]'
#
# Given n non-negative integers a1, a2, ..., an , where each represents a point
# at coordinate (i, ai). n vertical lines are drawn such that the two endpoints
# of line i is at (i, ai) and (i, 0). Find two lines, which together with
# x-axis forms a container, such that the container contains the most water.
#
# Note: You may not slant the container and n is at least 2.
#
#
#
#
#
# The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In
# this case, the max area of water (blue section) the container can contain is
# 49.
#
#
#
# Example:
#
#
# Input: [1,8,6,2,5,4,8,3,7]
# Output: 49
#
# @param {Integer[]} height
# @return {Integer}
require 'pry'
def max_area_two(height)
  max = 0
  max_height = 0
  max_index = 0

  tallest_two = height.sort.last(2)
  multiplier = (height.index(tallest_two[0]) - height.index(tallest_two[1])).abs
  max = [tallest_two[0], tallest_two[1]].min * multiplier

  height.each_with_index do |n, i|
    next if n < max_height && i < max_index
    next if n * (height.length - i) < max
    starting_point = 0
    starting_point = max/n if max > 0 && n > 0
    other_heights = height[i+starting_point..-1]
    if other_heights
      other_heights.each_with_index do |y, i2|
        vol = [n,y].min * ((i2+starting_point))
        if max < vol
          max = vol
          max_height = [n,y].min
          max_index = i + i2
        end
      end
    end
  end
  max
end

def max_area(height)
  max_index = height.length - 1
  max_vol = 0

  near_candidate_index = 0
  far_candidate_index = max_index

  while near_candidate_index < far_candidate_index
    near_candidate = height[near_candidate_index]
    far_candidate = height[far_candidate_index]
    base = far_candidate_index - near_candidate_index

    vol = [near_candidate, far_candidate].min * base
    max_vol = vol if vol > max_vol

    if near_candidate > far_candidate
      far_candidate_index = far_candidate_index - 1
    else
      near_candidate_index = near_candidate_index + 1
    end
  end

  max_vol
end

# puts max_area([1,8,6,2,5,4,8,3,7])
# puts max_area([1,1,1,1,1,1,1,1,1])
# puts max_area([1,2,3,4,5,6,7,8,9])
puts max_area([136,114,104,156,183,152,66,189,116,94,90,58,10,131,67,85,183,174,174,135,88,79,19,0,15,28,96,95,35,174,38,171,88,142,80,24,95,146,13,163,192,103,21,154,187,40,40,122,167,166,58,7,46,77,7,13,58,56,109,93,182,99,17,23,194,97,47,89,195,12,4,188,68,26,142,7,18,134,129,185,101,187,144,99,17,104,112,75,160,173,120,142,73,89,165,67,138,164,108,134])
