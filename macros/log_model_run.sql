{% macro log_model_run() %}


INSERT INTO AUDIT.MODEL_RUN_LOG
(
    RUN_ID,
    MODEL_NAME,
    RUN_TIME,
    STATUS
)
VALUES
(
    '{{ invocation_id }}',
    '{{ model.name }}',
    CURRENT_TIMESTAMP,
    'SUCCESS'
);

{% endmacro %}