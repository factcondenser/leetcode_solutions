class Iterator {
  // Add members here
  private Stack<Node> stack = new Stack<>();

  // Create a constructor for the iterator
  public Iterator(Node root) {
    pushLefts(root);
  }

  public boolean hasNext() {
    return !stack.empty();
  }

  // Returns the next element and advances the iterator. Throw a NoSuchElementException if there is no such element
  public int next() {
    Node tmp = stack.pop();
    Node right = tmp.right;
    pushLefts(right);
    return tmp.val;
  }

  private void pushLefts(Node node) {
    while (node != null) {
      stack.push(node);
      node = node.left;
    }
  }

/* Implement using ArrayList (uses O(N) space) */
//        // Add members here
//        private ArrayList<Integer> list = new ArrayList<>();
//        private java.util.Iterator<Integer> itr;
//
//        // Create a constructor for the iterator
//        public Iterator(Node root) {
//            if (root != null) {
//                populateList(root, list);
//            }
//            itr = list.iterator();
//        }
//
//        private void populateList(Node root, ArrayList<Integer> list) {
//            if (root.left != null) populateList(root.left, list);
//            list.add(root.val);
//            if (root.right != null) populateList(root.right, list);
//        }
//
//        public boolean hasNext() {
//            boolean hasNext;
//            try {
//                hasNext = itr.hasNext();
//            } catch (NullPointerException e) {
//                hasNext = false;
//            }
//            return hasNext;
//        }
//
//        // Returns the next element and advances the iterator. Throw a NoSuchElementException if there is no such element
//        public int next() {
//            return itr.next();
//        }
}
