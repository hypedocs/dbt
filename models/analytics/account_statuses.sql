SELECT CAST('Basic' AS VARCHAR) as account_type, COUNT(UID) as Count_Users FROM HYPEDOCS_CO.PUBLIC.USERS  WHERE STATUS='BASIC'
UNION
SELECT CAST('TrialEnded' AS VARCHAR) as account_type, COUNT(UID) as Count_Users FROM HYPEDOCS_CO.PUBLIC.USERS WHERE STATUS = 'TRIAL_ENDED'
UNION 
SELECT CAST('Cancelled' AS VARCHAR) as account_type, COUNT(UID) as Count_Users FROM HYPEDOCS_CO.PUBLIC.USERS WHERE STATUS = 'CANCELLED'
UNION
SELECT CAST('Unknown' AS VARCHAR) as account_type, COUNT(UID) as Count_Users FROM HYPEDOCS_CO.PUBLIC.USERS WHERE STATUS = 'UNKOWN'