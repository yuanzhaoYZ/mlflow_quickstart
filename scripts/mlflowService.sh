#!/bin/sh
if [ $1 = 'start' ]
then
    mlflow server --file-store /home/ec2-user/mlflow_file_store --default-artifact-root s3://YOUR_BUCKET_HERE/workspace/mlflow_disk/artifact-root/ --host 0.0.0.0
fi  
