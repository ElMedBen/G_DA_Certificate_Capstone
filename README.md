#  Google's Data Analytics Capstone

This certificate was my first entry into the world of data analytics. Thanks to Google and Coursera, i was able to learn new concepts and skills that can be very helpful and critical in the field of geoscience, as well as any other Data centric subjects.

**The work that i have done is very simple so be mindful of my beginner level xD**

## Capstone general infos ..

At the end of the certificate, i was tasked to choose one of two case studies to apply all what i have learned during the course : 

* Ask the right questions
* Prepare Data for Exploration
* Process and clean Data
* Analyze Data to answer questions
* Share data with simple and relevant visualizations
* Act !

With these important guidelines in mind , i have chosen to conduct the analysis on a fictional bike sharing company (First case study out of two proposed)

**The link for the presentation is the folowing :**

[Capstone Presentation!]()

## Ask: Business task statement 

**Cyclistic** is a company that offers a bike-sharing program. Their offered plans are single-ride passes for casual users and annual memberships. Finance analysis showed that annual members are more profitable than casual riders, thus the need to design a marketing strategy aimed at converting casual riders into annual members.
One of the steps that has been laid down by the direct of marketing is to evaluate how do annual members and casual riders use Cyclistic bikes differently? **This task is about using the available historical trip data, in order to identify trends within the previous 12 months and to assess how different is the usage between members and casual users.**

## Prepare Data for Exploration

The data has been made available by Motivate International Inc under License that grants to a non-exclusive, royalty-free, limited, perpetual license to access, reproduce, analyze, copy, modify, distribute or service and use the Data for any lawful purpose.
It’s a first-party data since it was collected by the own resources of Cyclistic and it covers the latest period of exercise, which make it recent.
The available data is stored in .zip files and saved in amazon’s cloud-based services. Each zip file contains a CSV file that is related to data collected each month, within the last 12 months (April 2020 to March 2021). The date is visible in the name of each file.

The data is long type and includes:
* unique ride id
* type of ridable used
* id name and geolocation of departure and arrival stations
* type of membership of the owners

The content extensively describes all the cases of bike usage during each month of the studied period, with more than 500 000 rows for each file. The big amount of data makes it difficult to use all of the files stimulatingly using spreadsheets.

## Process

We decided to go with SQL to clean, manage and transform our data to ready for analysis. To do so, we created a table using POSTGRSQL. After creating the headers, we imported all 12 csv files. The final table contains a total of **3404972** rows before the cleaning.
After importing our data, we used a query to select the data:

* Duplicates: We use Distinct on the ride Id to avoid duplicated entries
* Nulls: We use the where clause to avoid getting null in the rows
* For time data integrity, we specify that the Start time is always lower than End time 
* For membership type integrity we check that we have two categories only (members and casuals) by using a query that pulls distinct type of memberships
* For ride type integrity we check if we don’t have some wrong entry by using a query that pulls distinct type of rides

After controlling the integrity and cleaning of data, the final table contained a total of 3199328 rows. To further process our data we created four additional columns based on the cleaned table: 

* Ride_length_minutes : length of a ride based on the time of start and end ;
* Day_of_week:  name of the day when the ride happened
* Year : Year of usage
* Month : Month of usage 

[Link for sql query!](https://github.com/ElMedBen/G_DA_Certificate_Capstone/blob/main/SQL/CLEAN_SELECT_AGG_query.sql)

## Analysis and results

In addition to data transformation and aggregation, simple Statistical EDA was done using SQL to simply evaluate the length/amount of usage for both type of users

### Stats for length of usage per minutes for each type of users

|Type of users|Mean|Maximum|Minimum|
|---|---|---|---|
|Cyclistic member| 15.75| 41271| 1.016|
|Casual riders| 45.43| 54283| 1.016|



### Total amount of usage for each type of users

|Type of users|Total amount|
|---|---|
|Cyclistic member| 1846660|
|Casual riders| 1310589|


## Share and Act !
Visualization was conducted using spreadsheets. Based on results Casual users use the bike service  18% longer and Cyclistic members use 34 %  more often the bike service

| Amount of usage|Length of usage|
:---|---:
![Amount of usage](https://github.com/ElMedBen/google_data_analytics_cert/blob/main/FIGURES/ammount.png)|![Length of usage](https://github.com/ElMedBen/google_data_analytics_cert/blob/main/FIGURES/LENGTH1.png)

The casual usage of bikes gets higher during the period when Chicago’s weather is better . For both type of users, the total amount of usage and length both increase during the weekends

| Monthly variation of usage |
:---:
![Monthly variation of usage ](https://github.com/ElMedBen/google_data_analytics_cert/blob/main/FIGURES/VARIATIONSAMMOUNT.png)

|Variations of usage during the week|
:---:
![Variations of usage during the week](https://github.com/ElMedBen/google_data_analytics_cert/blob/main/FIGURES/WEEKEND.png)

**So what should we do based on results ?**

* Weather of Chicago directly affect usage of bikes regardless of type of users. Cyclistic should implement logistical solutions to incite usage in bad weather (covered bikes ?)

* Because of the seasonality in term of usage during the year, Cyclistic should implement plans that leverage the peak of usage during spring-summer periods (mid annual plans ?) 

* Weekend surge might also be leveraged by implementing a membership plan for weekends only
