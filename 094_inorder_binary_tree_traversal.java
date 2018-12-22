/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
  public List<Integer> inorderTraversal(TreeNode root) {
      List<Integer> result = new ArrayList<>();
      if (root == null) return result;
      
      Stack<TreeNode> toVisit = new Stack<>();
      pushLefts(root, toVisit);
      while (!toVisit.empty()) {
          TreeNode curNode = toVisit.pop();
          result.add(curNode.val);
          pushLefts(curNode.right, toVisit);
      }
      return result;
  }
  
  private void pushLefts(TreeNode node, Stack<TreeNode> stack) {
      while (node != null) {
          stack.push(node);
          node = node.left;
      }
  }
}
