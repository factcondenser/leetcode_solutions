class Solution {
  public int minDistance(String word1, String word2) {
      if (word1.length() == 0 && word2.length() == 0) return 0;
      if (word1.length() == 0) return word2.length();
      if (word2.length() == 0) return word1.length();

      int[][] tab = new int[word1.length() + 1][word2.length() + 1];
      for (int i = 0; i <= word1.length(); i++) {
          tab[i][0] = i;
      }
      for (int j = 0; j <= word2.length(); j++) {
          tab[0][j] = j;
      }
      for (int i = 1; i <= word1.length(); i++) {
          for (int j = 1; j <= word2.length(); j++) {
              if (word1.charAt(i - 1) == word2.charAt(j - 1)) {
                  tab[i][j] = tab[i - 1][j - 1];
              } else {
                  int replace = 1 + tab[i - 1][j - 1];
                  int insert = 1 + tab[i - 1][j];
                  int delete = 1 + tab[i][j - 1];
                  tab[i][j] = Math.min(replace, Math.min(insert, delete));
              }
          }
      }
      return tab[word1.length()][word2.length()];
  }
}
