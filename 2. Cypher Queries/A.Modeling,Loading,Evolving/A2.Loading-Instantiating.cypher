//Section A.2: Loading/Instantiating
// Loading the synthetic DATA from the CSV into Neo4j

// NODES 

// Load nodes from authors.csv
LOAD CSV WITH HEADERS FROM 'file:///author.csv' AS row
CREATE (:author {name: row.name})
// Checking properly imported the nodes for authors.csv 
MATCH (a:author)
RETURN a
LIMIT 10


// Load nodes from conference.csv
LOAD CSV WITH HEADERS FROM 'file:///conference.csv' AS row
CREATE (:conference {conference: row.conference})
// Checking properly imported the nodes for conference.csv
MATCH (c:conference)
RETURN c
LIMIT 2


// Load nodes from edition.csv
LOAD CSV WITH HEADERS FROM 'file:///edition.csv' AS row
CREATE (:edition {city: row.city})
// Checking properly imported the nodes for edition.csv
MATCH (e:edition)
RETURN e
LIMIT 10


// Load nodes from journal.csv
LOAD CSV WITH HEADERS FROM 'file:///journal.csv' AS row
CREATE (:journal {journal: row.journal})
// Checking properly imported the nodes for journal.csv
MATCH (j:journal)
RETURN j
LIMIT 4


// Load nodes from keyword.csv
LOAD CSV WITH HEADERS FROM 'file:///keyword.csv' AS row
CREATE (:keyword {
keyword: row.keyword
})
// Checking properly imported the nodes for keyword.csv
MATCH (k:keyword)
RETURN k
LIMIT 10


// Load nodes from paper.csv
LOAD CSV WITH HEADERS FROM 'file:///paper.csv' AS row
CREATE (:paper {
title: row.title,
abstract: row.abstract
})
// Checking properly imported the nodes for paper.csv
MATCH (p:paper)
RETURN p
LIMIT 10


// Load nodes from volume.csv
LOAD CSV WITH HEADERS FROM 'file:///volume.csv' AS row
CREATE (:volume {
volume: row.volume
})
// Checking properly imported the nodes for volume.csv
MATCH (v:volume)
RETURN v
LIMIT 10


// Load nodes from year.csv
LOAD CSV WITH HEADERS FROM 'file:///year.csv' AS row
CREATE (:year {
year: row.year
})
// Checking properly imported the nodes for year.csv
MATCH (y:year)
RETURN y
LIMIT 3


// EDGES -> Relationships 

// Load author to paper relationships (Reviewing) - a2p_reviewed
LOAD CSV WITH HEADERS FROM 'file:///a2p_reviewed.csv' AS row
MATCH (a:author {name: row.name})
MATCH (p:paper {title: row.title})
CREATE (a)-[:a2p_reviewed]->(p)
// Checking properly imported a2p_reviewed 
MATCH (a:author)-[:a2p_reviewed]->(p:paper)
RETURN a, p
LIMIT 10


// Load author to paper relationships (Wrote)
LOAD CSV WITH HEADERS FROM 'file:///a2p_wrote.csv' AS row
MATCH (a:author {name: row.name})
MATCH (p:paper {title: row.title})
CREATE (a)-[:a2p_wrote]->(p)
// Checking properly imported a2p_wrote
MATCH (a:author)-[:a2p_wrote]->(p:paper)
RETURN a, p
LIMIT 10


// Load edition to conference relationships (Appears in)
LOAD CSV WITH HEADERS FROM 'file:///e2c_appears_in.csv' AS row
MATCH (e:edition {city: row.edition})
MATCH (c:conference {conference: row.conference})
CREATE (e)-[:e2c_appears_in]->(c)


// Load edition to year relationships (Occured_in)
LOAD CSV WITH HEADERS FROM 'file:///e2y_occured_in.csv' AS row
MATCH (e:edition {city: row.edition})
MATCH (y:year {year: row.year})
CREATE (e)-[:e2y_occured_in]->(y)


// Load paper to edition relationships (Published in)
LOAD CSV WITH HEADERS FROM 'file:///p2e_published_in.csv' AS row
MATCH (p:paper {title: row.title})
MATCH (e:edition {city: row.edition})
CREATE (p)-[:p2e_published_in
]->(e)


// Load paper to keyword relationships (has)
LOAD CSV WITH HEADERS FROM 'file:///p2k_has.csv' AS row
MATCH (p:paper {title: row.title})
MATCH (k:keyword {keyword: row.keyword})
CREATE (p)-[:p2k_has]->(k)


// Load paper to paper relationships (cites)
LOAD CSV WITH HEADERS FROM 'file:///p2p_cites.csv' AS row
MATCH (p:paper {title: row.title})
MATCH (pc:paper {title: row.title_cited})
CREATE (p)-[:p2p_cites]->(pc)


// Load paper to volume relationships (Published in)
LOAD CSV WITH HEADERS FROM 'file:///p2v_published_in.csv' AS row
MATCH (p:paper {title: row.title})
MATCH (v:volume {volume: row.volume})
CREATE (p)-[:p2v_published_in]->(v)


// Load volume to journal relationships (Appears in)
LOAD CSV WITH HEADERS FROM 'file:///v2j_appears_in.csv' AS row
MATCH (v:volume {volume: row.volume})
MATCH (j:journal {journal: row.journal})
CREATE (v)-[:v2j_appears_in]->(j)


// Load volume to year relationships (Occurred in)
LOAD CSV WITH HEADERS FROM 'file:///v2y_occured_in.csv' AS row
MATCH (v:volume {volume: row.volume})
MATCH (y:year {year: row.year})
CREATE (v)-[:v2y_occured_in]->(y)



// Relationship Check: 
MATCH (n:author) RETURN n LIMIT 50
UNION
MATCH (n:conference) RETURN n LIMIT 2
UNION
MATCH (n:edition) RETURN n LIMIT 10
UNION
MATCH (n:journal) RETURN n LIMIT 4
UNION
MATCH (n:keyword) RETURN n LIMIT 100
UNION
MATCH (n:paper) RETURN n LIMIT 250
UNION
MATCH (n:volume) RETURN n LIMIT 10
UNION
MATCH (n:year) RETURN n LIMIT 5