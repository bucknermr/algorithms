// https://leetcode.com/problems/longest-substring-without-repeating-characters/description/

/**
* @param {string} s
* @return {number}
*/


// Optimized solution:

var lengthOfLongestSubstring = function(s) {
    const chars = {};
    let max = 0;

    for (let i = 0, j = 0; j < s.length; j++) {
        const letter = s[j];
        if (chars.hasOwnProperty(letter)) {
            i = Math.max(i, chars[letter] + 1);
        }
        chars[letter] = j;
        max = Math.max(max, j - i + 1);
    }

    return max;
};


// var lengthOfLongestSubstring = function(s) {
//   if (s.length <= 1) { return s.length; }
//
//   const chars = { [s[0]]: 1};
//
//   let max = 1;
//
//   let i = 0;
//   let j = 1;
//
//   while(j < s.length) {
//     let letter = s[j];
//     chars[letter] = ++chars[letter] || 1;
//     if (chars[letter] > 1) {
//       while(s[i] !== letter) {
//         chars[s[i]]--;
//         i++;
//       }
//       chars[s[i]]--;
//       i++;
//     }
//     const len = (j - i + 1);
//     max = len > max ? len : max;
//     j++;
//   }
//
//   return max;
// };
