/*
// Definition for a Node.
class Node {
    public int val;
    public List<Node> children;

    public Node() {}

    public Node(int _val,List<Node> _children) {
        val = _val;
        children = _children;
    }
};
*/
class Solution {
  public List<List<Integer>> levelOrder(Node root) {
      List<List<Integer>> result = new ArrayList<>();
      if (root == null) return result;
      
      Queue<Node> toVisit = new LinkedList<>();
      toVisit.add(root);
      
      while (!toVisit.isEmpty()) {
          int length = toVisit.size();
          List<Integer> level = new ArrayList<>();
          for (int i = 0; i < length; i++) {
              Node curNode = toVisit.remove();
              level.add(curNode.val);
              for (Node node : curNode.children) {
                  toVisit.add(node);
              }
          }
          result.add(level);
      }
      return result;
  }
}
