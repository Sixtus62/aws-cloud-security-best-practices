#!/bin/bash

echo "========================================"
echo "IAM SECURITY AUDIT"
echo "========================================"

echo ""
echo "IAM USERS"
echo "----------------------------------------"

aws iam list-users \
    --query 'Users[].UserName' \
    --output table

echo ""
echo "IAM GROUPS"
echo "----------------------------------------"

aws iam list-groups \
    --query 'Groups[].GroupName' \
    --output table

echo ""
echo "IAM ROLES"
echo "----------------------------------------"

aws iam list-roles \
    --query 'Roles[].RoleName' \
    --output table

echo ""
echo "USER ACCESS KEYS"
echo "----------------------------------------"

USERS=$(aws iam list-users \
    --query 'Users[].UserName' \
    --output text)

for USER in $USERS
do
    echo "User: $USER"

    aws iam list-access-keys \
        --user-name "$USER" \
        --query 'AccessKeyMetadata[].{
            AccessKeyId:AccessKeyId,
            Status:Status,
            Created:CreateDate
        }' \
        --output table
done

echo ""
echo "IAM AUDIT COMPLETE"

