{{ config(materialized="table") }}

select 
    --closedate,
    closedate_plus_12_months as month,
    count(*) total,
    (count(*) * (sum(case when churned = 0 then 1 else 0 end) * 100.0 / count(*))/100) as impact,
    sum(case when churned = 1 then 1 else 0 end) as total_churned,
    (sum(case when churned = 0 then 1 else 0 end) * 100.0 / count(*)) as retained,
    --count(companyid) as companies,
    --round(avg(days_to_close),1) as days_to_close
from 
    {{ ref('stg_deals') }}
where closedate != '' and closedII = true
group by 1 --,2
order by 1 desc 
--group by 1 
--order by 1 desc 


