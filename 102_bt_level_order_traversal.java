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
  public List<List<Integer>> levelOrder(TreeNode root) {
      List<List<Integer>> result = new ArrayList<>();
      if (root == null) return result;
      
      Queue<TreeNode> toVisit = new LinkedList<>();
      toVisit.add(root);

      while (!toVisit.isEmpty()) {
          int levelLen = toVisit.size();
          ArrayList<Integer> levelList = new ArrayList<>();
          for (int i = 0; i < levelLen; i++) {
              TreeNode node = toVisit.remove();
              levelList.add(node.val);
              if (node.left != null) toVisit.add(node.left);
              if (node.right != null) toVisit.add(node.right);
          }
          result.add(levelList);
      }
      return result;
  }
}
