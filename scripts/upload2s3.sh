#!/bin/bash
# backup mlflow file and upload to s3

MLFILE_DIR='/home/ec2-user/mlflow_file_store/'
S3_DIR='s3://YOUR_BUCKET_HERE/workspace/mlflow_disk/file-store/'
LOG='/home/ec2-user/bakup/upload.log'
set -x
daytime=$(date "+%Y%m%d")
bakfile=/home/ec2-user/bakup/"mlflow"$daytime".tar"
tar -czvf $bakfile  $MLFILE_DIR
echo $(date +%Y-%m-%d,%H:%m:%s) >> $LOG
echo 'create bakfile '$bakfile >> $LOG
aws s3 cp $bakfile $S3_DIR
echo 'upload s3 succeed' >> $LOG
set +x
