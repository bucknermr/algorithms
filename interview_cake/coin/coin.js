// Bottom up

// 4, [1, 2, 3]

// let store = {
//   0: 1,
//   1: 1,
//   2: 2,
//   3: 3,
//   4:
// };
//
// let seen = {
//   3
// }

// currentCount = 3
// el = 2

// 1
// 2
// 3
// 4

function changePossibilities(amount, denominations) {
  if (amount === 0) return 1;
  if (denominations.length === 0) return 0;

  let store = { 0: 1 };

  for (let i = 1; i <= amount; i++) {
    let seenRemainder = new Set();
    let count = 0;
    denominations.forEach(coin => {
      let remainder = amount - coin;
      if (remainder >= 0 && remainder in store && !seen.has(remainder)) {
        coint +=
      }
    });
  }

  denominations.forEach(coin => {

  });
}

// Recursive / top-down

// function changePossibilities(amount, denominations) {
//   const store = {};
//
//   for (let i = 0; i <= denominations.length; i++) {
//     store[i] = {};
//   }
//
//   return changePossibilitiesUtil(amount, denominations, 0, store);
// }
//
// function changePossibilitiesUtil(amountLeft, denominations, index, store) {
//   if (amountLeft in store[index]) return store[index][amountLeft];
//   if (amountLeft === 0) return 1;
//   if (index === denominations.length) return 0;
//
//
//
//   const currentDenomination = denominations[index];
//   let count = 0;
//   let currentAmountLeft = amountLeft;
//
//   while (currentAmountLeft >= 0) {
//     count += changePossibilitiesUtil(
//       currentAmountLeft,
//       denominations,
//       index + 1,
//       store
//     );
//     currentAmountLeft -= currentDenomination;
//   }
//
//   store[index][amountLeft] = count;
//   return count;
// }











// Tests

function assertEqual(a, b, desc) {
  if (a === b) {
    console.log(`${desc} ... PASS`);
  } else {
    console.log(`${desc} ... FAIL: ${a} != ${b}`);
  }
}

let desc = 'sample input';
let actual = changePossibilities(4, [1, 2, 3]);
let expected = 4;
assertEqual(actual, expected, desc);

desc = 'one way to make zero cents';
actual = changePossibilities(0, [1, 2]);
expected = 1;
assertEqual(actual, expected, desc);

desc = 'no ways if no coins';
actual = changePossibilities(1, []);
expected = 0;
assertEqual(actual, expected, desc);

desc = 'big coin value';
actual = changePossibilities(5, [25, 50]);
expected = 0;
assertEqual(actual, expected, desc);

desc = 'big target amount';
actual = changePossibilities(50, [5, 10]);
expected = 6;
assertEqual(actual, expected, desc);

desc = 'change for one dollar';
actual = changePossibilities(100, [1, 5, 10, 25, 50]);
expected = 292;
assertEqual(actual, expected, desc);
