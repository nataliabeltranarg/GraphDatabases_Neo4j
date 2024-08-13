# Big Data Management: Research Articles Graph Databases using Neo4j


## Project Overview 
This project is a hands-on lab focused on Property Graphs using Neo4j completed for the course Big Data Management at the Barcelona School of Economics. The primary objective of the project is to build, load, modify, and query a graph database that captures the complex relationships within the domain of academic reasearch articles, journals, and authors. This project offers a comprehensive exploration of how graph databases can be used to store, manage, and analyze data in the context of academic research, providing valuable insights into the relationships and impact of scholarly work. The nature of graph databases like Neo4j, allows them to be applied to a wide range of other contexts as well, including fraud detection, social networks, recommendation systems, and more. 

## Key Concepts and Relationships
- **Authors:** Researchers who write and review scientific papers. 
- **Papers:** Research articles authored by researchers and published in journals or conferences. 
- **Conferences/Workshops**: Forums where research papers are presented; organized by editions.
- **Journals:** Periodicals that publish research papers in volumes. 
- **Reviews:** Evaluation of papers by assigned reviewers, as well as suggested reviewer decision (accepted/rejected) of authors results. 
- **Keywords:** Topics associated with the reasearch papers

## Key Features 
- **Graph Modeling:** Creation of conceptual graph model representing research papers and their associated entities. 
- **Data Loading:** Creation and insertion of synthetic data into the Neo4j database. 
- **Graph Evolution:** Modification of the graph structure to accomodate new data requirements which included author affiliation, storing of paper reviews, etc. 
- **Querying:** Execution of Cypher queries to retrieve insights from the graph, such as most cited papers, author communities, etc. 
- **Graph Algorithm:** Application of Similarity algorithm to identify citation patterns between research papers. 

## Assumptions and Design Decisions
- **Data Modeling:** The graph model was designed to optimize query performance for common research-related task (e.g., finiding top-cited papers, year published, etc).
- **Data Sources:** Due to time constraints the data used for this project was synthetic rather than sourced online. 
- **Data Evolution:** The model was extended to include paper reviews and author affiliations to reflect real-world scenarios where such data would evolve over time.  

## Setup and Installation 
**Application Requirements**
- Neo4j 
- Neo4j Graph Data Science Library Plugin
- Python

**Run Project**

The following setup guide should provide you with the necessary steps to get the project up and running smoothly in Neo4j, from initial setup to data exploration and analysis. 

**1. Clone repository**
```
git clone https://github.com/nataliabeltranarg/NoSQL_GraphDatabases_Neo4j.git
cd NoSQL_GraphDatabases_Neo4j
```
**2. Set Up Neo4j**
   - *Install Neo4j Desktop:* Download and install Neo4j Desktop.
   - *Install the Graph Data Science Plugin* 
   - *Create a New Project & Database:* Open Neo4j create a new project and a new database instance.
   - *Start Database:* Start the Neo4j database instance
     
**3. Data Loading**
- Import data in the Import directory in Neo4j. Use the Cypher scripts to load data to browser. 

**4. Queries and Algorithm**
- Neo4j Browser:
   - To execute and explore the graph data you will have to access the Neo4j Browser. This can be accessed by navigating to the http://localhost:7474 in your web browser. 
- Execute algorithm queries for analysis. 

## How to navigate the repository
```bash 
├── 1. Data
│   ├── A1.ModelingGraph.jpg
│   ├── Synthetic Data
│   │   ├── Neo4j Data
│   │   │   ├── edges
│   │   │   ├── nodes
│   │   │   └── original json files created 
│   │   └── BigData-NataliaClarice-DataCreation.ipynb
├── 2. Cypher Queries
│   ├── A.Modeling,Loading,Evolving
│   │   ├── A2.Loading-Instantiating.cypher
│   │   └── A3.Modification.cypher
│   ├── B.Querying
│   │   └── Queries.cypher
│   ├── C.Graph Algorithm
│   │   └── SimilarityAlgorithm.cypher
├── 3. Report
│   └── BSE-BigDataManagement-NataliaBeltran-ClariceMottet.pdf
└── README.md
```
