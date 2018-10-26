# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return '' if strs.nil? || strs.length == 0
  prefix = strs.first
  i = 1
  while i < strs.length do
    while strs[i].index(prefix) != 0 do
      prefix = prefix[0..-2]
    end
    i += 1
  end
  prefix
end


# @param {String[]} strs
# @return {String}
# def longest_common_prefix(strs)
#   return '' if !sxtrs[0]
#   char = strs[0][0]
#   new_strs = strs.each_with_object([]) do |str, arr|
#     break if !str[0] || str[0] != char
#     arr << str[1, str.length - 1]
#   end
#   new_strs&.length == strs.length ? char + longest_common_prefix(new_strs) : ''
# end
