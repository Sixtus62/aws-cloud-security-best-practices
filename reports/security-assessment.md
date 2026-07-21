# AWS Cloud Security Assessment

## Executive Summary

This report presents the results of a security assessment
performed on a small AWS environment.

## Scope

The assessment covered:

- EC2 Security Groups
- IAM
- EC2 Key Pairs
- S3 permissions

## Methodology

The assessment was performed using:

- AWS CLI
- AWS Console
- Bash scripts
- Manual configuration review

## Findings

### SG-001 – Public SSH Access

Risk: High

Description:
SSH was accessible from 0.0.0.0/0.

Recommendation:
Restrict SSH access to trusted IP addresses.

Status:
Remediated.

### S3-001 – Public Access

Risk: High

Recommendation:
Enable S3 Block Public Access.

Status:
Remediated.

## Recommendations

1. Enable MFA.
2. Apply least privilege.
3. Restrict Security Group access.
4. Encrypt S3 data.
5. Protect EC2 key pairs.
6. Enable CloudTrail.
7. Review IAM permissions regularly.

## Conclusion

The assessment identified several security improvements
that can strengthen the AWS environment.
