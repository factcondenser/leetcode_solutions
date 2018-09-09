# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  maxlength = 0
  temp = [0, 0] # [start_pos, length]

  bytes = s.bytes
  bytes.each_index do |i|
    dup_index = bytes[temp.first, temp.last].index(bytes[i])
    if dup_index
      maxlength = temp.last if temp.last > maxlength

      temp[0] += dup_index + 1
      temp[1] -= dup_index
    else
      temp[1] += 1
    end
  end
  temp.last > maxlength ? temp.last : maxlength
end
