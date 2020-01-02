# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
require 'set'
def four_sum(nums, target)
  required_sums_pairs = {}
  sums_pairs = {}
  nums.each_with_index do |n, ni|
    nums.each_with_index do |x, xi|
      next if xi == ni

      required_key = ((x + n) * - 1) + target
      sum_key = x + n

      required_sums_pairs[required_key] = required_sums_pairs.fetch(required_key, []) << { ni: ni, xi: xi, sum: x + n, diff: required_key }
      sums_pairs[sum_key] = sums_pairs.fetch(sum_key, []) << { ni: ni, xi: xi, sum: x + n }
    end
  end

  index_set = Set.new()

  required_sums_pairs.each do |k, required_sum_pairs|
    relevant_sums = sums_pairs[k]
    next unless relevant_sums

    required_sum_pairs.each do |required_sum_pair|
      relevant_sums.each do |relevant_sum|
        if ([relevant_sum[:ni], relevant_sum[:xi]] | [required_sum_pair[:xi], required_sum_pair[:ni]]).length == 4
          index_set.add([relevant_sum[:ni], relevant_sum[:xi], required_sum_pair[:xi], required_sum_pair[:ni]].sort)
        end
      end
    end
  end

  output_set = Set.new()

  index_set.map do |s|
    output_set.add([nums[s[0]], nums[s[1]], nums[s[2]], nums[s[3]]].sort)
  end.to_s

  output_set.map do |s|
    s
  end
end

puts four_sum([-3,-2,-1,0,0,1,2,3], 0) == [[-3,-2,2,3],[-3,-1,1,3],[-3,0,0,3],[-3,0,1,2],[-2,-1,0,3],[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
