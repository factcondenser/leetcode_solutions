# @param {String} s
# @return {String}
def longest_palindrome(s)
  return s if s == '' || s.length == 1
  result = ''
  hsh = {}
  bytes = s.bytes
  bytes.each_with_index do |b, i|
    hsh.select {|_k, v| v == b}.each do |pos, _char|
      left = pos
      right = i
      temp = ''
      while left < right
        break unless bytes[left] == bytes[right]
        temp << bytes[left]
        left += 1
        right -= 1
      end
      next if left < right
      temp += bytes[left].chr + temp.reverse if left == right
      temp += temp.reverse if left > right
      result = temp if temp.length > result.length
    end
    hsh[i] = b
  end
  result = bytes.first.chr if result == ''
  result
end
