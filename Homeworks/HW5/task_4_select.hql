USE mf_goryacheva; 
set hive.auto.convert.join=true;
set mapreduce.job.reduces=8;

SELECT 
    logs.useragent,
    SUM(IF(gender = 'male',1,0)) as male_count,
    SUM(IF(gender = 'female',1,0)) as female_count
FROM logs_optimized_bucketed_S logs 
JOIN users on users.ip = logs.ip
GROUP BY logs.useragent
LIMIT 10;

SELECT 
    logs.useragent,
    SUM(IF(gender = 'male',1,0)) as male_count,
    SUM(IF(gender = 'female',1,0)) as female_count
FROM logs_optimized_bucketed_M logs 
JOIN users on users.ip = logs.ip
GROUP BY logs.useragent
LIMIT 10;

SELECT 
    logs.useragent,
    SUM(IF(gender = 'male',1,0)) as male_count,
    SUM(IF(gender = 'female',1,0)) as female_count
FROM logs_optimized_bucketed_full logs 
JOIN users on users.ip = logs.ip
GROUP BY logs.useragent
LIMIT 10;
