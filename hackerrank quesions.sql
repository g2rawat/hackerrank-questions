-- Question:
-- https://www.hackerrank.com/challenges/the-blunder/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

-- Solution:
select ceiling(avg(salary)-avg(replace(salary,'0',''))) as error from employees;
-- ___________________________________________________________________________
-- Question:
-- https://www.hackerrank.com/challenges/earnings-of-employees/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

-- Solution:
SELECT (months * salary) earning, COUNT (months * salary)
FROM EMPLOYEE
GROUP BY (earning)
ORDER BY (earning) DESC
LIMIT 1;
-- [Or]
SELECT 
    s.earnings,
    COUNT(s.name) 
FROM 
    (SELECT *,months * salary as earnings FROM Employee ORDER BY earnings DESC) s
GROUP BY s.earnings
ORDER BY s.earnings DESC
LIMIT 1;
-- ___________________________________________________________________________

-- Question:
-- https://www.hackerrank.com/challenges/weather-observation-station-2/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

-- soluton: 
select round(sum(LAT_N),2), round(sum(LONG_W),2) from STATION;
-- ___________________________________________________________________________

-- Question:
-- https://www.hackerrank.com/challenges/weather-observation-station-13/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h

-- solution:
select round(sum(LAT_N),4) from STATION
where LAT_N>38.7880 and LAT_N<137.2345;
-- ___________________________________________________________________________

-- Question:
-- https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true

-- solution:
WITH Indexed_rows AS (
SELECT LAT_N,
ROW_NUMBER() OVER(ORDER BY LAT_N) as row_count,
COUNT(*) OVER() as total_rows
FROM STATION
)
SELECT
    CASE
    WHEN total_rows % 2 = 0 THEN
    ROUND((Select AVG(LAT_N) from Indexed_rows where row_count=total_rows/2)+
    (Select AVG(LAT_N) from Indexed_rows where row_count=(total_rows/2)+1),4)/2
    ELSE
    ROUND((SELECT LAT_N from Indexed_rows where row_count=(total_rows+1)/2),4)
END AS Median
from Indexed_rows
LIMIT 1;

-- ___________________________________________________________________________

-- Question:
-- https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true

-- solution:
select if(g.grade>7,s.name,null), g.grade, s.marks
from students s
inner join grades g
on s.marks >= g.min_mark and s.marks <= g.max_mark
ORDER BY g.grade DESC, Name ASC, s.marks ASC;
