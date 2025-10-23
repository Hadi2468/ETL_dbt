{% snapshot snapshot_patient %}

{{ config ( strategy='check',
            unique_key='PATIENT_ID',
            check_cols=['PATIENT_NAME','PATIENT_CONTACT_NUMBER','PATIENT_EMAIL_ID','PATIENT_ADDRESS']) }}

select * from {{source('patient','PATIENT_SRC')}}

{% endsnapshot %}