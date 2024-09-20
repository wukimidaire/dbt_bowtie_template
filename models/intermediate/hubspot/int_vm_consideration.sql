{{ config(materialized="table") }}

select 
    createdate as month,
    --entered_marketingqualifiedlead, -- CHANGED TIMESTAMP MQL FOR CONSIDERATION STAGE AS MOST TIMESTAMP VALUES COME LATER THEN FIRST WEBSITE VISIT TIMESTAMP
    count(companyid) as consideration,
    round(avg(days_to_close),1) as days_to_close

from 
    {{ ref('stg_deals') }}
group by 1 
order by 1 desc 




--select
--    DATE_TRUNC(CAST(CONCAT(first_website_visit, '-01') AS DATE), MONTH) as first_website_visit,
--    companyid,
--    id
   
--from 
--    {{ ref('stg_contacts') }}


--select 
--    companyid,
--    SUM(num_visits) as num_visits,
--    MIN(properties_hs_date_entered_marketingqualifiedlead) --as min_entered_marketingqualifiedlead
--from 
--    {{ ref('stg_contacts') }}
--group by 
--    companyid
--having MIN(properties_hs_date_entered_marketingqualifiedlead) is not null 

--select 
--    properties_createdate,
--    companyid
--from 
--    {{ ref('stg_deals') }}
--where companyid is not null 