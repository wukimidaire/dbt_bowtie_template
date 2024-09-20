{{ config(materialized="table") }}
-- THIS LOGIC IS APPLIED WHERE CONTACTS WHERE A WEBSITEVISIT IS TRACKED 
-- BY USING THE COLUMN TIMESTAMP VALUE FIRST_WEBSITE_VISIT 
-- TO DEFINE COMPANIES WHO HAVE A SOMEONE WHO VISITED THE WEBSITE FOR THE FIRST TIME
select
    DATE_TRUNC(CAST(CONCAT(first_website_visit, '-01') AS DATE), MONTH) as first_website_visit,
    count(companyid) as companies,
    count(id) as contacts
   
from 
    {{ ref('stg_contacts') }}
group by 1 
order by 1 desc 



