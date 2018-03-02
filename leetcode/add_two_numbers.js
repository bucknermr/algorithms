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
  let head = new ListNode(0);
  let currentNode = head;
  let links = [l1, l2];
  let remainder = 0;

  while (links.length > 0) {
    let num = links.reduce((acc, link) => acc + link.val, 0) + remainder;
    let val = num % 10;
    remainder = Math.floor((num - val) / 10);

    currentNode.next = new ListNode(val);
    currentNode = currentNode.next;

    links = links.map(link => link.next).filter(link => link);
  }

  if (remainder) {
    currentNode.next = new ListNode(remainder);
  }

  return head.next;
};
