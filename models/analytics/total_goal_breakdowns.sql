SELECT DISTINCT user_id, COUNT(ID) OVER (partition by USER_ID ORDER BY USER_ID) AS total_goals FROM HYPEDOCS_CO.PUBLIC.GOALS
LEFT JOIN HYPEDOCS_CO.PUBLIC.USERS on HYPEDOCS_CO.PUBLIC.GOALS.USER_ID=HYPEDOCS_CO.PUBLIC.USERS.uid
ORDER BY TOTAL_GOALS DESC;

WITH user_goals as (SELECT uid, COUNT(ID) OVER (partition by USER_ID ORDER BY USER_ID) AS total_goals 
                    FROM HYPEDOCS_CO.PUBLIC.USERS 
LEFT JOIN HYPEDOCS_CO.PUBLIC.GOALS on HYPEDOCS_CO.PUBLIC.USERS.uid=HYPEDOCS_CO.PUBLIC.GOALS.user_id), 
zero_goal as
(SELECT * from user_goals WHERE total_goals=0), 
number_zero_goal as
(SELECT DISTINCT COUNT(UID) as users_zero_goals FROM zero_goal),
one_goal as(
SELECT * FROM user_goals WHERE total_goals = 1
), 
count_one_goal as (
    SELECT DISTINCT COUNT(UID) as onegoalcount from one_goal
),
goals_over_5 as(
SELECT * FROM user_goals WHERE total_goals > 5
), 
number_goals_over_five as (
    SELECT DISTINCT COUNT(UID) as count_goals_over_5 from goals_over_5
),
goals_over_10 as(
SELECT * FROM user_goals WHERE total_goals > 10
), 
number_goals_over_10 as (
    SELECT DISTINCT COUNT(UID) as count_goals_over_10 from goals_over_10
)
SELECT * FROM number_goals_over_five