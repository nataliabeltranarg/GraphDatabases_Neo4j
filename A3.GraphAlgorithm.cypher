// Section C: Graph Algorithms 
// Will be looking into Similarity Algorithms focus on Node Similarity. 

//Creating Graph Projection
CALL gds.graph.project(
'paperGraph',
'paper',
{
p2p_cites: {
orientation: 'UNDIRECTED'}})

// Node Similarity Algorithm 
CALL gds.nodeSimilarity.stream('paperGraph')
YIELD node1, node2, similarity
RETURN gds.util.asNode(node1).title AS Paper1, gds.util.asNode(node2).title AS Paper2, similarity
ORDER BY similarity DESCENDING, Paper1, Paper2


// Brief explanation of interpretation of Similarity algorithm results 
// High similarity: ~ 1.0 
// Moderate similarity: 0.2 ~ 0.5 
// Low similarity ~ 0.0