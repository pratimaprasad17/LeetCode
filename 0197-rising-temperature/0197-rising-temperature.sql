# Write your MySQL query statement below
-- select
-- w1.id as Id
-- from Weather w1
-- join Weather w2
-- on datediff(w1.recordDate, w2.recordDate)=1
-- where w1.recordDate>w2.recordDate and w1.temperature>w2.temperature

WITH PreviousWeatherData AS
(
    SELECT 
        id,
        recordDate,
        temperature, 
        LAG(temperature, 1) OVER (ORDER BY recordDate) AS PreviousTemperature,
        LAG(recordDate, 1) OVER (ORDER BY recordDate) AS PreviousRecordDate
    FROM 
        Weather
)
SELECT 
    id 
FROM 
    PreviousWeatherData
WHERE 
    temperature > PreviousTemperature
AND 
    recordDate = DATE_ADD(PreviousRecordDate, INTERVAL 1 DAY);