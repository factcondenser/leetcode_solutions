/**
 * @param {string} s
 * @return {number}
 */
var lengthOfLongestSubstring = function(s) {
  if (s.length == 0) return 0;
  
  var map = {},
      length = 0,
      maxlength = 0;
  
  for (i = 0; i < s.length; i++) {
      char = s[i];
      if (char in map) {
          newPos = map[char] + 1;
          lasti = i;
          i = newPos;
          map = {};
          map[s[i]] = i;
          maxlength = Math.max(length, maxlength);
          length = 1;
      } else {
          map[char] = i;
          length++;
      }
  }
  maxlength = Math.max(length, maxlength);
  
  return maxlength;
};
