{{ config(materialized="table") }}

    select
        id, 
        properties_hs_analytics_source as original_source,
        properties_hs_latest_source as latest_source, 
        properties_hs_object_source_detail_1,
        properties_hs_object_source_detail_2,
        properties_hs_object_source_detail_3,
        properties_hs_analytics_source_data_1,
        properties_hs_analytics_source_data_2,
        --properties_hs_analytics_source_data_1_timestamp_earliest_value_9b2f1fa1,
        --properties_hs_analytics_source_data_2_timestamp_earliest_value_9b2f9400,
        --properties_hs_analytics_latest_source,
        --properties_firstname,
        --properties_lastname,
        --roperties_email
        FORMAT_TIMESTAMP('%Y-%m', properties_createdate) as create_date, 
        --properties_company, 
        properties_associatedcompanyid as companyid,
        properties_lifecyclestage, 
        FORMAT_TIMESTAMP('%Y-%m', properties_hs_lifecyclestage_lead_date) as lc_lead_date,
        FORMAT_TIMESTAMP('%Y-%m', properties_hs_lifecyclestage_subscriber_date) as lc_subscriber_date,
        FORMAT_TIMESTAMP('%Y-%m', properties_hs_lifecyclestage_opportunity_date) as lc_opportunity_date,
        FORMAT_TIMESTAMP('%Y-%m', properties_hs_lifecyclestage_salesqualifiedlead_date) as lc_salesqualifiedlead_date,
        FORMAT_TIMESTAMP('%Y-%m', properties_hs_date_entered_subscriber) as entered_subscriber,
        FORMAT_TIMESTAMP('%Y-%m', properties_hs_date_entered_lead) as date_entered_lead,
        FORMAT_TIMESTAMP('%Y-%m', properties_hs_date_entered_marketingqualifiedlead) as entered_marketingqualifiedlead,
        properties_hs_date_entered_marketingqualifiedlead, -- NEEDED TO CALCULATE VELOCITY METRICS
        FORMAT_TIMESTAMP('%Y-%m', properties_hs_date_entered_salesqualifiedlead) as entered_salesqualifiedlead,
        FORMAT_TIMESTAMP('%Y-%m', properties_hs_date_entered_opportunity) as entered_opportunity,
        FORMAT_TIMESTAMP('%Y-%m', properties_hs_date_entered_customer) as entered_customer,
        FORMAT_TIMESTAMP('%Y-%m', properties_hs_date_entered_evangelist) as entered_evangelist,
        FORMAT_TIMESTAMP('%Y-%m', properties_hs_date_entered_other) as entered_other,
        FORMAT_TIMESTAMP('%Y-%m', properties_hs_date_entered_533234369) as entered_533234369,
        FORMAT_TIMESTAMP('%Y-%m', properties_hs_analytics_first_visit_timestamp) as first_website_visit,
        properties_hs_analytics_first_visit_timestamp as properties_hs_analytics_first_visit_timestamp,
        properties_hs_analytics_num_visits as num_visits
    from 
        {{ source("robaws", "hubspotcontacts") }}
