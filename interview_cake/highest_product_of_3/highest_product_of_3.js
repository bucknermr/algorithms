function highestProductOf3(intArray) {
  const sorted = intArray.slice().sort((a, b) => {
    return a < b ? -1 : (a > b ? 1 : 0);
  });
  const endIdx = sorted.length - 1;

  const a = sorted[0] * sorted[1] * sorted[endIdx];
  const b = sorted[endIdx - 2] * sorted[endIdx - 1] * sorted[endIdx];

  return a > b ? a : b;
}

// [3, 4, 2, 6, 100, 0, 1] => 4 * 6 * 100 === 2400
console.log(highestProductOf3([3, 4, 2, 6, 100, 0, 1]) === 2400);

// [-10, -5, 3, 4, 2, 1, 8] => -10 * -5 * 8 === 400
console.log(highestProductOf3([-10, -5, 3, 4, 2, 1, 8]) === 400);

// [-299, -4, -1, -12, -3, -5] => -4 * -1 * -3 === -12
console.log(highestProductOf3([-299, -4, -1, -12, -3, -5]) === -12);

// [-299, -4, -1, -12, -3, -5, 0] => -1 * -3 * 0 === 0
console.log(highestProductOf3([-299, -4, -1, -12, -3, -5, 0]) === 0);
