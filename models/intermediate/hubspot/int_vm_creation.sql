{{ config(materialized="table") }}

select 
    DATE_TRUNC(CAST(CONCAT(create_date, '-01') AS DATE), MONTH) as first_contact_create_date,
    count(companyid) as companies_created, 
    count(id) as associated_contacts
from 
    {{ ref('stg_contacts') }} 
group by 1
order by 1 desc 