{{ config(materialized="table") }}

with month as ( 
SELECT 
    DATE_TRUNC(CURRENT_DATE(), MONTH) - INTERVAL n MONTH AS month
FROM UNNEST(GENERATE_ARRAY(0, 48)) AS n
ORDER BY month DESC
)



select 
    FORMAT_DATE('%Y-%m-%d', a.month) as month,--a.first_contact_create_date as month, 
    b.companies_created,
    c.companies as vm_awareness,
    h.t1,
    ROUND(CASE WHEN c.companies > 0 THEN (d.education / c.companies * 100.0) ELSE 0 END, 1) as cr_education,
    d.education as vm_education,
    i.t2,
    ROUND(CASE WHEN e.consideration > 0 THEN (e.consideration  / d.education * 100.0 ) ELSE 0 END, 1) as cr_consideration,
    e.consideration as vm_consideration,
    --j.t3
    ROUND(CASE WHEN e.consideration > 0 THEN (f.onboarding * 100.0 / e.consideration) ELSE 0 END, 1) as cr_close,
    f.onboarding as vm_onboarding,
    g.retained as vm_retained,
    g.impact as vm_impact,
    NULL AS vm_growth
    
    --min(create_date) as first_contact_create_date
from 
   month as a 
    left join {{ ref('int_vm_creation') }} b on CAST(b.first_contact_create_date AS DATE) = a.month
    left join {{ ref('int_vm_awareness') }} c on CAST(c.first_website_visit AS DATE) = a.month
    left join {{ ref('int_vm_education') }} d on d.month = a.month 
    left join {{ ref('int_vm_consideration') }} e on CAST(e.month AS DATE) = a.month 
    left join {{ ref('int_vm_onboarding') }} f on CAST(f.month AS DATE) = a.month 
    left join {{ ref('int_vm_impact') }} g on CAST(g.month AS DATE) = a.month 
    left join {{ ref('int_t1_awareness') }} h on CAST(h.month AS DATE) = a.month
    left join {{ ref('int_t2_education') }} i on CAST(i.month AS DATE) = a.month
    --left join {{ ref('int_t3_onboarding') }} j on CAST(j.month AS DATE) = a.month
    --a.contact_create_date

--order by     contact_create_date desc 
