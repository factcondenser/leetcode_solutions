# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  m = nums1.length
  n = nums2.length
  if n < m
    m, n, nums1, nums2 = [n, m, nums2, nums1]
  end

  imin, imax, half_length = 0, m, (m + n + 1) / 2
  while imin <= imax
    i = (imin + imax) / 2
    j = half_length - i
    if i > 0 && (nums1[i - 1] > nums2[j])
      # i is too big
      imax = i - 1
    elsif i < m && (nums2[j - 1] > nums1[i])
      # i is too small
      imin = i + 1
    else
      # i is perfect
      max_of_left =
        if i == 0
          nums2[j - 1]
        elsif j == 0
          nums1[i - 1]
        else
          [nums1[i - 1], nums2[j - 1]].max
        end

      return max_of_left if (m + n).odd?

      min_of_right =
        if i == m
          nums2[j]
        elsif j == n
          nums1[i]
        else
          [nums1[i], nums2[j]].min
        end

      return (max_of_left + min_of_right) / 2.0
    end
  end
end
