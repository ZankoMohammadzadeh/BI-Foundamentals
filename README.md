# BI-Foundamentls

Let's begin this section by introducing some essential terms in Business Intelligence.


**Business Intelligence (BI):** Business Intelligence is a technology-driven process for analyzing and presenting data to help businesses make informed decisions. It involves the collection, integration, analysis, and presentation of data to support decision-making within an organization.


**Data Warehouse:** A data warehouse is a large, centralized repository of data that is specifically designed for the purpose of storing, organizing, and analyzing vast amounts of data from various sources. It is a critical component of business intelligence (BI) and data analytics systems, as it enables organizations to make informed decisions based on historical and current data.
In data warehouse we should consider our data in 4 parameters.
  - Subject Oriented: our data should stored based on subject of our business.
  - Integrated: consolidate data from different sources
  - Time-variant: store historical data, typically over an extended period
  - Non-volatile: do not update or delete our data when it undergoes changes


**Data Warehouse Schemas:** Data warehouse schemas are structures used to organize and define the layout of data within a data warehouse.
  - Star Schema: In a star schema, data is organized into fact tables and dimension tables. Fact tables contain numerical or quantitative data, while dimension tables contain descriptive information. This design simplifies querying for analytical purposes.
  - Snowflake Schema: A snowflake schema is a variation of the star schema where dimension tables are normalized, meaning they are broken down into sub-dimensions, resulting in a more complex but normalized structure.
  Choosing between a star schema and a snowflake schema depends on specific business requirements, query patterns, and trade-offs between simplicity and data redundancy.


![image](https://github.com/ZankoMohammadzadeh/BI-Foundamentals/assets/42311741/3b9398cc-b535-4e48-aa64-cb66830a3167)



**Dimension:** Dimensions are attributes or characteristics that provide context and descriptive information about the data in a data warehouse. They help answer questions like "who", "what", "where", "when", and "how". Dimensions are typically non-numeric and represent categories or hierarchies (Time, Geography, Customer, Product, Employee). Dimensions are used to filter, group, and slice data in queries and reports. 

 - types of dimension:
    - Junk Dimension
    - Degenerate Dimension
    - Role-playing Dimension

**Fact:** Facts are numerical measures or quantitative data that represent business metrics or key performance indicators (KPIs). Facts are typically the central focus of data analysis and decision-making in a data warehouse.




SCD (Slowly Change Dimension):


ETL (Extract Transform Load):
The process of combining data from multiple sources into a large, central repository called a data warehouse. ETL uses a set of business rules to clean and organize raw data and prepare it for storage, data analytics, and machine learning (ML).


FileGroup and DataFile:
Data Files contain data and objects such as tables, indexes, stored procedures, and views.
Data files can be grouped together in filegroups for allocation and administration purposes.
In sql server we cannot access data files directly. We have to work with file groups.

Index:
  - Clustered Index : A Clustered index is a type of index in which table records are physically reordered to match the index.
  - NonClustered Index : A Non-Clustered index is a special type of index in which the logical order of the index does not match the physical stored order of the rows on the disk. Another Index table will be created.
 
If your index is not unique, sql server put a key beside of records to make it unique (so it is better to select a clustered index as unique ourself)

Partitioning:

<img width="601" alt="image" src="https://github.com/ZankoMohammadzadeh/BI-Foundamentals/assets/42311741/78410ef7-91b8-407a-94c8-5a76bfce4ed2">


<img width="846" alt="image" src="https://github.com/ZankoMohammadzadeh/BI-Foundamentals/assets/42311741/4df3880a-084d-4ae5-8c72-78031a0a433f">


<img width="422" alt="image" src="https://github.com/ZankoMohammadzadeh/BI-Foundamentals/assets/42311741/b39c39e5-af72-4f82-bf49-a97bee8d5b94">


<img width="962" alt="image" src="https://github.com/ZankoMohammadzadeh/BI-Foundamentals/assets/42311741/bbda1dbf-7038-4428-9dcb-6498b7b7c65a">


<img width="865" alt="image" src="https://github.com/ZankoMohammadzadeh/BI-Foundamentals/assets/42311741/b30b2140-b020-496f-b147-4a9e75e0dba8">


If we want remove any Data Files we can use this SQL command
ALTER DATABASE PartitioningDB_Test REMOVE FILE Data2002


first value of boundary values, is the maximum value of first partition
if RANGE RIGHT => first value is the minimum value of second partition


<img width="518" alt="image" src="https://github.com/ZankoMohammadzadeh/BI-Foundamentals/assets/42311741/c69802ae-12d4-4631-9248-77c5d5e2bd88">



If your Table exists do not need to create it. Just set it's Index

<img width="322" alt="image" src="https://github.com/ZankoMohammadzadeh/BI-Foundamentals/assets/42311741/29451163-caf9-4cc2-a170-7947ba29a14a">



If there is a cluster index before, we have to delete them. Then we should create new partitioned clustered index 
Partition Key must be participated in Partition Index.

<img width="440" alt="image" src="https://github.com/ZankoMohammadzadeh/BI-Foundamentals/assets/42311741/e4cd5627-3c0d-450e-a13f-f886e266f45f">


Here we want to insert some records in our table.

<img width="648" alt="image" src="https://github.com/ZankoMohammadzadeh/BI-Foundamentals/assets/42311741/03d5efba-e34e-4e9a-86c4-9ee027da8646">



Then by this query we can find out which file group exactly our records stored.

<img width="401" alt="image" src="https://github.com/ZankoMohammadzadeh/BI-Foundamentals/assets/42311741/527491a5-d370-4f6b-9d8e-42bf805c3f71">




- Business Key :

- Surrogate Key : 


COLUMNSTORE INDEX:




