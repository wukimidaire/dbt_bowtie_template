{{ config(materialized="table") }}

with companies as (select * from `outbound-catalyst.robaws.hubspotcompanies`)
