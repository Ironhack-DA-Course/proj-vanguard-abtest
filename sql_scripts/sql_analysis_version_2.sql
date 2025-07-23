-- 297850 rows 
-- filter where process_step is confirm and time_diff is not 0 
SELECT * FROM df_footprints_transformed_client_merged 
where client_id  not in (
SELECT client_id FROM df_footprints_transformed_client_merged
where time_diff = 0 and process_step = 'confirm')

-- Completion Rate
WITH clients_filtered AS (
  SELECT *
  FROM df_footprints_transformed_client_merged
  WHERE client_id NOT IN (
    SELECT client_id
    FROM df_footprints_transformed_client_merged
    WHERE time_diff = 0 AND process_step = 'confirm'
  )
)
SELECT
  treatment_group,
  COUNT(DISTINCT client_id) AS total_users,
  COUNT(DISTINCT CASE WHEN process_step = 'confirm' THEN client_id END) AS completed_users,
  ROUND(
    COUNT(DISTINCT CASE WHEN process_step = 'confirm' THEN client_id END)::decimal 
    / COUNT(DISTINCT client_id) * 100, 
    2
  ) || '%' AS completion_rate
FROM clients_filtered
GROUP BY treatment_group;


-- 35 and under and 55 and above
-- Average Completion rate of Test vs Control, Young vs Old ( Age category), absolute vs relative (number vs percentage)
WITH clients_filtered AS (
  SELECT *,
    CASE
      WHEN client_age BETWEEN 0 AND 35 THEN 'Young'
      WHEN client_age BETWEEN 36 AND 54 THEN 'Middle'
      WHEN client_age BETWEEN 55 AND 200 THEN 'Old'
      ELSE 'Unknown'
    END AS age_category
  FROM df_footprints_transformed_client_merged
  WHERE client_id NOT IN (
    SELECT client_id
    FROM df_footprints_transformed_client_merged
    WHERE time_diff = 0 AND process_step = 'confirm'
  )
),
completion_stats AS (
  SELECT
    treatment_group,
    age_category,
    COUNT(DISTINCT client_id) AS total_users,
    COUNT(DISTINCT CASE WHEN process_step = 'confirm' THEN client_id END) AS completed_users
  FROM clients_filtered
  GROUP BY treatment_group, age_category
)
SELECT *,
  ROUND((completed_users::DECIMAL / total_users) * 100, 2) || '%' AS completion_rate_percent
FROM completion_stats;


-- 2. Average Time Spent per Step: Test vs Control, Young vs Old (Absolute)

WITH clients_filtered AS (
  SELECT *,
    CASE
      WHEN client_age BETWEEN 0 AND 35 THEN 'Young'
      WHEN client_age BETWEEN 36 AND 54 THEN 'Middle'
      WHEN client_age BETWEEN 55 AND 200 THEN 'Old'
      ELSE 'Unknown'
    END AS age_category
  FROM df_footprints_transformed_client_merged
  WHERE client_id NOT IN (
    SELECT client_id
    FROM df_footprints_transformed_client_merged
    WHERE time_diff = 0 AND process_step = 'confirm'
  )
)

SELECT
  treatment_group,
  age_category,
  process_step,
  ROUND(AVG(time_diff)::NUMERIC, 2) AS avg_time_spent_seconds
FROM clients_filtered
WHERE time_diff > 0
GROUP BY treatment_group, age_category, process_step
ORDER BY treatment_group, age_category, process_step;

SELECT * FROM df_footprints_transformed_client_merged

