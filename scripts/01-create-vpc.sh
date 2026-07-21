#!/bin/bash

set -e

# ==============================
# AWS CLOUD SECURITY PROJECT
# VPC CREATION SCRIPT
# ==============================

REGION="eu-west-2"
VPC_CIDR="10.0.0.0/16"
VPC_NAME="cloud-security-vpc"

echo "========================================"
echo "AWS CLOUD SECURITY PROJECT"
echo "Creating VPC"
echo "========================================"

echo ""
echo "Region: $REGION"
echo "VPC CIDR: $VPC_CIDR"
echo "VPC Name: $VPC_NAME"

# Create VPC
VPC_ID=$(aws ec2 create-vpc \
    --cidr-block "$VPC_CIDR" \
    --region "$REGION" \
    --query 'Vpc.VpcId' \
    --output text)

echo ""
echo "VPC created successfully!"
echo "VPC ID: $VPC_ID"

# Add Name tag
aws ec2 create-tags \
    --resources "$VPC_ID" \
    --region "$REGION" \
    --tags Key=Name,Value="$VPC_NAME"

echo ""
echo "VPC Name tag added."

echo ""
echo "========================================"
echo "VPC CREATION COMPLETE"
echo "========================================"