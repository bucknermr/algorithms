function mergeRanges(meetings) {
  const sorted = deepCopy(meetings)
    .sort((t1, t2) => t1.startTime - t2.startTime);

  const results = [sorted[0]];

  let lastEndTime = results[0].endTime;

  for (let i = 1; i < sorted.length; i++) {
    let curTime = sorted[i];
    if (lastEndTime >= curTime.startTime) {
      results[results.length - 1].endTime = Math.max(
        lastEndTime,
        curTime.endTime
      );
    } else {
      results.push(curTime);
    }
    lastEndTime = results[results.length - 1].endTime;
  }

  return results;
}

function deepCopy(obj) {
  return JSON.parse(JSON.stringify(obj));
}







// Tests

let desc = 'meetings overlap';
let actual = mergeRanges([{startTime: 1, endTime: 3}, {startTime: 2, endTime: 4}]);
let expected = [{startTime: 1, endTime: 4}];
assertArrayEquals(actual, expected, desc);

desc = 'meetings touch';
actual = mergeRanges([{startTime: 5, endTime: 6}, {startTime: 6, endTime: 8}]);
expected = [{startTime: 5, endTime: 8}];
assertArrayEquals(actual, expected, desc);

desc = 'meeting contains other meeting';
actual = mergeRanges([{startTime: 1, endTime: 8}, {startTime: 2, endTime: 5}]);
expected = [{startTime: 1, endTime: 8}];
assertArrayEquals(actual, expected, desc);

desc = 'meetings stay separate';
actual = mergeRanges([{startTime: 1, endTime: 3}, {startTime: 4, endTime: 8}]);
expected = [{startTime: 1, endTime: 3}, {startTime: 4, endTime: 8}];
assertArrayEquals(actual, expected, desc);

desc = 'multiple merged meetings';
actual = mergeRanges([
  {startTime: 1, endTime: 4},
  {startTime: 2, endTime: 5},
  {startTime: 5, endTime: 8},
]);
expected = [{startTime: 1, endTime: 8}];
assertArrayEquals(actual, expected, desc);

desc = 'meetings not sorted';
actual = mergeRanges([
  {startTime: 5, endTime: 8},
  {startTime: 1, endTime: 4},
  {startTime: 6, endTime: 8},
]);
expected = [{startTime: 1, endTime: 4}, {startTime: 5, endTime: 8}];
assertArrayEquals(actual, expected, desc);

desc = 'sample input';
actual = mergeRanges([
  {startTime: 0, endTime: 1},
  {startTime: 3, endTime: 5},
  {startTime: 4, endTime: 8},
  {startTime: 10, endTime: 12},
  {startTime: 9, endTime: 10},
]);
expected = [
  {startTime: 0, endTime: 1},
  {startTime: 3, endTime: 8},
  {startTime: 9, endTime: 12},
];
assertArrayEquals(actual, expected, desc);

function assertArrayEquals(a, b, desc) {
  const arrayA = JSON.stringify(a);
  const arrayB = JSON.stringify(b);
  if (arrayA !== arrayB) {
    console.log(`${desc} ... FAIL: ${arrayA} != ${arrayB}`)
  } else {
    console.log(`${desc} ... PASS`);
  }
}
