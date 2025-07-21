with clients as (
select * from visits where client_id in (
SELECT client_id FROM visits 
where process_step = 'confirm')
)
SELECT count( distinct client_id) from clients;


SELECT count(distinct client_id) from visits;

SELECT round((33831.0 / 46563) * 100, 2) aS percentage;


with clients as (
select * from visits where client_id in (
SELECT client_id FROM visits 
where process_step = 'confirm')
)
SELECT treatment_group,count( distinct client_id)  
from clients
group by treatment_group;


with clients as (
select * from visits where client_id in (
SELECT client_id FROM visits 
where process_step = 'confirm')
)
SELECT treatment_group, count(distinct client_id) as Number_of_clients ,round(cast((cast(count( distinct client_id) as float)  / 33831) * 100 as int)) as percentage
from clients
group by treatment_group;

-- 
WITH average_secs AS (
  SELECT * 
  FROM visits 
  WHERE client_id IN (
    SELECT client_id 
    FROM visits 
    WHERE process_step = 'confirm' AND time_diff != '00:00:00'
  )
),
seconds_cte AS (
  SELECT *, ROUND(EXTRACT(EPOCH FROM time_diff)) AS seconds 
  FROM average_secs
  WHERE process_step = 'confirm'
  ORDER BY seconds DESC
)
SELECT round(avg(EXTRACT(MINUTE FROM (seconds * INTERVAL '1 second'))),2) AS minutes
FROM seconds_cte;
