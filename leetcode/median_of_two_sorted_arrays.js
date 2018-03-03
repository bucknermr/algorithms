/**
* @param {number[]} nums1
* @param {number[]} nums2
* @return {number}
*/
var findMedianSortedArrays = function(nums1, nums2) {
  let length = nums1.length + nums2.length;
  let isEven = length % 2 === 0;
  let target = Math.floor(length / 2);

  let i = 0;
  let j = 0;
  let prev;

  while (true) {
    if (j >= nums2.length || nums1[i] < nums2[j]) {
      if (i + j === target) {
        return isEven ? (prev + nums1[i]) / 2 : nums1[i];
      }
      prev = nums1[i];
      i++;
    } else {
      if (i + j === target) {
        return isEven ? (prev + nums2[j]) / 2 : nums2[j];
      }
      prev = nums2[j];
      j++;
    }
  }
};
