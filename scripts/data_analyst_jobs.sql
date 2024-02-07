-- Question 1 - How many rows are in the data_analyst_jobs table?

SELECT *
FROM data_analyst_jobs

-- Answer: 1793

-- Question 2 - Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT company
FROM data_analyst_jobs
LIMIT 10

-- Answer: ExxonMobil

-- Question 3a - How many postings are in Tennessee? 

SELECT COUNT (location)
FROM data_analyst_jobs
WHERE location = 'TN'

-- Answer: 21

-- Question 3b - How many are there in either Tennessee or Kentucky?

SELECT COUNT (location)
FROM data_analyst_jobs
WHERE location IN ('TN', 'KY')

-- Answer: 27

-- Question 4 - How many postings in Tennessee have a star rating above 4?

SELECT COUNT (star_rating)
FROM data_analyst_jobs
WHERE star_rating >=4
AND location IN ('TN', 'KY')

-- Answer: 4

-- Question 5 - How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT (review_count)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000

-- Answer: 151

-- Question 6 - Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?

SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC

-- Answer: Nebraska

-- Question 7 - Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs

-- Answer: 881

-- Question 8 - How many unique job titles are there for California companies?

SELECT COUNT (DISTINCT title), location
FROM data_analyst_jobs
WHERE location = 'CA'
GROUP BY location

-- Answer: 230