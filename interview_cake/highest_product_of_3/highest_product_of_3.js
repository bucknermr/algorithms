// function highestProductOf3(intArray) {
//   const sorted = intArray.slice().sort((a, b) => a - b);
//   const endIdx = sorted.length - 1;
//
//   const a = sorted[0] * sorted[1] * sorted[endIdx];
//   const b = sorted[endIdx - 2] * sorted[endIdx - 1] * sorted[endIdx];
//
//   return a > b ? a : b;
// }
function highestProductOf3(intArray) {
  if (intArray.length < 3) { throw 'Need at least 3 integers'; }
  const minHeap = new BinaryHeap;
  const maxHeap = new BinaryHeap((a, b) => b - a);
  for (let i = 0; i < 3; i++) {
    minHeap.add(intArray[i]);
    maxHeap.add(intArray[i]);
  }
  maxHeap.extract();
  for (let i = 3, len = intArray.length; i < len; i++) {
    minHeap.add(intArray[i]);
    minHeap.extract();
    maxHeap.add(intArray[i]);
    maxHeap.extract();
  }

  const a = minHeap.store.reduce((acc, n) => acc * n);
  for (let i = 0; i < 2; i++) { minHeap.extract(); }
  const b = maxHeap.store.reduce((acc, n) => acc * n) * minHeap.peek();
  return Math.max(a, b);
}

class BinaryHeap {
  constructor(comp = (a, b) => a - b) {
    this.comp = comp;
    this.store = [];
  }

  add(el) {
    if (arguments.length !== 1) { throw "Expected 1 argument"; }
    this.store.push(el);
    return this.heapifyUp(this.store.length - 1);
  }

  peek() {
    return this.store[0];
  }

  extract() {
    const top = this.store[0];
    this.store[0] = this.store[this.store.length - 1];
    this.store.pop();
    this.heapifyDown(0, this.store, this.comp);
    return top;
  }

  heapifyDown(idx) {
    return BinaryHeap.heapifyDown(idx, this.store, this.comp);
  }

  heapifyUp(idx) {
    return BinaryHeap.heapifyUp(idx, this.store, this.comp);
  }

  static heapifyDown(idx, store, comp) {
    const currentEl = store[idx];
    const childIndices = BinaryHeap.childIndices(idx);
    const children = childIndices.map(i => store[i]);

    if (children.some(el => comp(currentEl, el) > 0)) {
      const swapIdx = (children.length > 1 && comp(...children) > 0) ?
        childIndices[1] : childIndices[0];
      [store[idx], store[swapIdx]] = [store[swapIdx], currentEl];
      return BinaryHeap.heapifyDown(swapIdx, store, comp);
    }
    return store;
  }

  static heapifyUp(idx, store, comp) {
    const currentEl = store[idx];
    const parentIndex = BinaryHeap.parentIndex(idx);
    if (parentIndex === null ) { return store; }
    const parentEl = store[parentIndex];
    if (comp(parentEl, currentEl) > 0) {
      [store[idx], store[parentIndex]] = [parentEl, currentEl];
      return BinaryHeap.heapifyUp(parentIndex, store, comp);
    }
    return store;
  }

  static childIndices(idx) {
    return [(idx * 2) + 1, (idx * 2) + 2];
  }

  static parentIndex(idx) {
    if (idx === 0) { return null; }
    return Math.floor((idx - 1) / 2);
  }
}

// [3, 4, 2, 6, 100, 0, 1] => 4 * 6 * 100 === 2400
console.log(highestProductOf3([3, 4, 2, 6, 100, 0, 1]) === 2400);

// [-10, -5, 3, 4, 2, 1, 8] => -10 * -5 * 8 === 400
console.log(highestProductOf3([-10, -5, 3, 4, 2, 1, 8]) === 400);

// [-299, -4, -1, -12, -3, -5] => -4 * -1 * -3 === -12
console.log(highestProductOf3([-299, -4, -1, -12, -3, -5]) === -12);

// [-299, -4, -1, -12, -3, -5, 0] => -1 * -3 * 0 === 0
console.log(highestProductOf3([-299, -4, -1, -12, -3, -5, 0]) === 0);
