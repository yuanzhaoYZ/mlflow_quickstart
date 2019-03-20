# MLflow Quick Start: Training and Logging

This is a Quick Start demo based on [Databrick's MLflow tutorial](https://docs.databricks.com/_static/notebooks/mlflow/mlflow-quick-start-training.html). In this tutorial, we’ll:

* Install the MLflow server on a EC2 instance
* Create an jupyter kernel for MLflow using anaconda
* Create a notebook with that kenel to train a diabetes progression model and log metrics, parameters, models, and a .png plot from the training to the MLflow tracking server
* View the training results in the MLflow experiment UI

## 1. Install MLflow on EC2

### 1.1 Create a security group

You should craete a security group and open port 5000 for your IP. 

![security group](./docs/sg.png)

### 1.2 Create an EC2 instance

![ec2](./docs/ec2.png)

### 1.3 Install MLflow
SSH into the ec2 instance and run the following commands

```
# install mlflow
pip install mlflow

# create mlflow file store folder
mkdir mlflow_file_store

# create a screen
screen -dmS mlflow
screen -r mlflow

# start mlflow tracking server
mlflow server \
--file-store /home/ec2-user/mlflow_file_store \
--default-artifact-root s3://YOUR_S3_BUCKET/workspace/mlflow_disk/artifact-root/ \
--host 0.0.0.0

```

Note:
1. I run the mlflow tracking server in a screen called `mlflow` so that the server will keep running even after I close the ssh session. This is just for demo purpose and is not recommened if you are planning to run the mlflow tracking server in production.

2. I use a s3 bucket for the `--default-artifact-root` in this example, but you can use local folder as well. You can read more about MLflow storage [here](https://www.mlflow.org/docs/latest/tracking.html#storage)


## 2. Create a mlflow virtuanl environment

Now let's go ahead and create a conda environment for mlflow. (You can download Anaconda from [here](https://www.anaconda.com/distribution/))

```
conda create -n mlflow_test python=3.6 ipykernel
source activate mlflow_test
pip install mlflow
pip install scikit-learn
pip install matplotlib
```

## 3. Training and Logging

Once the env has been created, you should be able to see the new kernel in your jupyter
![kernel](./docs/kernel.png)

Next step, import the [mlflow_test.ipynb](mlflow_test.ipynb) to your jupyter and change the mlflow tracking server url in the notebook.

![server_url](./docs/server_url.png)


You're all set to run all the cells in the notebook at this stage and you should be able to review the experiment in the mlflow tracking server(`http://EC2-PUBLIC-DNS:5000/`) by openning the experiment `/Shared/experiments/DiabetesModel` in the workspace.

![mlflow](./docs/mlflow.png)



