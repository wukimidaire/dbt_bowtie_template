--{{ config(materialized="table") }}
select * from {{ source("robaws", "hubspotcompanies") }}
