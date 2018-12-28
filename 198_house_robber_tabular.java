class Solution {
    public int rob(int[] nums) {
        if (nums.length == 0) return 0;
        if (nums.length == 1) return nums[0];
        if (nums.length == 2) return Math.max(nums[0], nums[1]);
        if (nums.length == 3) return Math.max(nums[0] + nums[2], nums[1]);
            
        int[] tab = new int[nums.length];
        tab[0] = nums[0];
        tab[1] = Math.max(nums[1], nums[0]);
        tab[2] = Math.max(nums[2] + tab[0], nums[1]);
        for (int i = 3; i < nums.length; i++) {
            tab[i] = Math.max(nums[i] + tab[i - 2], nums[i - 1] + tab[i - 3]);
        }
        return tab[nums.length - 1];
    }
}
