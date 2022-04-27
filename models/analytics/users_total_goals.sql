SELECT DISTINCT user_id, COUNT(ID) OVER (partition by USER_ID ORDER BY USER_ID) AS total_goals FROM HYPEDOCS_CO.PUBLIC.GOALS
LEFT JOIN HYPEDOCS_CO.PUBLIC.USERS on HYPEDOCS_CO.PUBLIC.GOALS.USER_ID=HYPEDOCS_CO.PUBLIC.USERS.uid
ORDER BY TOTAL_GOALS DESC