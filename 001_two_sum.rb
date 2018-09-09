# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  hsh = {}
  nums.each_with_index do |num, i|
    complement = target - num
    return [hsh[complement], i] if hsh.key?(complement)
    hsh[num] = i
  end
end
