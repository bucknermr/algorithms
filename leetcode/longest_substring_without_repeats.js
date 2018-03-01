// https://leetcode.com/problems/longest-substring-without-repeating-characters/description/

/**
* @param {string} s
* @return {number}
*/
var lengthOfLongestSubstring = function(s) {
  if (s.length <= 1) { return s.length; }

  const chars = { [s[0]]: 1};

  let max = 1;

  let i = 0;
  let j = 0;

  while(j < s.length) {
    j++;
    let letter = s[j];
    chars[letter] = ++chars[letter] || 1;
    if (chars[letter] > 1) {
      while(s[i] !== letter) {
        chars[s[i]]--;
        i++;
      }
      chars[s[i]]--;
      i++;
    }
    const len = (j - i + 1);
    max = len > max ? len : max;
  }

  return max;
};
