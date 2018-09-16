# @param {Integer} num
# @return {String}
def int_to_roman(num)
  dict =
    {
      0 => '',
      1 => 'I',
      2 => 'II',
      3 => 'III',
      4 => 'IV',
      5 => 'V',
      6 => 'VI',
      7 => 'VII',
      8 => 'VIII',
      9 => 'IX'  
    }
  arr = []
  res = ''
  while num > 0
    arr << dict[num % 10]
    num /= 10
  end
  (arr.length - 1).downto(0) do |i|
    res += 
      case i
      when 0
        arr[i]
      when 1
        arr[i].gsub(/X/, 'C').gsub(/I/, 'X').gsub(/V/, 'L') 
      when 2
        arr[i].gsub(/X/, 'M').gsub(/I/, 'C').gsub(/V/, 'D')
      when 3
        arr[i].gsub(/I/, 'M')
      end
  end
  res
end
