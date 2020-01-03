def three_sum_closest(nums, target)
  if nums.length < 3
    return nil
  end

    sorted = nums.sort
    i = 0
    j = 0
    k = nums.length - 1

    closest = nil

    until i > nums.length
        j = i + 1

        while j < k
            sum = nums[i] + nums[j] + nums[k]

            if closest.nil?
              closest = sum
            elsif closest.abs > (sum - target).abs
              closest = sum
            end
            j += 1
        end
        i += 1
    end

    closest
end
# puts three_sum_closest([-1,2,1,-4], 1)
puts three_sum_closest([0,0,0], 1)
