#!/bin/bash

echo "========================================"
echo "S3 SECURITY AUDIT"
echo "========================================"

BUCKETS=$(aws s3api list-buckets \
    --query 'Buckets[].Name' \
    --output text)

for BUCKET in $BUCKETS
do

    echo ""
    echo "Bucket: $BUCKET"
    echo "----------------------------------------"

    echo "Public Access Block:"
    aws s3api get-public-access-block \
        --bucket "$BUCKET" 2>/dev/null || echo "Not configured"

    echo ""
    echo "Encryption:"
    aws s3api get-bucket-encryption \
        --bucket "$BUCKET" 2>/dev/null || echo "Encryption not configured"

    echo ""
    echo "Versioning:"
    aws s3api get-bucket-versioning \
        --bucket "$BUCKET"

    echo ""
    echo "Bucket Policy:"
    aws s3api get-bucket-policy \
        --bucket "$BUCKET" 2>/dev/null || echo "No bucket policy"

done

echo ""
echo "S3 SECURITY AUDIT COMPLETE"
