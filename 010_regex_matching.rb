# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  hsh = {}
  dp = lambda do |i, j|
    hsh[i] = {} if hsh[i].nil?
    if hsh[i][j].nil?
      if j == p.length
        ans = i == s.length
      else
        first_match = i < s.length && [s[i], '.'].include?(p[j])
        ans =
          if j + 1 < p.length && p[j + 1] == '*'
            dp.call(i, j + 2) || first_match && dp.call(i + 1, j)
          else
            first_match && dp.call(i + 1, j + 1)
          end
      end
      hsh[i][j] = ans
    end
    hsh[i][j]
  end
  dp.call(0, 0)
end
