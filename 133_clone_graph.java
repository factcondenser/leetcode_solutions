/**
 * Definition for undirected graph.
 * class UndirectedGraphNode {
 *     int label;
 *     List<UndirectedGraphNode> neighbors;
 *     UndirectedGraphNode(int x) { label = x; neighbors = new ArrayList<UndirectedGraphNode>(); }
 * };
 */
public class Solution {
  public UndirectedGraphNode cloneGraph(UndirectedGraphNode node) {
      if (node == null) return null;
      
      Map<Integer,UndirectedGraphNode> clones = new HashMap<>();
      return cloneGraphHelper(node, clones);
  }
  
  public UndirectedGraphNode cloneGraphHelper(UndirectedGraphNode node, Map<Integer, UndirectedGraphNode> clones) {
      UndirectedGraphNode clone = new UndirectedGraphNode(node.label);
      
      if (clones.containsKey(clone.label)) {
          return clones.get(clone.label);
      }
      
      clones.put(clone.label, clone);
      for (UndirectedGraphNode neighbor : node.neighbors) {
          clone.neighbors.add(cloneGraphHelper(neighbor, clones));
      }
      return clone;
  }
}
