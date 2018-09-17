# @param {String} s
# @return {Integer}
def roman_to_int(s)
  dict = { 
    'M' => 1000,
    'D' => 500,
    'C' => 100,
    'L' => 50,
    'X' => 10,
    'V' => 5,
    'I' => 1
  }
  num = 0
  prev_val = 0
  s.chars.reverse_each do |letter|
    val = dict[letter]
    if val >= prev_val
      num += val
    else
      num -= val
    end
    prev_val = val
  end
  num
end
