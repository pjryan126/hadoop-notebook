# Hadoop-Notebook
A multi-container Docker application for running Hadoop commands inside a Jupyter notebook.

## Description
This application links a jupyter/datascience-notebook container to a cloudera/quickstart container
to allow the user to run Hadoop jobs from a Jupyter notebook. This application was originally constructed
for use in UC Berkeley's MIDS Machine Learning at Scale course (w261).

## Instructions
### Navigate to application directory.
```
$ cd /path/to/hadoop-notebook
```
### STEP 1. Set your WORK directory in the docker-compose.yml file.

### STEP 2. Build the modified Jupyter/datascience-notebook image.
```
$ docker-compose build
```
### STEP 3. Start application as a daemon.
```
$ docker-compose up -d
```
### STEP 4. Add quickstart.cloudera to /etc/hosts file on host machine

- Get the cloudera.quickstart IP Address
```
$ docker inspect hadoopnotebook_quickstart.cloudera_1 # this is the name of the cloudera container
```
- Add the following line to your /etc/hosts file (substituting the quickstart.cloudera IP address from above).
```
# /etc/hosts

...
<CLOUDERA.QUICKSTART IP ADDRESS>    cloudera.quickstart

```
### STEP 5. In your browser, visit localhost:8889 and you should be all set.