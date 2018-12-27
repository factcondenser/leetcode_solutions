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
  public List<TreeNode> generateTrees(int n) {
      if (n == 0) return new ArrayList<>();
      return generateTrees(1, n);
  }
  
  private List<TreeNode> generateTrees(int start, int end) {
      List<TreeNode> allTrees = new ArrayList<>();
      
      // base case
      if (start > end) {
          allTrees.add(null);
          return allTrees;
      }

      // pick a root
      for (int i = start; i <= end; i++) {
          // all possible left subtrees when i is root
          List<TreeNode> leftTrees = generateTrees(start, i - 1);
          // all possible right subtrees when i is root
          List<TreeNode> rightTrees = generateTrees(i + 1, end);
          
          // combine the left and right subtrees (Cartesian product)
          for (TreeNode left : leftTrees) {
              for (TreeNode right : rightTrees) {
                  TreeNode tree = new TreeNode(i);
                  tree.left = left;
                  tree.right = right;
                  allTrees.add(tree);
              }
          }     
      }
      return allTrees;
  }
}
