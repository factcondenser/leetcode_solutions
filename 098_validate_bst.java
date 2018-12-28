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
    public boolean isValidBST(TreeNode root) {
        if (root == null) return true;
        
        Integer min = null;
        Integer max = null;
        return helper(root, min, max);
    }
    
    private boolean helper(TreeNode root, Integer min, Integer max) {
        if (root == null) return true;
        if (max != null && root.val >= max) return false;
        if (min != null && root.val <= min) return false;
        if (!(helper(root.left, min, root.val)) || !(helper(root.right, root.val, max))) return false;
        return true;
    }
}
