// Greedy solution:

function getProductsOfAllIntsExceptAtIndex(intArray) {
  if (intArray.length < 2) { throw "Need at least 2 integers"; }

  let len = intArray.length;

  let products = [];
  let productSoFar = 1;

  for (let i = 0; i < len; i++) {
    products.push(productSoFar);
    productSoFar *= intArray[i];
  }

  productSoFar = 1;
  for (let i = len - 1; i >= 0; i--) {
    products[i] *= productSoFar;
    productSoFar *= intArray[i];
  }

  return products;
}

// Divison solution:

// function getProductsOfAllIntsExceptAtIndex(intArray) {
//   if (intArray.length < 2) { throw "Need at least 2 integers"; }
//
//   const len = intArray.length;
//   const products = new Array(len).fill(0);
//   let zeroIdx = null;
//
//   let totalProduct = 1;
//   for (let i = 0; i < len; i++) {
//     const el = intArray[i];
//
//     if (el === 0) {
//       if (zeroIdx) { return products; }
//       zeroIdx = i;
//     } else {
//       totalProduct *= el;
//     }
//   }
//
//   if (zeroIdx) {
//     products[zeroIdx] = totalProduct;
//   } else {
//     intArray.forEach((el, i) => {
//       products[i] = totalProduct / el;
//     });
//   }
//
//   return products;
// }







  // Tests

  let desc = 'short array';
  let actual = getProductsOfAllIntsExceptAtIndex([1, 2, 3]);
  let expected = [6, 3, 2];
  assertArrayEquals(actual, expected, desc);

  desc = 'longer array',
  actual = getProductsOfAllIntsExceptAtIndex([8, 2, 4, 3, 1, 5]);
  expected = [120, 480, 240, 320, 960, 192];
  assertArrayEquals(actual, expected, desc);

  desc = 'array has one zero',
  actual = getProductsOfAllIntsExceptAtIndex([6, 2, 0, 3]);
  expected = [0, 0, 36, 0];
  assertArrayEquals(actual, expected, desc);

  desc = 'array has two zeros';
  actual = getProductsOfAllIntsExceptAtIndex([4, 0, 9, 1, 0]);
  expected = [0, 0, 0, 0, 0];
  assertArrayEquals(actual, expected, desc);

  desc = 'one negative number';
  actual = getProductsOfAllIntsExceptAtIndex([-3, 8, 4]);
  expected = [32, -12, -24];
  assertArrayEquals(actual, expected, desc);

  desc = 'all negative numbers';
  actual = getProductsOfAllIntsExceptAtIndex([-7, -1, -4, -2]);
  expected = [-8, -56, -14, -28];
  assertArrayEquals(actual, expected, desc);

  desc = 'error with empty array';
  const emptyArray = () => (getProductsOfAllIntsExceptAtIndex([]));
  assertThrowsError(emptyArray, desc);

  desc = 'error with one number';
  const oneNumber = () => (getProductsOfAllIntsExceptAtIndex([1]));
  assertThrowsError(oneNumber, desc);

  function assertArrayEquals(a, b, desc) {
    const arrayA = JSON.stringify(a);
    const arrayB = JSON.stringify(b);
    if (arrayA !== arrayB) {
      console.log(`${desc} ... FAIL: ${arrayA} != ${arrayB}`)
    } else {
      console.log(`${desc} ... PASS`);
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
