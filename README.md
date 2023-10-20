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




**SCD (Slowly Change Dimension):** It refers to a concept and technique used in data warehousing and data modeling to manage changes to dimensional data over time. Dimensional data typically represents descriptive, textual, or categorical information that is used to analyze and report on facts in a data warehouse. 

In a data warehousing environment, dimensions often change over time due to various reasons such as updates, inserts, or deletions. SCDs are used to categorize how these changes are managed. There are several types of SCDs:
  1) SCD Type 1 (SCD1): In this approach, historical data is simply overwritten with new data. It's like updating the dimension with the most current information without keeping any historical records. This method is suitable when historical data isn't important.
  2) SCD Type 2 (SCD2): SCD Type 2 maintains a history of changes by adding new rows for each change while preserving the old data. Each row typically has an effective date range, allowing you to analyze data as it existed at different points in time. This method is useful when you need to keep a historical record of changes to dimensions.
  3) SCD Type 3 (SCD3): SCD Type 3 tracks a limited amount of historical data by adding columns to the existing dimension table to store some historical values. This approach is suitable for scenarios where you need to track a few important changes without a complete historical record.
  4) SCD Type 4 (SCD4): SCD Type 4, also known as a Hybrid approach, combines elements of Type 1 and Type 2. It uses separate tables to maintain both the current data and historical data, making it a hybrid approach.


**ETL (Extract Transform Load):** The process of combining data from multiple sources into a large, central repository called a data warehouse. ETL uses a set of business rules to clean and organize raw data and prepare it for storage, data analytics, and machine learning (ML).

**Business Key :** In Business Intelligence (BI) and data modeling, a business key refers to a unique identifier or attribute that is used to uniquely identify an entity or record within a dataset. Business keys are essential for data integration, data quality, and ensuring data consistency, particularly in data warehousing and data modeling contexts. They serve as a fundamental concept for connecting and linking data from various sources within an organization.

**Surrogate Key :** A surrogate key is an artificial, system-generated identifier that is used to uniquely identify rows in a database table, particularly in dimension tables. Surrogate keys are introduced to address specific needs and challenges in data modeling, data integration, and data warehousing. They serve as an alternative to natural or business keys.

**FileGroup and DataFile:** Data Files contain data and objects such as tables, indexes, stored procedures, and views.
Data files can be grouped together in filegroups for allocation and administration purposes.
In sql server we cannot access data files directly. We have to work with file groups.

**Index:**
  - Clustered Index : A Clustered index is a type of index in which table records are physically reordered to match the index.
  - NonClustered Index : A Non-Clustered index is a special type of index in which the logical order of the index does not match the physical stored order of the rows on the disk. Another Index table will be created.
 
If your index is not unique, sql server put a key beside of records to make it unique (so it is better to select a clustered index as unique ourself)

**Partitioning:**

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







