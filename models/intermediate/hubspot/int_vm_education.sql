{{ config(materialized="table") }}

-- THE MAIN LOGIC FOLLOWED At THE EDUCATION STAGE
-- BY QUALIFYING COMPANIES ON THE TOTAL NUMBER OF WEBSITE VISITS BY ALL EMPLOYEES
-- IT TAKES THE FIRST MARKETING QUALIFIED LEAD BUT THE SUM OF ALL PAGE VIEWS BY ALL CONTACTS ON THE COMPANY
-- PAGE VIEWS CAN BE USED AS FILTER TO DEFINE THE EDUCATION STAGE 
-- LIKE TO ADD THE AVG MONTHLY PAGE VISITS BY COMPANY AS AN EXTRA POTENTIAL FILTER 
-- TO DEFINE WHICH ACCOUNTS ARE/WHERE INFLUENCED BY MARKETING AND ACTIVELY EDUCATING THEMSELVES


select 
    DATE_TRUNC(CAST(CONCAT(min_entered_marketingqualifiedlead, '-01') AS DATE), MONTH) as month,
    count(companyid) as education,
    sum(num_visits) as num_visits
from (
    select 
        companyid,
        SUM(num_visits) as num_visits,
        MIN(entered_marketingqualifiedlead) as min_entered_marketingqualifiedlead
    from 
        {{ ref('stg_contacts') }}
    group by 
        companyid
) as subquery
group by 
    1
order by 1 desc 


