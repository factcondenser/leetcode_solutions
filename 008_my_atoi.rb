# @param {String} str
# @return {Integer}
def my_atoi(str)
  return 0 if str.length == 0

  start = nil
  i = 0
  until start
    start = i if str[i] != ' '
    i += 1
  end

  sign = 1
  if str[start] == '+' || str[start] == '-'
    sign = -1 if str[start] == '-'
    start += 1
  end

  number = []
  (start...str.length).each do |i|
    break unless %w[0 1 2 3 4 5 6 7 8 9].include? str[i]
    number << str[i]
  end

  return 0 if number.length == 0

  result = number.join.to_i * sign
  return 2**31 - 1 if result > 2**31 - 1
  return -2**31 if result < -2**31
  result
end
