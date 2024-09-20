{{ config(materialized="table") }}

-- AWARENESS 

with awareness as (
select
    companyid,
    MIN(properties_hs_analytics_first_visit_timestamp) as first_website_visit
from 
    {{ ref('stg_contacts') }}
where 
    companyid is not null and properties_hs_analytics_first_visit_timestamp is not null 
group by 
    companyid
    ) ,


-- EDUCATION
-- COMPANY SPECIFIC REASONING NEEDS TO BE APPLIED
-- THIS TO MAKE A DIFFERENCE BETWEEN FIRST WEBSITE VISIT
-- AND A MARKETING QUALIFIED LEAD/COMPANY AND ASSOCIATED TIMESTAMP
-- WITHOUT ALIGNMENT OR SPECIFIC DEFINITION AND TRACKING, THERE IS NO DIFFERENCE IN THE MODEL
-- A TOOL LIKE DREAMDATA ENABLES THIS STEP AS IT UNCOVERS THE TRUE FIRST TOUCHPOINT WITH THE COMPANY
-- https://www.linkedin.com/posts/steffenhedebrandt_b2bmarketing-paidsocial-activity-7242438929268793344-7TH6?utm_source=share&utm_medium=member_desktop


education as ( 
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
)


-- CALCULATING THE DIFFERENCE BETWEEN FIRST ACCOUNT AWARENESS TIMESTAMP AND EDUCATIONAL TIMESTAMP
-- TAKING THE AVERAGE OF DAY DIFFERENCE OF EACH COMPANY IN EACH GIVEN MONTH

select 
--a.companyid, 
--first_website_visit, 
DATE_TRUNC(CAST(entered_marketingqualifiedlead as date) , MONTH) as month,
round(avg(date_diff(cast (entered_marketingqualifiedlead as date),cast(first_website_visit as date) , day)),1) as t1
from awareness as a 
inner join education as b on b.companyid = a.companyid 
group by 1 --companyid 
order by 1 desc 