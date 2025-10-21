{% test check_value(model, column_name) %}

select * from {{model}}
where {{column_name}} < 3000

{% endtest %}