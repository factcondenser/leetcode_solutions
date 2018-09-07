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
  cur1 = l1
  cur2 = l2
  hsh1 = {}
  hsh2 = {}
  i = 0
  while cur1
    hsh1[i] = cur1.val
    cur1 = cur1.next
    i += 1
  end
  j = 0
  while cur2
    hsh2[j] = cur2.val
    cur2 = cur2.next
    j += 1
  end

  puts hsh1
  puts hsh2

  add1 = false
  l3 = ListNode.new(0)
  cur3 = l3
  (0..([hsh1.length, hsh2.length].max - 1)).each do |k|
    val = (hsh1[k] || 0) + (hsh2[k] || 0) + (add1 ? 1 : 0)
    if val < 10
      l3.next = ListNode.new(val)
      add1 = false
    else
      l3.next = ListNode.new(val % 10)
      add1 = true
    end
    l3 = l3.next
  end
  l3.next = ListNode.new(1) if add1
  cur3.next
end

# l1 = ListNode.new(8)
# l1.next = ListNode.new(1)
# l2 = ListNode.new(0)
# return add_two_numbers(l1, l2)

# l1 = ListNode.new(1)
# l2 = ListNode.new(9)
# l2.next = ListNode.new(9)
# return add_two_numbers(l1, l2)
