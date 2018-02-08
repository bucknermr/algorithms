// https://leetcode.com/problems/add-two-numbers/description/

/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
var addTwoNumbers = function(l1, l2) {
    let remainder = 0;
    let headNode;
    let prev = new ListNode(null);
    while (l1 && l2) {
        let val = l1.val + l2.val + remainder;

        if (val > 9) {
            val = val - 10;
            remainder = 1;
        } else {
            remainder = 0;
        }

        let node = new ListNode(val);
        prev.next = node;
        prev = node;
        headNode = headNode || node;

        l1 = l1.next;
        l2 = l2.next;
    }

    let node = l1 || l2;
    if (!node && remainder > 0) {
      prev.next = new ListNode(remainder);
    } else {
      while (node || (remainder > 0)) {
          if (!node) {
              prev.next = new ListNode(remainder);
              break;
          }
          val = node.val + remainder;
          if (val > 9) {
              remainder = 1;
          } else {
              remainder = 0;
          }
          node = new ListNode(val);
          prev.next = node;
          prev = node;
          node = node.next;
      }
    }

    return headNode
};
