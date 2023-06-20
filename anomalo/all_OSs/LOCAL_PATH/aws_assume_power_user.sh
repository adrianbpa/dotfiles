#!/bin/bash

set -euo pipefail

ACCOUNT="$(aws sts get-caller-identity | jq .Account -r)"
CREDS=$(aws sts get-session-token --serial-number arn:aws:iam::${ACCOUNT}:mfa/adrian --token-code ${1});\
  export AWS_ACCESS_KEY_ID=$(echo ${CREDS} | jq -r '.Credentials''.AccessKeyId');\
  export AWS_SECRET_ACCESS_KEY=$(echo ${CREDS} | jq -r '.Credentials''.SecretAccessKey');\
  export AWS_SESSION_TOKEN=$(echo ${CREDS} | jq -r '.Credentials''.SessionToken');

CREDS=$(aws sts assume-role --role-arn arn:aws:iam::${ACCOUNT}:role/PowerUserAccess --role-session-name adrian_as_poweruser);\
  export AWS_ACCESS_KEY_ID=$(echo ${CREDS} | jq -r '.Credentials''.AccessKeyId');\
  export AWS_SECRET_ACCESS_KEY=$(echo ${CREDS} | jq -r '.Credentials''.SecretAccessKey');\
  export AWS_SESSION_TOKEN=$(echo ${CREDS} | jq -r '.Credentials''.SessionToken');

aws sts get-caller-identity
