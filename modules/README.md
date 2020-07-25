
# The `modules` Directory
This directory contains Terraform modules encapsulating entire blocks of infrastructure required for a software product to function. The modules implemented here are used in the `live` directory in order to provision and configure infrastructure in each AWS account.

## The `artifact-storage` Module
This module provisions an S3 bucket for storing software artifacts for deployment. It is provisioned only in the staging environment and acts as a single source of truth for all artifacts that require some form of storage.

## The `ci_cd_example` Module
This module provisions a single Lambda Function which is used for implementing example CI/CD code for a Medium article with the title [**CI/CD Pipeline for AWS with Travis**](https://medium.com/@stefan.georgescu.970/ci-cd-pipeline-for-aws-with-travis-19c9448be17d).

## The `home_watcher` Module
This module provisions some DynamoDB tables that I use for a personal project (called Home Watcher). Together with those, I also provision an API Gateway and a Lambda Function acting as a proxy, plus a second Lambda Function for authorisation.
As part of this project, I have developed a Python package for retrieving and uploading network statistics to DynamoDB (you can check it out on [PyPI](https://pypi.org/project/network-statistics-service/)) and an [Angular Application](https://gitlab.com/stefan.georgescu/home-watcher) that I deploy on a Raspberry Pi 3.
