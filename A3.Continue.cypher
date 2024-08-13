// A3. Continuation Evolution Graph 

// Match all papers and calculate the count of positive reviews
MATCH (p:paper)
WITH p, size([(p)<-[:a2p_reviewed {acceptance_status: '1'}]-(a:author) | a]) as positiveReviews

// Match 'p2e_published_in' or 'p2v_published_in' relationships
OPTIONAL MATCH (p)-[r1:p2e_published_in]->(e:edition)
OPTIONAL MATCH (p)-[r2:p2v_published_in]->(v:volume)

// Set the 'verified' value based on the count of positive reviews
SET r1.verified = CASE WHEN positiveReviews >= 3 THEN 1 ELSE 0 END,
    r2.verified = CASE WHEN positiveReviews >= 3 THEN 1 ELSE 0 END

LOAD CSV WITH HEADERS FROM 'file:///authors.csv' AS row
CREATE (:Author {
    id: toInteger(row.id),
    name: row.name,
    date_of_birth: date(row.date_of_birth),
    gender: row.gender,
    nationality: row.nationality
});


//Add author affiliations
LOAD CSV WITH HEADERS FROM 'file:///university.csv' AS row
CREATE (:university {university: row.university})

LOAD CSV WITH HEADERS FROM 'file:///a2u_affiliation.csv' AS row
MATCH (a:author {name: row.name})
MATCH (u:university {university: row.university})
CREATE (a)-[:a2u_affiliation]->(u)