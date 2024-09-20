{{ config(materialized="table") }}
        select
            id,
            properties_dealname,
            -- Extract the first company ID from the JSON array
            JSON_EXTRACT_SCALAR(companies, '$[0]') as companyid,
            properties_amount as amount,
            --properties_hs_closed_amount as amountII, -- NOT USED, MOSTLY 0 VALUES IN THIS COLUMN
            properties_hs_acv as acv, 
            properties_hs_arr as arr, 
            properties_hs_mrr as mrr, 
            properties_hs_tcv as tcv, 
            properties_pipeline as pipeline,
            properties_dealstage as dealstage, 
            FORMAT_TIMESTAMP('%Y-%m-01', properties_createdate) as createdate,
            properties_createdate, -- NEEDED FOR CALCULATING VELOCITY METRICS
            FORMAT_TIMESTAMP('%Y-%m-01', properties_closedate) as closedate,
            properties_closedate, -- NEEDED FOR CALCULATING TIME METRICS
            FORMAT_TIMESTAMP('%Y-%m-01', properties_hs_date_exited_closedwon ) as exited_closewon,
            properties_hs_date_entered_closedlost,
            properties_hs_date_exited_closedwon,
            properties_hs_v2_date_exited_closedwon,
            FORMAT_TIMESTAMP('%Y-%m-01', DATE_ADD(CAST(properties_closedate AS DATE), INTERVAL 12 MONTH)) as closedate_plus_12_months,
            CASE 
                WHEN CAST(properties_hs_date_exited_closedwon AS DATE) < DATE_ADD(CAST(properties_closedate AS DATE), INTERVAL 12 MONTH) THEN 1 
                ELSE 0 
            END as churned,
            -- Calculate days between createdate and closedate if closed is true
            CASE 
                WHEN properties_hs_is_closed_won = true THEN 
                    DATE_DIFF(properties_closedate, properties_createdate, DAY)
                ELSE 
                    NULL 
            END as days_to_close,
            --properties_hs_createdate as createdateII, 
            properties_hs_is_closed as closed, 
            properties_hs_is_closed_won as closedII,
            archived

        from {{ source("robaws", "hubspotdeals") }}
        --where properties_hs_v2_date_exited_closedwon is not null or properties_hs_date_entered_closedlost is not null 
        --properties_dealstage = 'closedwon' --and properties_hs_date_exited_closedwon is not null --properties_hs_is_closed = true --and properties_hs_is_closed_won = true
