# @param {Integer} x
# @return {Integer}
def reverse(x)
  rev = 0
  int_max = 2**31
  int_min = -(2**31)
  while x != 0
    pop = x % 10
    if x > 0
      x /= 10
    else
      # Ruby's % behaves differently than Java's; could also use Integer#remainder
      pop = x % 10
      pop -= 10 unless pop == 0
      # Ruby's divide returns the floor for negatives
      x = (x / 10.0).ceil
    end
    return 0 if (rev > int_max / 10) || (rev == int_max / 10 && pop > 7) # int_max % 10
    return 0 if (rev < (int_min / 10.0).ceil) || (rev == (int_min / 10.0).ceil && pop < -8) # -(int_min % 10)
    rev = rev * 10 + pop
  end
  rev
end
