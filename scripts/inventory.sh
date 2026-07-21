#!/bin/bash

set -e

REGION="us-east-1"

echo "========================================"
echo "AWS SECURITY INVENTORY"
echo "========================================"

echo ""
echo "AWS Account Information"
echo "----------------------------------------"

aws sts get-caller-identity

echo ""
echo "EC2 Instances"
echo "----------------------------------------"

aws ec2 describe-instances \
    --region "$REGION" \
    --query 'Reservations[].Instances[].{
        InstanceId:InstanceId,
        State:State.Name,
        Type:InstanceType,
        PublicIP:PublicIpAddress,
        PrivateIP:PrivateIpAddress
    }' \
    --output table

echo ""
echo "Security Groups"
echo "----------------------------------------"

aws ec2 describe-security-groups \
    --region "$REGION" \
    --query 'SecurityGroups[].{
        GroupId:GroupId,
        Name:GroupName,
        Description:Description,
        VPC:VpcId
    }' \
    --output table

echo ""
echo "S3 Buckets"
echo "----------------------------------------"

aws s3api list-buckets \
    --query 'Buckets[].Name' \
    --output table

echo ""
echo "IAM Users"
echo "----------------------------------------"

aws iam list-users \
    --query 'Users[].{
        Username:UserName,
        Created:CreateDate
    }' \
    --output table

echo ""
echo "IAM Groups"
echo "----------------------------------------"

aws iam list-groups \
    --query 'Groups[].GroupName' \
    --output table

echo ""
echo "IAM Roles"
echo "----------------------------------------"

aws iam list-roles \
    --query 'Roles[].RoleName' \
    --output table

echo ""
echo "EC2 Key Pairs"
echo "----------------------------------------"

aws ec2 describe-key-pairs \
    --region "$REGION" \
    --query 'KeyPairs[].KeyName' \
    --output table

echo ""
echo "========================================"
echo "INVENTORY COMPLETE"
echo "========================================"
