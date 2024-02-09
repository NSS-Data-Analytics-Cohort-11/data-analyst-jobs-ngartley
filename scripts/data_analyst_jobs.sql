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

-- Question 9 - Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT company, AVG(star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count>5000
GROUP BY company

-- Answer: 40 named companies and one null

-- Question 10 - Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company, ROUND (AVG(star_rating),1) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count>5000
GROUP BY company
ORDER BY avg_star_rating DESC

-- Answer: There are 6 companies that have the top average star rating. Those six companies are General Motors, Unilever, Microsoft, Nike, American Express, and Kaiser Permanente. That average when rounded down is 4.2 stars.

-- Question 11 - Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

SELECT DISTINCT (title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%'

-- Answer: 774

-- Question 12 - How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT DISTINCT (title)
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
	AND title NOT ILIKE '%Analytics%'
	
-- Answer: 4. Tableau is the common word used. 

-- Bonus Questions
	-- A. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. Disregard any postings where the domain is NULL.
	
SELECT domain AS hard_to_fill
FROM data_analyst_jobs
WHERE domain IS NOT NULL
AND skill ILIKE '%SQL%'
AND days_since_posting>21
GROUP BY domain

-- Bonus Questions
	-- B. Order your results so that the domain with the greatest number of hard to fill jobs is at the top.
	
SELECT domain AS hard_to_fill, COUNT(domain)
FROM data_analyst_jobs
WHERE domain IS NOT NULL
AND skill ILIKE '%SQL%'
AND days_since_posting>21
GROUP BY domain, days_since_posting
ORDER BY count DESC

-- Bonus Questions
	-- C. Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?

SELECT domain AS hard_to_fill, COUNT(domain)
FROM data_analyst_jobs
WHERE domain IS NOT NULL
AND skill ILIKE '%SQL%'
AND days_since_posting>21
GROUP BY domain, days_since_posting
ORDER BY count DESC
LIMIT 4;