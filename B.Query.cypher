// Section B: Querying 


// Query 1 
// Find the top 3 most cited papers of each conference.        
        
MATCH (p:paper)-[:p2p_cites]->(pc:paper)
WITH p, count(pc) AS citations
ORDER BY citations DESC
WITH p, citations
MATCH (p)-[:p2e_published_in]->(:edition)-[:e2c_appears_in]->(c:conference)
WITH c, p, citations
ORDER BY c.conference, citations DESC
WITH c, COLLECT({paper: p, citations: citations}) AS most_cited_paper
RETURN c.conference AS conference, most_cited_paper[0..2] AS most_cited_paper_3




// Query 2 
// For each conference find its community: i.e., those authors that have published papers on that conference in, at least, 4 different editions.


MATCH (a:author)-[:a2p_wrote]->(:paper)-[:p2e_published_in]->(e:edition)-[:e2c_appears_in]->
(c:conference)
WITH c, COLLECT(DISTINCT e.city) AS cities
WHERE SIZE(cities) >= 4
RETURN COLLECT(DISTINCT c.conference) AS conference, cities AS editions


// Query 3
// Find the impact factors of the journals in your graph (see https://en.wikipedia.org/wiki/Impact_factor, for the definition of the impact factor)                


// calculate number publications by journal for 2020 and 2021
MATCH (j:journal)<-[:v2j_appears_in]-(v:volume)-[:v2y_occured_in]->(y:year)
WHERE y.year IN ["2020", "2021"]
MATCH (p:paper)-[:p2v_published_in]->(v)
WITH j.journal as Journal, COUNT(DISTINCT p) AS Total_Publications


//calculate number of papers published in 2022 by journal
MATCH (y2:year {year: '2022'})
OPTIONAL MATCH (p2:paper)-[:p2v_published_in]->(v:volume)-[:v2y_occured_in]->(y2)
OPTIONAL MATCH (p2:paper)-[:p2e_published_in]->(e:edition)-[:e2y_occured_in]->(y2)
//Match them up to their cited paper
MATCH (p2:paper)-[:p2p_cites]->(cited:paper)-[:p2v_published_in]->(vol_pub:volume)-[:v2j_appears_in]->(j2:journal)
WITH Journal, j2.journal as Cited_Journal, count(cited) as Citations, Total_Publications
WHERE Journal = Cited_Journal


// Return the ratio for each journal
RETURN Journal, Citations, Total_Publications, (toFloat(Citations) / Total_Publications) AS Citation_Ratio
ORDER BY Citation_Ratio DESC


// Query 4
// Find the h-indexes of the authors in your graph (see https://en.wikipedia.org/wiki/H-index, for a definition of the h-index metric) 


MATCH (a:author)-[:a2p_wrote]->(p:paper)
WITH a.name as Author, count(DISTINCT p) as num_publications
MATCH (a2:author)-[:a2p_wrote]->(p2:paper)
MATCH (p2:paper)<-[:p2p_cites]-(citing:paper)
WITH Author, a2.name as Author2, p2.title as Paper, num_publications, count(citing) as num_citations
WHERE (Author = Author2) AND (num_publications <= num_citations)
RETURN Author,count(Paper) as h_index
ORDER BY h_index DESC