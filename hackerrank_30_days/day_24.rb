# https://www.hackerrank.com/challenges/30-linked-list-deletion/problem

def removeDuplicates(head)
  #write your code here
  current_node = head
  next_node = head.next
  count = { [head.data] => true }

  while next_node
    if count[next_node.data]
      current_node.next = next_node.next
    else
      count[next_node.data] = true
    end
    current_node = next_node
    next_node = current_node.next
  end

  head
end
