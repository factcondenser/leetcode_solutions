# @param {String} s
# @return {String}
def longest_palindrome(s)
  s_len = s.length
  return s if s_len == 0 || s_len == 1

  result = ''
  res_len = 0

  (0...s_len).each do |i|
    len1 = expand_around_centers(s, i, i)
    len2 = expand_around_centers(s, i, i + 1)
    len = [len1, len2].max

    if len > res_len
      result = s[i - (len - 1) / 2, len]
      res_len = len
    end
  end

  result
end

def expand_around_centers(s, l, r)
  while l >= 0 && r < s.length && s[l] == s[r]
    l -= 1
    r += 1
  end
  r - l - 1
end
