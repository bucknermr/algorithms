function highestProductOf3(intArray) {
  if (intArray.length < 3) { throw "Need at least 3 integers"; }

  let highest = Math.max(intArray[0], intArray[1]);
  let lowest = Math.min(intArray[0], intArray[1]);
  let highestProductOfTwo = intArray[0] * intArray[1];
  let lowestProductOfTwo = highestProductOfTwo;
  let currentAnswer = highestProductOfTwo * intArray[2];
  
  for (let i = 2, len = intArray.length; i < len; i++) {
    const currentEl = intArray[i];

    currentAnswer = Math.max(
      currentAnswer,
      highestProductOfTwo * currentEl,
      lowestProductOfTwo * currentEl
    );
    highestProductOfTwo = Math.max(
      highestProductOfTwo,
      highest * currentEl,
      lowest * currentEl
    );
    lowestProductOfTwo = Math.min(
      lowestProductOfTwo,
      lowest * currentEl,
      highest * currentEl
    );
    highest = Math.max(highest, currentEl);
    lowest = Math.min(lowest, currentEl);
  }

  return currentAnswer;
}

console.log(highestProductOf3([3, 4, 2, 6, 100, 0, 1]) === 2400);

// [-10, -5, 3, 4, 2, 1, 8] => -10 * -5 * 8 === 400
console.log(highestProductOf3([-10, -5, 3, 4, 2, 1, 8]) === 400);

// [-299, -4, -1, -12, -3, -5] => -4 * -1 * -3 === -12
console.log(highestProductOf3([-299, -4, -1, -12, -3, -5]) === -12);

// [-299, -4, -1, -12, -3, -5, 0] => -1 * -3 * 0 === 0
console.log(highestProductOf3([-299, -4, -1, -12, -3, -5, 0]) === 0);
