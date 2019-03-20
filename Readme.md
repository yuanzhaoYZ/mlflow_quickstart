# MLflow Quick Start: Training and Logging

This is a Quick Start demo based on [Databrick's MLflow tutorial](https://docs.databricks.com/_static/notebooks/mlflow/mlflow-quick-start-training.html). In this tutorial, we’ll:

* Install the MLflow server on a EC2 instance
* Create an jupyter kernel for MLflow using anaconda
* Create a notebook with that kenel to train a diabetes progression model and log metrics, parameters, models, and a .png plot from the training to the MLflow tracking server
* View the training results in the MLflow experiment UI

## 1. Install MLflow on EC2

### 1.1 
```
pip install mlflow
mkdir mlflow_file_store
screen -dmS mlflow
screen -r mlflow

mlflow server \
--file-store /home/ec2-user/mlflow_file_store \
--default-artifact-root s3://engineering.insightzen.com/workspace/mlflow_disk/artifact-root/ \
--host 0.0.0.0
```

## 2. Create a notebook with mlflow kernel

## 3. Train
