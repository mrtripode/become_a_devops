#!/bin/bash

DATE=$(date +%F_%H-%M-%S)
FILE_NAME=db-$DATE.sql

DB_HOSTNAME=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
AWS_BUCKET_NAME=$5

# Doing the MySQL backup
mysqldump -u root -h $DB_HOSTNAME -p$DB_PASSWORD $DB_NAME > /tmp/$FILE_NAME 2>/dev/null
# Exporting need it variables
export AWS_ACCESS_KEY_ID=AKIAQYWDOIWG4TQ7TXMU && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
# Uploading the local file to Amazon S3
echo "Uploading your $FILE_NAME backup ..." && \
aws s3 cp /tmp/$FILE_NAME s3://$AWS_BUCKET_NAME/$FILE_NAME
