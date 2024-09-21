
{{ config(materialized="table") }}


-- EDUCATION
-- COMPANY SPECIFIC REASONING NEEDS TO BE APPLIED
-- THIS TO MAKE A DIFFERENCE BETWEEN FIRST WEBSITE VISIT
-- AND A MARKETING QUALIFIED LEAD/COMPANY AND ASSOCIATED TIMESTAMP
-- WITHOUT ALIGNMENT OR SPECIFIC DEFINITION AND TRACKING, THERE IS NO DIFFERENCE IN THE MODEL
-- A TOOL LIKE DREAMDATA ENABLES THIS STEP AS IT UNCOVERS THE TRUE FIRST TOUCHPOINT WITH THE COMPANY
-- https://www.linkedin.com/posts/steffenhedebrandt_b2bmarketing-paidsocial-activity-7242438929268793344-7TH6?utm_source=share&utm_medium=member_desktop


-- SELECTION
with selection as ( 

select 
    properties_createdate as selection,
    companyid
from 
    {{ ref('stg_deals') }}
where companyid is not null 
) , 

-- ONBOARDING

onboarding as (
select 
    companyid,
    properties_closedate as onboarding,
    days_to_close
    --entered_marketingqualifiedlead, -- CHANGED TIMESTAMP MQL FOR CONSIDERATION STAGE AS MOST TIMESTAMP VALUES COME LATER THEN FIRST WEBSITE VISIT TIMESTAMP
    --count(companyid) as consideration,
    --round(avg(days_to_close),1) as days_to_close

from 
    {{ ref('stg_deals') }}
where  properties_closedate is not null and companyid is not null 

)


-- IMPORTANT NOTE: DAYS TO CLOSE IS NOT RETURNING ANYTHING, EVEN AT THE SUB QUERY
-- WHILE IT DO RETURN DATA IN THE INT_VM_ONBOARDING
select 
DATE_TRUNC(CAST(onboarding as date) , MONTH) as month,
--a.companyid,
--a.selection, 
--b.onboarding,
--b.days_to_close,
round(avg(date_diff(CAST(onboarding as date),CAST(selection as date) , day)),1) as t3
--round(avg(date_diff(cast (selection as date),cast(entered_marketingqualifiedlead as date) , day)),1) as t2
from selection as a 
inner join onboarding as b on CAST(b.companyid AS NUMERIC) = CAST(a.companyid AS NUMERIC)
group by 1 --companyid 
order by 1 desc 
