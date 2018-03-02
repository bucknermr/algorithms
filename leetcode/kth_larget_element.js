/**
* @param {number[]} nums
* @param {number} k
* @return {number}
*/
var findKthLargest = function(nums, k) {
  let start = 0;
  let end = nums.length - 1;
  const targetIdx = nums.length - k;

  while (true) {
    let idx = findKthLargestUtil(nums, start, end);

    if (idx === targetIdx) {
      return nums[idx];
    } else if (idx > targetIdx) {
      end = idx - 1;
    } else {
      start = idx + 1;
    }
  }

};

function findKthLargestUtil(arr, start, end) {
  const pivotIdx = Math.floor(Math.random() * (end - start)) + start;
  const pivotEl = arr[pivotIdx];
  arrayElementSwap(arr, start, pivotIdx);

  let barrier = start;

  for (let i = start + 1; i <= end; i++) {
    if (arr[i] >= pivotEl) { continue; }

    arrayElementSwap(arr, i, barrier + 1);
    barrier++;
  }

  arrayElementSwap(arr, start, barrier);

  return barrier;
}

function arrayElementSwap(arr, i, j) {
  const swap = arr[i];
  arr[i] = arr[j];
  arr[j] = swap;
}

console.log(findKthLargest([2, 1], 1));
