# @param {String} s
# @return {String}
# def longest_palindrome(s)
#   s_len = s.length
#   return s if s_len == 0 || s_len == 1

#   result = ''
#   res_len = 0

#   (0...s_len).each do |i|
#     len1 = expand_around_centers(s, i, i)
#     len2 = expand_around_centers(s, i, i + 1)
#     len = [len1, len2].max

#     if len > res_len
#       result = s[i - (len - 1) / 2, len]
#       res_len = len
#     end
#   end

#   result
# end

# def expand_around_centers(s, l, r)
#   while l >= 0 && r < s.length && s[l] == s[r]
#     l -= 1
#     r += 1
#   end
#   r - l - 1
# end

# Faster than the other solution b/c it ignores all potential palindromes w/ 
# length <= current longest palindrome's length, but uses more space b/c it
# has to store the reversed substrings for comparison
# @param {String} s
# @return {String}
def longest_palindrome(s)
  return '' if s.length == 0

  len = 1 # length of longest palindrome
  start = 0 # starting index of longest palindrome

  (0...s.length).each do |i|
    # For each new letter encountered in s, there are three possibilities
    if i - len - 1 >= 0 && s[i - len - 1..i] == s[i - len - 1..i].reverse
      # found palindrome that is two chars longer
      start = i - len - 1
      len += 2
    elsif i - len >= 0 && s[i - len..i] == s[i - len..i].reverse
      # found palindrome that is one char longer
      start = i - len
      len += 1
    end
    # didn't find a longer palindrome
  end

  s[start, len]
end
