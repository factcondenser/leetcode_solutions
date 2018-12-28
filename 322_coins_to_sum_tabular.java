class Solution {
    public int coinChange(int[] coins, int amount) {
        if (amount <= 0) return 0;
        if (coins.length == 0) return -1;
        
        int[] tab = new int[amount + 1];
        Arrays.fill(tab, amount + 1);
        tab[0] = 0;
        for (int i = 1; i <= amount; i++) {
            for (int coin : coins) {
                if (coin <= i) {
                    tab[i] = Math.min(tab[i], tab[i - coin] + 1);
                }
            }
        }
        return (tab[amount] > amount) ? -1 : tab[amount];
    }
}
