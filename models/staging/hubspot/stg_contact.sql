with 

source as (

    select * from {{ source('robaws', 'hubspotcontacts') }}

),

renamed as (

    select
        --_airbyte_raw_id,
        --_airbyte_extracted_at,
        --_airbyte_meta,
        --_airbyte_generation_id,
        id,
        archived,
        companies,
        createdat,
        updatedat,
        properties,
        properties_fax,
        properties_zip,
        properties_city,
        properties_email,
        properties_phone,
        properties_state,
        properties_degree,
        properties_gender,
        properties_school,
        properties_address,
        properties_company,
        properties_country,
        properties_ip_city,
        properties_message,
        properties_website,
        properties_activity,
        properties_icp_tier,
        properties_industry,
        properties_ip_state,
        properties_jobtitle,
        properties_language,
        properties_lastname,
        properties_subniche,
        properties_utm_term,
        properties_closedate,
        properties_firstname,
        properties_ip_latlon,
        properties_num_notes,
        properties_seniority,
        properties_createdate,
        properties_form_stage,
        properties_hs_persona,
        properties_ip_country,
        properties_ip_zipcode,
        properties_salutation,
        properties_start_date,
        properties_work_email,
        properties_hs_language,
        properties_hs_pipeline,
        properties_hs_timezone,
        properties_mobilephone,
        properties_referenties,
        properties_robaws_next,
        properties_utm_content,
        properties_company_size,
        properties_fakelastname,
        properties_hs_object_id,
        properties_hs_read_only,
        properties_hs_testpurge,
        properties_hubspotscore,
        properties_job_function,
        properties_numemployees,
        properties_annualrevenue,
        properties_date_of_birth,
        properties_days_to_close,
        properties_evenementnaam,
        properties_fakefirstname,
        properties_hs_createdate,
        properties_hs_email_open,
        properties_hs_is_contact,
        properties_ip_state_code,
        properties_scoreapp_link,
        properties_total_revenue,
        properties_twitterhandle,
        properties_vacature_voor,
        properties_field_of_study,
        properties_howdoyouknowus,
        properties_hs_buying_role,
        properties_hs_email_click,
        properties_hs_ip_timezone,
        properties_hs_is_unworked,
        properties_hs_lead_status,
        properties_hs_legal_basis,
        properties_job_pagina_url,
        properties_lifecyclestage,
        properties_marital_status,
        properties_scoreapp_score,
        properties_business_review,
        properties_graduation_date,
        properties_hs_all_team_ids,
        properties_hs_email_bounce,
        properties_hs_email_domain,
        properties_hs_email_optout,
        properties_hs_testrollback,
        properties_hs_time_in_lead,
        properties_hs_was_imported,
        properties_hubspot_team_id,
        properties_ip_country_code,
        properties_lemlistbirthday,
        properties_lemlistcivility,
        properties_military_status,
        properties_hs_all_owner_ids,
        properties_hs_email_replied,
        properties_hs_latest_source,
        properties_hs_object_source,
        properties_hs_time_in_other,
        properties_hubspot_owner_id,
        properties_lastmodifieddate,
        properties_refurbished_lead,
        properties_smartlead_bucket,
        properties_telmacom_contact,
        properties_enriched_by_bizzy,
        properties_lead_status_wappy,
        properties_lemlistoccupation,
        properties_telmacom_reaction,
        properties_hs_count_is_worked,
        properties_hs_email_delivered,
        properties_hs_google_click_id,
        properties_lemlistlinkedinurl,
        properties_lemlistlmlststatus,
        properties_notes_last_updated,
        properties_recent_deal_amount,
        properties_associatedcompanyid,
        properties_currentlyinworkflow,
        properties_datum_call_telmacom,
        properties_hs_all_contact_vids,
        properties_hs_analytics_source,
        properties_hs_date_exited_lead,
        properties_hs_lastmodifieddate,
        properties_hs_object_source_id,
        properties_hs_time_in_customer,
        properties_instagram_overzicht,
        properties_job_title_smartlead,
        properties_lemlistlocationname,
        properties_num_contacted_notes,
        properties_relationship_status,
        properties_smartlead_campaigns,
        properties_aircall_last_call_at,
        properties_hs_additional_emails,
        properties_hs_analytics_revenue,
        properties_hs_count_is_unworked,
        properties_hs_date_entered_lead,
        properties_hs_date_exited_other,
        properties_hs_email_bad_address,
        properties_hs_email_quarantined,
        properties_hs_facebook_click_id,
        properties_hs_marketable_status,
        properties_hs_merged_object_ids,
        properties_hs_registered_member,
        properties_hs_time_in_533234369,
        properties_lemlistjoincompanyin,
        properties_lemlistlmlstcampaign,
        properties_notes_last_contacted,
        properties_num_associated_deals,
        properties_first_conversion_date,
        properties_first_email_sent_date,
        properties_hs_analytics_last_url,
        properties_hs_created_by_user_id,
        properties_hs_date_entered_other,
        properties_hs_quarantined_emails,
        properties_hs_time_in_evangelist,
        properties_hs_time_in_subscriber,
        properties_hs_updated_by_user_id,
        properties_introw_source_partner,
        properties_linkedin_profile_link,
        properties_mql_disqualified_date,
        properties_num_conversion_events,
        properties_call_status__telmacom_,
        properties_hs_analytics_first_url,
        properties_hs_clicked_linkedin_ad,
        properties_hs_email_is_ineligible,
        properties_hs_facebook_ad_clicked,
        properties_hs_first_outreach_date,
        properties_hs_linkedin_ad_clicked,
        properties_hs_object_source_label,
        properties_hs_registration_method,
        properties_hs_time_in_opportunity,
        properties_hs_unique_creation_key,
        properties_hs_v2_date_exited_lead,
        properties_koalify_main_duplicate,
        properties_last_used_aircall_tags,
        properties_recent_conversion_date,
        properties_recent_deal_close_date,
        properties_datum_afspraak_telmacom,
        properties_first_call_attempt_date,
        properties_first_call_connect_date,
        properties_first_deal_created_date,
        properties_first_meeting_booked_by,
        properties_hs_analytics_num_visits,
        properties_hs_date_exited_customer,
        properties_hs_email_last_open_date,
        properties_hs_email_last_send_date,
        properties_hs_latest_source_data_1,
        properties_hs_latest_source_data_2,
        properties_hs_marketable_reason_id,
        properties_hs_pinned_engagement_id,
        properties_hs_v2_date_entered_lead,
        properties_hs_v2_date_exited_other,
        properties_koalify_duplicate_rules,
        properties_webinareventlastupdated,
        properties_hs_date_entered_customer,
        properties_hs_date_exited_533234369,
        properties_hs_email_first_open_date,
        properties_hs_email_first_send_date,
        properties_hs_email_last_click_date,
        properties_hs_email_last_email_name,
        properties_hs_email_last_reply_date,
        properties_hs_latest_open_lead_date,
        properties_hs_object_source_user_id,
        properties_hs_sequences_is_enrolled,
        properties_hs_v2_date_entered_other,
        properties_hs_whatsapp_phone_number,
        properties_notes_next_activity_date,
        properties_disqualified_reason__mql_,
        properties_disqualified_reason__sql_,
        properties_hs_avatar_filemanager_key,
        properties_hs_calculated_merged_vids,
        properties_hs_date_entered_533234369,
        properties_hs_date_exited_evangelist,
        properties_hs_date_exited_subscriber,
        properties_hs_email_first_click_date,
        properties_hs_email_first_reply_date,
        properties_hs_email_optout_156530274,
        properties_hs_email_optout_157367379,
        properties_hs_email_optout_160052571,
        properties_hs_email_optout_162296097,
        properties_hs_email_optout_349750350,
        properties_hs_marketable_reason_type,
        properties_hs_mobile_sdk_push_tokens,
        properties_hs_object_source_detail_1,
        properties_hs_object_source_detail_2,
        properties_hs_object_source_detail_3,
        properties_hs_user_ids_of_all_owners,
        properties_hs_v2_latest_time_in_lead,
        properties_last_aircall_call_outcome,
        properties_lemlistemailqualification,
        properties_sql_qualification_outcome,
        properties_hs_all_accessible_team_ids,
        properties_hs_analytics_last_referrer,
        properties_hs_analytics_source_data_1,
        properties_hs_analytics_source_data_2,
        properties_hs_calculated_phone_number,
        properties_hs_date_entered_evangelist,
        properties_hs_date_entered_subscriber,
        properties_hs_date_exited_opportunity,
        properties_hs_document_last_revisited,
        properties_hs_emailconfirmationstatus,
        properties_hs_has_active_subscription,
        properties_hs_latest_meeting_activity,
        properties_hs_latest_source_timestamp,
        properties_hs_sales_email_last_opened,
        properties_hs_v2_date_exited_customer,
        properties_hs_v2_latest_time_in_other,
        properties_hubspot_owner_assigneddate,
        properties_introw_collaborating_since,
        properties_resultaatcode_groep_victus,
        properties_first_conversion_event_name,
        properties_hs_analytics_first_referrer,
        properties_hs_analytics_last_timestamp,
        properties_hs_analytics_num_page_views,
        properties_hs_calculated_mobile_number,
        properties_hs_content_membership_email,
        properties_hs_content_membership_notes,
        properties_hs_created_by_conversations,
        properties_hs_date_entered_opportunity,
        properties_hs_email_hard_bounce_reason,
        properties_hs_email_quarantined_reason,
        properties_hs_feedback_last_nps_rating,
        properties_hs_last_sales_activity_date,
        properties_hs_last_sales_activity_type,
        properties_hs_latest_sequence_enrolled,
        properties_hs_lifecyclestage_lead_date,
        properties_hs_marketable_until_renewal,
        properties_hs_notes_next_activity_type,
        properties_hs_sa_first_engagement_date,
        properties_hs_sales_email_last_clicked,
        properties_hs_sales_email_last_replied,
        properties_hs_sequences_enrolled_count,
        properties_hs_time_to_first_engagement,
        properties_hs_v2_date_entered_customer,
        properties_hs_v2_date_exited_533234369,
        properties_resultaat_victus_callcenter,
        properties_associatedcompanylastupdated,
        properties_first_meeting_completed_date,
        properties_first_meeting_scheduled_date,
        properties_hs_analytics_first_timestamp,
        properties_hs_content_membership_status,
        properties_hs_feedback_last_survey_date,
        properties_hs_lifecyclestage_other_date,
        properties_hs_sa_first_engagement_descr,
        properties_hs_v2_date_entered_533234369,
        properties_hs_v2_date_exited_evangelist,
        properties_hs_v2_date_exited_subscriber,
        properties_koalify_duplicate_properties,
        properties_koalify_is_primary_duplicate,
        properties_koalify_number_of_duplicates,
        properties_num_unique_conversion_events,
        properties_recent_conversion_event_name,
        properties_surveymonkeyeventlastupdated,
        properties_wat_is_jullie_core_business_,
        properties_first_meeting_l_quality_score,
        properties_hs_associated_target_accounts,
        properties_hs_first_engagement_object_id,
        properties_hs_latest_qualified_lead_date,
        properties_hs_latest_sequence_ended_date,
        properties_hs_time_in_salesqualifiedlead,
        properties_hs_v2_cumulative_time_in_lead,
        properties_hs_v2_date_entered_evangelist,
        properties_hs_v2_date_entered_subscriber,
        properties_hs_v2_date_exited_opportunity,
        properties_hs_v2_latest_time_in_customer,
        properties_welke_tool_gebruik_je_vandaag,
        properties_hs_calculated_form_submissions,
        properties_hs_conversations_visitor_email,
        properties_hs_feedback_last_nps_follow_up,
        properties_hs_v2_cumulative_time_in_other,
        properties_hs_v2_date_entered_opportunity,
        properties_hs_v2_latest_time_in_533234369,
        properties_last_contact_victus_callcenter,
        properties_last_used_aircall_phone_number,
        properties_time_between_mql_and_contacted,
        properties_engagements_last_meeting_booked,
        properties_hs_analytics_average_page_views,
        properties_hs_feedback_show_nps_web_survey,
        properties_hs_lifecyclestage_customer_date,
        properties_hs_v2_latest_time_in_evangelist,
        properties_hs_v2_latest_time_in_subscriber,
        properties_call_back_date_victus_callcenter,
        properties_hs_email_hard_bounce_reason_enum,
        properties_hs_last_sales_activity_timestamp,
        properties_hs_latest_disqualified_lead_date,
        properties_hs_latest_sequence_enrolled_date,
        properties_hs_latest_sequence_finished_date,
        properties_hs_v2_latest_time_in_opportunity,
        properties_disqualified_reason___wappy__mql_,
        properties_disqualified_reason___wappy__sql_,
        properties_hs_analytics_last_visit_timestamp,
        properties_hs_date_exited_salesqualifiedlead,
        properties_hs_eventbrite_lastregisteredevent,
        properties_hs_first_subscription_create_date,
        properties_hs_lifecyclestage_evangelist_date,
        properties_hs_lifecyclestage_subscriber_date,
        properties_hs_time_in_marketingqualifiedlead,
        properties_hs_v2_cumulative_time_in_customer,
        properties_interesse_in_robaws___wappy_demo_,
        properties_hs_analytics_first_visit_timestamp,
        properties_hs_analytics_num_event_completions,
        properties_hs_date_entered_salesqualifiedlead,
        properties_hs_latest_sequence_unenrolled_date,
        properties_hs_latest_subscription_create_date,
        properties_hs_lifecyclestage_opportunity_date,
        properties_hs_sa_first_engagement_object_type,
        properties_hs_v2_cumulative_time_in_533234369,
        properties_most_recent_meeting_completed_date,
        properties_afspraak_tijdstip_victus_callcenter,
        properties_hs_content_membership_registered_at,
        properties_hs_v2_cumulative_time_in_evangelist,
        properties_hs_v2_cumulative_time_in_subscriber,
        properties_number_of_decision_form_submissions,
        properties_hs_calculated_phone_number_area_code,
        properties_hs_email_customer_quarantined_reason,
        properties_hs_email_sends_since_last_engagement,
        properties_hs_sequences_actively_enrolled_count,
        properties_hs_v2_cumulative_time_in_opportunity,
        properties_hs_v2_date_exited_salesqualifiedlead,
        properties_number_of_awareness_form_submissions,
        properties_hs_content_membership_email_confirmed,
        properties_hs_date_exited_marketingqualifiedlead,
        properties_hs_eventbrite_lastregisteredeventdate,
        properties_hs_searchable_calculated_phone_number,
        properties_hs_time_to_move_from_lead_to_customer,
        properties_hs_v2_date_entered_salesqualifiedlead,
        properties_engagements_last_meeting_booked_medium,
        properties_engagements_last_meeting_booked_source,
        properties_hs_calculated_phone_number_region_code,
        properties_hs_date_entered_marketingqualifiedlead,
        properties_hs_searchable_calculated_mobile_number,
        properties_hs_calculated_phone_number_country_code,
        properties_hs_v2_latest_time_in_salesqualifiedlead,
        properties_outbound_project___clay_enriched_record,
        properties_engagements_last_meeting_booked_campaign,
        properties_hs_v2_date_exited_marketingqualifiedlead,
        properties_number_of_consideration_form_submissions,
        properties_resultaat_omschrijving_victus_callcenter,
        properties_disqualification_reason__mql____free_text,
        properties_first_meeting_l_quality_score_l_free_text,
        properties_hs_lifecyclestage_salesqualifiedlead_date,
        properties_hs_user_ids_of_all_notification_followers,
        properties_hs_v2_date_entered_marketingqualifiedlead,
        properties_hs_membership_has_accessed_private_content,
        properties_hs_analytics_last_touch_converting_campaign,
        properties_hs_content_membership_follow_up_enqueued_at,
        properties_hs_time_to_move_from_subscriber_to_customer,
        properties_hs_user_ids_of_all_notification_unfollowers,
        properties_hs_v2_cumulative_time_in_salesqualifiedlead,
        properties_hs_v2_latest_time_in_marketingqualifiedlead,
        properties_hs_analytics_first_touch_converting_campaign,
        properties_hs_time_to_move_from_opportunity_to_customer,
        properties_hs_lifecyclestage_marketingqualifiedlead_date,
        properties_gebruik_je_al_software_hiervoor_zo_ja_dewelke_,
        properties_hs_membership_last_private_content_access_date,
        properties_hs_time_between_contact_creation_and_deal_close,
        properties_hs_v2_cumulative_time_in_marketingqualifiedlead,
        properties_hs_content_membership_registration_email_sent_at,
        properties_hs_content_membership_registration_domain_sent_to,
        properties_hs_time_between_contact_creation_and_deal_creation,
        properties_hs_searchable_calculated_international_phone_number,
        properties_hs_time_to_move_from_salesqualifiedlead_to_customer,
        properties_hs_searchable_calculated_international_mobile_number,
        properties_hs_time_to_move_from_marketingqualifiedlead_to_customer,
        properties_hoeveel_administratief_personeel_is_er_aanwezig_in_jouw_bedrijf,
        properties_wanneer_zou_je_van_start_willen_gaan_als_je_de_perfecte_tool_zou_vinden

    from source

)

select * from renamed
