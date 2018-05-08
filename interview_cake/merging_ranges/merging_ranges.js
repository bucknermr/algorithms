function mergeRanges(meetings) {

  // [
  //  {startTime: 1, endTime: 3},
  // ]

  // i = 1;
  // j = 0;

  // time = {startTime: 1, endTime: 3}
  // curTime = {startTime: 4, endTime: 8}

    // Merge meetings ranges
    const results = [meetings[0]];

    for (let i = 1; i < meetings.length; i++) {
      let curTime = meetings[i];
      let merged = false;

      for (let j = 0; j < results.length; j++) {
        let time = results[j];

        if (!merged && isOverlapping(time, curTime)) {
          results[j] = {
            startTime: Math.min(time.startTime, curTime.startTime),
            endTime: Math.max(time.endTime, curTime.endTime)
          };
          merged = true;
          break;
        } else if (curTime.startTime < time.startTime) {
          results.splice(j, 0, curTime);
          merged = true;
          break;
        }
      }
      if (!merged) { results.push(curTime); }
    }

    return results;
}

function isOverlapping(t1, t2) {
  return (
    isValBetween(t1.startTime, t2.startTime, t2.endTime) ||
    isValBetween(t1.endTime, t2.startTime, t2.endTime) ||
    isValBetween(t2.startTime, t1.startTime, t1.endTime) ||
    isValBetween(t2.endTime, t1.startTime, t1.endTime)
  );
}

function isValBetween(val, x, y) {
  return val >= x && val <= y;
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
