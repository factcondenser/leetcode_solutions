# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  m = nums1.length
  n = nums2.length
  m, n = [n, m] if n > m

  return m % 2 == 0 ? (nums1[half_m] + (nums1[half_m - 1]))/2.0 : nums1[half_m] if n == 0
  return (nums1.first + nums2.first)/2.0 if n == 1 && m == 1
  if (n == 1 && m == 2)
    return nums1.last if nums2.first > nums1.last
    return nums1.first if nums2.first < nums1.first
    return nums2.first
  end

  half_m = m/2
  mid_nums1 = nums1[half_m]
  half_n = n/2
  mid_nums2 = nums2[half_n]

  if (n == 1)
    if (nums2.first <= mid_nums1)
      nums2.first <= nums1.first ? find_median_sorted_arrays(nums1[0, m - 1], []) : find_median_sorted_arrays(nums1[1, m - 1], nums2)
    else
      nums2.first >= nums1.last ? find_median_sorted_arrays(nums1[1, m - 1], []) : find_median_sorted_arrays(nums1[0, m - 1], nums2)
    end
  end

  if mid_nums2 < mid_nums1
    find_median_sorted_arrays(nums1[0, m - half_n], nums2[half_n, half_n])
  elsif mid_nums2 > mid_nums1
    find_median_sorted_arrays(nums1[half_n, m - half_n], nums2[0, n - half_n])
  else
    nums2.first <= nums1.first ? find_median_sorted_arrays(nums1[0, m - 1], nums2[1, n - 1]) : find_median_sorted_arrays(nums1[1, m - 2], nums2)
  end
end

# def find_median_sorted_arrays(nums1, nums2)
#   unless nums1.nil? || nums1.empty?
#     m = nums1.length
#     half_m = m/2
#     nums1_mid = nums1[half_m]
#   end
#   unless nums2.nil? || nums2.empty?
#     n = nums2.length
#     half_n = n/2
#     nums2_mid = nums2[half_n]
#   end
#   return n % 2 == 0 ? (nums2[half_n] + (nums2[half_n] - 1))/2.0 : nums2[half_n] if nums1.nil? || nums1.empty?
#   return m % 2 == 0 ? (nums1[half_m] + (nums1[half_m] - 1))/2.0 : nums1[half_m] if nums2.nil? || nums2.empty?
#   return (nums1[half_m] + nums2[half_n])/2.0 if m == 1 && n == 1
#   if (m == 1 && n == 2)
#     return nums2.last if nums1.first > nums2.last
#     return nums2.first if nums1.first < nums2.first
#     return nums1.first
#   end
#   if (n == 1 && m == 2)
#     return nums1.last if nums2.first > nums1.last
#     return nums1.first if nums2.first < nums1.first
#     return nums2.first
#   end
#   if nums1_mid >= nums2_mid
#     find_median_sorted_arrays(nums1[0, m - [half_n, n].min], nums2[half_n, half_n])
#   else
#     find_median_sorted_arrays(nums1[half_n + (n % 2 == 0 ? 1 : 0), m - half_n], nums2[0, n - [half_n, m].min])
#   end
# end

# find_median_sorted_arrays([1,2,4], [3])
