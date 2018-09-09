# @param {String} s
# @param {Integer} num_rows
# @return {String}
# def convert(s, num_rows)
#   return s if s.length <= num_rows || num_rows == 1
#   mult = num_rows * 2 - 2
#   rows = Hash.new { |h, k| h[k] = [] }
#   (0...s.length).each do |i|
#     if i % mult > mult / 2
#       rows[mult / 2 - (i % (mult / 2))] << s[i]
#     else
#       rows[i % mult] << s[i]
#     end
#   end
#   rows.values.join
# end

def convert(s, num_rows)
  return s if s.length <= num_rows
  zig_zag_arr = []
  increment = true
  row = 0
  (0...s.length).each do |i|
    increment = false if row == num_rows - 1
    increment = true if row == 0
    zig_zag_arr[row] ? zig_zag_arr[row] += s[i] : zig_zag_arr[row] = s[i]
    increment ? row += 1 : row -= 1
  end
  zig_zag_arr.join('')
end
