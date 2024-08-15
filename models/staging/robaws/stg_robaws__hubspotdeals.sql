with 

source as (

    select * from {{ source('robaws', 'hubspotdeals') }}

),

deal as (

    select
        _airbyte_raw_id,
        _airbyte_extracted_at,
        _airbyte_meta,
        _airbyte_generation_id,
        id,
        archived,
        contacts,
        companies,
        createdat,
        updatedat,
        line_items,
        properties,
        properties_varia,
        properties_amount,
        properties_hs_acv,
        properties_hs_arr,
        properties_hs_mrr,
        properties_hs_tcv,
        properties_source,
        properties_jira_id,
        properties_partner,
        properties_dealname,
        properties_dealtype,
        properties_pipeline,
        properties_software,
        properties_closedate,
        properties_dealstage,
        properties_num_notes,
        properties_createdate,
        properties_hs_tag_ids,
        properties_arr_segment,
        properties_description,
        properties_hs_campaign,
        properties_hs_priority,
        properties_todays_date,
        properties_demo_locatie,
        properties_hs_is_closed,
        properties_hs_next_step,
        properties_hs_object_id,
        properties_hs_read_only,
        properties_days_to_close,
        properties_hs_createdate,
        properties_hs_deal_score,
        properties_deal_owner_name,
        properties_hs_all_team_ids,
        properties_hs_was_imported,
        properties_hubspot_team_id,
        properties_arbeiders__copy_,
        properties_bedienden__copy_,
        properties_hs_all_owner_ids,
        properties_hs_closed_amount,
        properties_hs_exchange_rate,
        properties_hs_is_closed_won,
        properties_hs_is_open_count,
        properties_hs_object_source,
        properties_hubspot_owner_id,
        properties_closed_won_reason,
        properties_closed_lost_reason,
        properties_deal_currency_code,
        properties_hs_closed_won_date,
        properties_hs_forecast_amount,
        properties_hs_is_closed_count,
        properties_lfapp_latest_visit,
        properties_notes_last_updated,
        properties_hs_analytics_source,
        properties_hs_closed_won_count,
        properties_hs_lastmodifieddate,
        properties_hs_object_source_id,
        properties_hs_predicted_amount,
        properties_hs_projected_amount,
        properties_num_contacted_notes,
        properties_hs_days_to_close_raw,
        properties_hs_merged_object_ids,
        properties_hs_time_in_163202759,
        properties_hs_time_in_163202762,
        properties_hs_time_in_163202764,
        properties_hs_time_in_163202765,
        properties_hs_time_in_170509252,
        properties_hs_time_in_187642298,
        properties_hs_time_in_187642299,
        properties_hs_time_in_187642300,
        properties_hs_time_in_187642301,
        properties_hs_time_in_187642302,
        properties_hs_time_in_187642303,
        properties_hs_time_in_187642304,
        properties_hs_time_in_232615872,
        properties_hs_time_in_527959540,
        properties_hs_time_in_closedwon,
        properties_notes_last_contacted,
        properties_hs_created_by_user_id,
        properties_hs_time_in_closedlost,
        properties_hs_updated_by_user_id,
        properties_introw_source_partner,
        properties_lemlistlemlistchannel,
        properties_competitors_in_deal_v2,
        properties_hs_date_exited_9567448,
        properties_hs_date_exited_9567449,
        properties_hs_likelihood_to_close,
        properties_hs_num_target_accounts,
        properties_hs_object_source_label,
        properties_hs_unique_creation_key,
        properties_amount_in_home_currency,
        properties_hs_date_entered_9567448,
        properties_hs_date_entered_9567449,
        properties_hs_forecast_probability,
        properties_hs_next_step_updated_at,
        properties_hs_pinned_engagement_id,
        properties_hs_time_in_contractsent,
        properties_num_associated_contacts,
        properties_contact_via___open_field,
        properties_hs_date_exited_163202759,
        properties_hs_date_exited_163202762,
        properties_hs_date_exited_163202764,
        properties_hs_date_exited_163202765,
        properties_hs_date_exited_170509252,
        properties_hs_date_exited_187642298,
        properties_hs_date_exited_187642299,
        properties_hs_date_exited_187642300,
        properties_hs_date_exited_187642301,
        properties_hs_date_exited_187642302,
        properties_hs_date_exited_187642303,
        properties_hs_date_exited_187642304,
        properties_hs_date_exited_232615872,
        properties_hs_date_exited_527959540,
        properties_hs_date_exited_closedwon,
        properties_hs_object_source_user_id,
        properties_hs_open_deal_create_date,
        properties_lfapp_view_in_leadfeeder,
        properties_notes_next_activity_date,
        properties_hs_closed_deal_close_date,
        properties_hs_date_entered_163202759,
        properties_hs_date_entered_163202762,
        properties_hs_date_entered_163202764,
        properties_hs_date_entered_163202765,
        properties_hs_date_entered_170509252,
        properties_hs_date_entered_187642298,
        properties_hs_date_entered_187642299,
        properties_hs_date_entered_187642300,
        properties_hs_date_entered_187642301,
        properties_hs_date_entered_187642302,
        properties_hs_date_entered_187642303,
        properties_hs_date_entered_187642304,
        properties_hs_date_entered_232615872,
        properties_hs_date_entered_527959540,
        properties_hs_date_entered_closedwon,
        properties_hs_date_exited_closedlost,
        properties_hs_deal_stage_probability,
        properties_hs_is_in_first_deal_stage,
        properties_hs_latest_approval_status,
        properties_hs_object_source_detail_1,
        properties_hs_object_source_detail_2,
        properties_hs_object_source_detail_3,
        properties_hs_time_in_qualifiedtobuy,
        properties_hs_user_ids_of_all_owners,
        properties_gewenste_start_opleidingen,
        properties_hs_all_accessible_team_ids,
        properties_hs_analytics_latest_source,
        properties_hs_analytics_source_data_1,
        properties_hs_analytics_source_data_2,
        properties_hs_closed_deal_create_date,
        properties_hs_date_entered_closedlost,
        properties_hs_latest_meeting_activity,
        properties_hubspot_owner_assigneddate,
        properties_introw_collaborating_since,
        properties_time_between_created_today,
        properties_hs_all_deal_split_owner_ids,
        properties_hs_date_exited_contractsent,
        properties_hs_manual_forecast_category,
        properties_hs_notes_next_activity_type,
        properties_hs_sales_email_last_replied,
        properties_hs_v2_date_exited_163202759,
        properties_hs_v2_date_exited_163202762,
        properties_hs_v2_date_exited_163202764,
        properties_hs_v2_date_exited_163202765,
        properties_hs_v2_date_exited_170509252,
        properties_hs_v2_date_exited_187642298,
        properties_hs_v2_date_exited_187642299,
        properties_hs_v2_date_exited_187642300,
        properties_hs_v2_date_exited_187642301,
        properties_hs_v2_date_exited_187642302,
        properties_hs_v2_date_exited_187642303,
        properties_hs_v2_date_exited_187642304,
        properties_hs_v2_date_exited_232615872,
        properties_hs_v2_date_exited_527959540,
        properties_hs_v2_date_exited_closedwon,
        properties_opvolgdatum__indien_timing_,
        properties_hs_date_entered_contractsent,
        properties_hs_v2_date_entered_163202759,
        properties_hs_v2_date_entered_163202762,
        properties_hs_v2_date_entered_163202764,
        properties_hs_v2_date_entered_163202765,
        properties_hs_v2_date_entered_170509252,
        properties_hs_v2_date_entered_187642298,
        properties_hs_v2_date_entered_187642299,
        properties_hs_v2_date_entered_187642300,
        properties_hs_v2_date_entered_187642301,
        properties_hs_v2_date_entered_187642302,
        properties_hs_v2_date_entered_187642303,
        properties_hs_v2_date_entered_187642304,
        properties_hs_v2_date_entered_232615872,
        properties_hs_v2_date_entered_527959540,
        properties_hs_v2_date_entered_closedwon,
        properties_hs_v2_date_exited_closedlost,
        properties_agreed_to__video__testimonial,
        properties_closed_lost_reason__dropdown_,
        properties_hs_all_collaborator_owner_ids,
        properties_hs_date_exited_qualifiedtobuy,
        properties_hs_v2_date_entered_closedlost,
        properties_provincie__copy_from_company_,
        properties_hs_date_entered_qualifiedtobuy,
        properties_hs_v2_latest_time_in_163202759,
        properties_hs_v2_latest_time_in_163202762,
        properties_hs_v2_latest_time_in_163202764,
        properties_hs_v2_latest_time_in_163202765,
        properties_hs_v2_latest_time_in_170509252,
        properties_hs_v2_latest_time_in_187642298,
        properties_hs_v2_latest_time_in_187642299,
        properties_hs_v2_latest_time_in_187642300,
        properties_hs_v2_latest_time_in_187642301,
        properties_hs_v2_latest_time_in_187642302,
        properties_hs_v2_latest_time_in_187642303,
        properties_hs_v2_latest_time_in_187642304,
        properties_hs_v2_latest_time_in_232615872,
        properties_hs_v2_latest_time_in_527959540,
        properties_hs_v2_latest_time_in_closedwon,
        properties_engagements_last_meeting_booked,
        properties_hs_num_of_associated_line_items,
        properties_hs_time_in_appointmentscheduled,
        properties_hs_v2_latest_time_in_closedlost,
        properties_time_between_created_and_closed,
        properties_wat_was_doorslaggevende_factor_,
        properties_hs_deal_stage_probability_shadow,
        properties_hs_time_in_decisionmakerboughtin,
        properties_hs_time_in_presentationscheduled,
        properties_hs_v2_date_exited_qualifiedtobuy,
        properties_hs_all_assigned_business_unit_ids,
        properties_hs_analytics_latest_source_data_1,
        properties_hs_analytics_latest_source_data_2,
        properties_hs_closed_amount_in_home_currency,
        properties_hs_v2_date_entered_qualifiedtobuy,
        properties_indien_korting__hoeveel___waarom_,
        properties_hs_analytics_latest_source_company,
        properties_hs_analytics_latest_source_contact,
        properties_hs_v2_cumulative_time_in_163202759,
        properties_hs_v2_cumulative_time_in_163202762,
        properties_hs_v2_cumulative_time_in_163202764,
        properties_hs_v2_cumulative_time_in_163202765,
        properties_hs_v2_cumulative_time_in_170509252,
        properties_hs_v2_cumulative_time_in_187642298,
        properties_hs_v2_cumulative_time_in_187642299,
        properties_hs_v2_cumulative_time_in_187642300,
        properties_hs_v2_cumulative_time_in_187642301,
        properties_hs_v2_cumulative_time_in_187642302,
        properties_hs_v2_cumulative_time_in_187642303,
        properties_hs_v2_cumulative_time_in_187642304,
        properties_hs_v2_cumulative_time_in_232615872,
        properties_hs_v2_cumulative_time_in_527959540,
        properties_hs_v2_cumulative_time_in_closedwon,
        properties_hs_date_exited_appointmentscheduled,
        properties_hs_date_exited_customclosedwonstage,
        properties_hs_v2_cumulative_time_in_closedlost,
        properties_hs_v2_latest_time_in_qualifiedtobuy,
        properties_hs_analytics_latest_source_timestamp,
        properties_hs_date_entered_appointmentscheduled,
        properties_hs_date_entered_customclosedwonstage,
        properties_hs_date_exited_decisionmakerboughtin,
        properties_hs_date_exited_presentationscheduled,
        properties_hs_predicted_amount_in_home_currency,
        properties_hs_projected_amount_in_home_currency,
        properties_hs_date_entered_decisionmakerboughtin,
        properties_hs_date_entered_presentationscheduled,
        properties_hs_deal_amount_calculation_preference,
        properties_hs_latest_approval_status_approval_id,
        properties_welk_onboardingspakket_is_er_gekozen_,
        properties_welke_soort_licentie_is_er_afgenomen_,
        properties_engagements_last_meeting_booked_medium,
        properties_engagements_last_meeting_booked_source,
        properties_hs_v2_date_exited_appointmentscheduled,
        properties_welke_modules_willen_ze_implementeren_,
        properties_hs_v2_cumulative_time_in_qualifiedtobuy,
        properties_hs_v2_date_entered_appointmentscheduled,
        properties_reden_voor_keuze_van_onboarding_pakket_,
        properties_testimonial_details_l_person_to_contact,
        properties_do_no_touch_ll_closed_lost_consolidation,
        properties_engagements_last_meeting_booked_campaign,
        properties_hs_analytics_latest_source_data_1_company,
        properties_hs_analytics_latest_source_data_1_contact,
        properties_hs_analytics_latest_source_data_2_company,
        properties_hs_analytics_latest_source_data_2_contact,
        properties_hs_has_empty_conditional_stage_properties,
        properties_hs_user_ids_of_all_notification_followers,
        properties_hs_v2_latest_time_in_appointmentscheduled,
        properties_contact_via_l_consolidation__do_not_touch_,
        properties_wat_is_gerichte_go_live_datum_van_de_klant,
        properties_welke_licenties_moeten_worden_geactiveerd_,
        properties_hs_user_ids_of_all_notification_unfollowers,
        properties_hs_analytics_latest_source_timestamp_company,
        properties_hs_analytics_latest_source_timestamp_contact,
        properties_hs_v2_cumulative_time_in_appointmentscheduled,
        properties_welke_verwachtingen_heeft_de_klant_mbt_robaws_,
        properties_hoeveel_en_welke_licenties_worden_er_afgenomen_,
        properties_hs_line_item_global_term_hs_discount_percentage,
        properties_hs_line_item_global_term_recurringbillingfrequency,
        properties_hs_line_item_global_term_hs_recurring_billing_period,
        properties_hs_line_item_global_term_hs_discount_percentage_enabled,
        properties_hs_line_item_global_term_hs_recurring_billing_start_date,
        properties_hs_line_item_global_term_recurringbillingfrequency_enabled,
        properties_hs_line_item_global_term_hs_recurring_billing_period_enabled,
        properties_in_welke_sector_is_klant_actief_en_wat_is_hun_specialisatie_,
        properties_hs_line_item_global_term_hs_recurring_billing_start_date_enabled,
        properties_zijn_er_eventuele_red_flags_waar_wij_rekening_mee_moeten_houden_,
        properties_is_de_klant_snel_vertrokken_met_software__zijn_zij_digitaal_klaar_,
        properties_welk_probleem_willen_zij_oplossen__waarom_heeft_de_klant_specifiek_voor_robaws_gekozen_,
        properties_wie_zijn_de_stakeholders_tijdens_de_onboarding___decision_maker__key_user__project_sponsor_etc_

    from source

)

select * from deal
