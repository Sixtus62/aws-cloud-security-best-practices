#!/bin/bash

REGION="us-east-1"

echo "========================================"
echo "SECURITY GROUP SECURITY AUDIT"
echo "========================================"

GROUPS=$(aws ec2 describe-security-groups \
    --region "$REGION" \
    --query 'SecurityGroups[].GroupId' \
    --output text)

for SG in $GROUPS
do
    echo ""
    echo "Security Group: $SG"
    echo "----------------------------------------"

    aws ec2 describe-security-groups \
        --group-ids "$SG" \
        --region "$REGION" \
        --query 'SecurityGroups[].IpPermissions[]' \
        --output json

done

echo ""
echo "Audit completed."
