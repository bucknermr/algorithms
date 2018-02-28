# https://www.hackerrank.com/challenges/30-linked-list/problem

def insert(head,value)
  #Complete this method
  return Node.new(value) unless head

  node = head
  node = node.next while node.next
  node.next = Node.new(value)
  
  head
end
