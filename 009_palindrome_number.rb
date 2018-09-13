# @param {Integer} x
# @return {Boolean}
# def is_palindrome(x)
#   return false if x < 0
#   tmp = x
#   rev = 0
#   while tmp > 0
#     pop = tmp % 10
#     tmp /= 10

#     rev = rev * 10 + pop
#   end
#   x == rev
# end

# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  x >= 0 && x.to_s == x.to_s.reverse
end
