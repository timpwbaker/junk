#
# @lc app=leetcode id=2 lang=ruby
#
# [2] Add Two Numbers
#
# https://leetcode.com/problems/add-two-numbers/description/
#
# algorithms
# Medium (32.08%)
# Total Accepted:    1.1M
# Total Submissions: 3.4M
# Testcase Example:  '[2,4,3]\n[5,6,4]'
#
# You are given two non-empty linked lists representing two non-negative
# integers. The digits are stored in reverse order and each of their nodes
# contain a single digit. Add the two numbers and return it as a linked list.
#
# You may assume the two numbers do not contain any leading zero, except the
# number 0 itself.
#
# Example:
#
#
# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.
#
#
#
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  full1 = get_full_number(l1)
  full2 = get_full_number(l2)

  new = full1 + full2

  break_full_number(new)
end

def get_full_number(list_node)
  total = list_node.val
  nxt = list_node.next
  return total if nxt.nil?
  multiplier = 1

  while true
    multiplier = multiplier * 10
    total = total + (nxt.val * multiplier)
    nxt = nxt.next
    break if nxt.nil?
  end

  return total
end

def break_full_number(n)
  devisor = 1
  digit = n%10
  node = ListNode.new(digit)
  first_node = node

  while true
    devisor = devisor * 10
    break if devisor > n

    digit = (n/devisor)%10
    new_node = ListNode.new(digit)
    node.next = new_node
    node = new_node
  end

  return first_node
end

