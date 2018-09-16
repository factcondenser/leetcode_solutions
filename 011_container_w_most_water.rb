# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  l = 0
  r = height.length - 1
  maxarea = 0
  while l < r
    maxarea = [maxarea, [height[l], height[r]].min * (r - l)].max
    if height[l] > height[r]
      r -= 1
    else
      l += 1
    end
  end
  maxarea
end
