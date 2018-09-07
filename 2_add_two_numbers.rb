class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# def add_two_numbers(l1, l2)
#   return nil unless l1 || l2
#   val1 = l1 ? l1.val : 0
#   val2 = l2 ? l2.val : 0
#   val3 = val1 + val2
#   if val3 < 10
#     l3 = ListNode.new(val3)
#     l3.next = add_two_numbers(l1 ? l1.next : nil, l2 ? l2.next : nil)
#   else
#     l3 = ListNode.new(val3 % 10)
#     l3.next = add_two_numbers(l1 ? l1.next : nil, l2 ? l2.next : nil)
#     if l3.next
#       l3.next.val += 1
#     else
#       l3.next = ListNode.new(1)
#     end
#   end
#   l3
# end

def add_two_numbers(l1, l2)
  p = l1
  q = l2

  carry = 0
  cur = ListNode.new(0)
  init_node = cur # pointer to first node
  while p || q
    val = (p ? p.val : 0) + (q ? q.val : 0) + carry
    if val < 10
      cur.next = ListNode.new(val)
      carry = 0
    else
      cur.next = ListNode.new(val % 10)
      carry = 1
    end
    cur = cur.next
    p &&= p.next
    q &&= q.next
  end
  cur.next = ListNode.new(1) if carry == 1
  init_node.next
end
