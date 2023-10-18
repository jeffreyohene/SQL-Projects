-- Select all columns from the database
-- Display only the first ten rows
SELECT *
FROM schools
LIMIT 10

-- Count rows with percent_tested missing and total number of schools
SELECT 
  COUNT(*) - COUNT(percent_tested) AS num_tested_missing,
  COUNT(*) as num_schools

FROM schools;

-- Count the number of unique building_code values
SELECT 
  COUNT(DISTINCT building_code) AS num_school_buildings

FROM schools;


-- Select school and average_math
-- Filter for average_math 640 or higher
-- Display from largest to smallest average_math
SELECT 
  school_name, 
  average_math

FROM schools
WHERE average_math >= 640
ORDER BY average_math DESC;

-- Find lowest average_reading
SELECT
  MIN(average_reading) AS lowest_reading
    
FROM schools;

-- Find the top score for average_writing
-- Group the results by school
-- Sort by max_writing in descending order
-- Reduce output to one school
SELECT 
    school_name,  
    MAX(average_writing) AS max_writing

FROM schools
GROUP BY school_name
ORDER BY max_writing DESC
LIMIT 1;

-- Calculate average_sat
-- Group by school_name
-- Sort by average_sat in descending order
-- Display the top ten results
SELECT
  school_name,
  SUM(average_math + average_reading + average_writing) AS average_sat
FROM schools
GROUP BY school_name
ORDER BY average_sat DESC
LIMIT 10;

-- Select borough and a count of all schools, aliased as num_schools
-- Calculate the sum of average_math, average_reading, and average_writing, divided by a count of all schools, aliased as average_borough_sat
-- Organize results by borough
-- Display by average_borough_sat in descending order
SELECT
  borough,
  COUNT(*) AS num_schools,
  SUM(average_math + average_reading + average_writing)/COUNT(*) AS average_borough_sat
FROM schools
GROUP BY borough
ORDER BY average_borough_sat DESC;

-- Select school and average_math
-- Filter for schools in Brooklyn
-- Aggregate on school_name
-- Display results from highest average_math and restrict output to five rows
SELECT
  school_name,
  average_math
FROM schools
WHERE borough = 'Brooklyn'
GROUP BY school_name
ORDER BY average_math DESC
LIMIT 5;