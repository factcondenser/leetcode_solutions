# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  hsh = {}
  length = 0
  maxlength = 0

  s.split('').each_with_index do |c, i|
    if hsh.value? c
      new_start = hsh.key(c) + 1
      new_keys = [*new_start..i]
      length = new_keys.length
      hsh = Hash[[new_keys, hsh.values_at(*new_keys)].transpose]
    else
      length += 1
      maxlength = length if length > maxlength
    end
    hsh[i] = c
  end

  maxlength
end
