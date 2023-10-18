-- Initial peek at data
SELECT *
FROM international_debt
LIMIT 10;

-- Unique countries total
SELECT 
    COUNT(DISTINCT country_name) AS tot_countries
FROM international_debt;

-- Distinct Debt Indicators
SELECT 
    DISTINCT indicator_code AS unique_debt_indicators
FROM international_debt
ORDER BY unique_debt_indicators;

-- Total debt owed 
SELECT 
    ROUND(SUM(debt/1000000), 2) AS tot_debt
FROM international_debt;

-- Country with highest debt
SELECT 
    country_name, 
    SUM(debt) AS tot_debt
FROM international_debt
GROUP BY country_name
ORDER BY tot_debt DESC
LIMIT 1;

-- Average debt amount across indicators
SELECT 
    indicator_code AS debt_indicator,
    indicator_name,
    AVG(debt) AS avg_debt
FROM international_debt
GROUP BY debt_indicator, indicator_name
ORDER BY avg_debt DESC
LIMIT 10;

-- Highest sum of principal payments
SELECT 
    country_name, 
    indicator_name
FROM international_debt
WHERE debt = (SELECT 
                 MAX(debt)
             FROM international_debt
             LIMIT 1);

-- Most common debt indicator
SELECT
indicator_code,
COUNT(indicator_code) AS indicator_count
FROM international_debt
GROUP BY indicator_code
ORDER BY indicator_count DESC, indicator_code DESC
LIMIT 20;

-- Deeper dive at loan amounts
SELECT country_name,
MAX(debt) AS maximum_debt
FROM international_debt
GROUP BY country_name
ORDER BY maximum_debt DESC
LIMIT 20;