function getMaxProfit(stockPrices) {
  if (stockPrices.length < 2) {
    throw "Need at least 2 stock prices";
  }
  let min = stockPrices[0];
  let bestProfit = -1 / 0.0;

  for (let i = 1, len = stockPrices.length; i < len; i++) {
    const price = stockPrices[i];
    const profit = price - min;
    if (profit > bestProfit) { bestProfit = profit; }
    if (price < min) { min = price; }
  }

  return bestProfit;
}


















// tests

let desc = 'price goes up then down';
let actual = getMaxProfit([1, 5, 3, 2]);
let expected = 4;
assertEqual(actual, expected, desc);

desc = 'price goes down then up';
actual = getMaxProfit([7, 2, 8, 9]);
expected = 7;
assertEqual(actual, expected, desc);

desc = 'price goes up all day';
actual = getMaxProfit([1, 6, 7, 9]);
expected = 8;
assertEqual(actual, expected, desc);

desc = 'price goes down all day';
actual = getMaxProfit([9, 7, 4, 1]);
expected = -2;
assertEqual(actual, expected, desc);

desc = 'price stays the same all day';
actual = getMaxProfit([1, 1, 1, 1]);
expected = 0;
assertEqual(actual, expected, desc);

desc = 'one price throws error';
const onePrice = () => (getMaxProfit([1]));
assertThrowsError(onePrice, desc);

desc = 'empty array throws error';
const emptyArray = () => (getMaxProfit([]));
assertThrowsError(emptyArray, desc);

function assertEqual(a, b, desc) {
  if (a === b) {
    console.log(`${desc} ... PASS`);
  } else {
    console.log(`${desc} ... FAIL: ${a} != ${b}`)
  }
}

function assertThrowsError(func, desc) {
  try {
    func();
    console.log(`${desc} ... FAIL`);
  } catch (e) {
    console.log(`${desc} ... PASS`);
  }
}
