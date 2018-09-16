# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  hsh = {}
  dp = lambda do |i, j|
    unless hsh.key? [i, j]
      if j == p.length
        ans = i == s.length
      else
        first_match = i < s.length && [s[i], '.'].include?(p[j])
        if j + 1 < p.length && p[j + 1] == '*'
          ans = dp.call(i, j + 2) || first_match && dp.call(i + 1, j)
        else
          ans = first_match && dp.call(i + 1, j + 1)
        end
      end
      puts hsh.inspect
      hsh[[i, j]] = ans
    end
    hsh[[i, j]]
  end
  dp.call(0, 0)
end
