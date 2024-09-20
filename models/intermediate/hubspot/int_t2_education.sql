
{{ config(materialized="table") }}


-- EDUCATION
-- COMPANY SPECIFIC REASONING NEEDS TO BE APPLIED
-- THIS TO MAKE A DIFFERENCE BETWEEN FIRST WEBSITE VISIT
-- AND A MARKETING QUALIFIED LEAD/COMPANY AND ASSOCIATED TIMESTAMP
-- WITHOUT ALIGNMENT OR SPECIFIC DEFINITION AND TRACKING, THERE IS NO DIFFERENCE IN THE MODEL
-- A TOOL LIKE DREAMDATA ENABLES THIS STEP AS IT UNCOVERS THE TRUE FIRST TOUCHPOINT WITH THE COMPANY
-- https://www.linkedin.com/posts/steffenhedebrandt_b2bmarketing-paidsocial-activity-7242438929268793344-7TH6?utm_source=share&utm_medium=member_desktop


with education as ( 
select
    companyid,
    MIN(properties_hs_date_entered_marketingqualifiedlead) as entered_marketingqualifiedlead
    
from 
    {{ ref('stg_contacts') }}
where 
    companyid is not null 
group by 
    companyid
  having MIN(properties_hs_date_entered_marketingqualifiedlead) is not null 
),



-- SELECTION

selection as ( 
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
    properties_createdate as month,
    --entered_marketingqualifiedlead, -- CHANGED TIMESTAMP MQL FOR CONSIDERATION STAGE AS MOST TIMESTAMP VALUES COME LATER THEN FIRST WEBSITE VISIT TIMESTAMP
    count(companyid) as consideration,
    round(avg(days_to_close),1) as days_to_close

from 
    {{ ref('stg_deals') }}
group by 1 
order by 1 desc 

)

select 
--a.companyid, 
--first_website_visit, 
DATE_TRUNC(CAST(selection as date) , MONTH) as month,
round(avg(date_diff(cast (selection as date),cast(entered_marketingqualifiedlead as date) , day)),1) as t2
from education as a 
inner join selection as b on CAST(b.companyid AS NUMERIC) = CAST(a.companyid AS NUMERIC)
group by 1 --companyid 
order by 1 desc 