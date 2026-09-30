# Snapshot operations:
liquibase \
    --output-file=mySnapshot.json \
    snapshot \
    --snapshot-format=json  \
    --schemas=LIQUIBASE_USER

# Diff operations:
liquibase --output-file=diff.json diff --format=json

liquibase --reports-enabled=true \
             --reports-path=reports \
             --reports-name=06.diff_report.html \
             diff \
             --drift-severity=1 \
             --drift-severity-missing=2 \
             --reference-url="offline:sqlserver?snapshot=mySnapshot.json"

liquibase --reports-enabled=true \
             --reports-path=reports \
             --reports-name=06.diff_report.html \
             diff


# liquibase.drift.severity=[0|1|2|3|4]
# liquibase.drift.severity.missing=[0|1|2|3|4]
# liquibase.drift.severity.unexpected=[0|1|2|3|4]
# liquibase.drift.severity.changed=[0|1|2|3|4]

