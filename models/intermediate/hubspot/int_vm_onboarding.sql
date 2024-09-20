{{ config(materialized="table") }}

select 
    closedate as month,
    --entered_marketingqualifiedlead, -- CHANGED TIMESTAMP MQL FOR CONSIDERATION STAGE AS MOST TIMESTAMP VALUES COME LATER THEN FIRST WEBSITE VISIT TIMESTAMP
    count(companyid) as onboarding,
    round(avg(days_to_close),1) as days_to_close
from 
    {{ ref('stg_deals') }}
where closedII = true 
group by 1 
order by 1 desc 