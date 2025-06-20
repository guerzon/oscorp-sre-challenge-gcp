# SRE Challenge (GCP version)

## Lester's note

This challenge was converted from AWS to GCP prior to attempts to solve it. Conversion was not perfect, so there will be changes to the requirements as I go.

## Challenge

Your task is to provision the infrastructure for a web application (which we will provide) and deploy it on a Google Kubernetes Engine (GKE) cluster. All infrastructure components should be managed using Terraform. Please include comprehensive documentation or a README that outlines the architecture and provides clear, step-by-step instructions so that anyone, even those unfamiliar with the assignment, can reproduce your setup.

Refer to the detailed requirements below and ensure all are addressed. If you find it necessary to deviate from any requirement, please clearly explain your reasoning and document any changes made.

Be mindful to provision resources that are appropriately sized for the task—avoid over-provisioning.

### Duration

You have 10 days from the time you receive your credentials and this document to complete and submit the assignment.

Use this period to focus on delivering well-structured, robust, and reusable code, along with thorough documentation.

If you require additional time, please let us know. Feel free to reach out if you have any questions or need clarification.

### GCP Access

You will receive both console and programmatic access to a dedicated GCP project. All infrastructure should be created in the asia-east1 (Taiwan) region. Credentials will be sent to you via email, and you will be prompted to change your password upon first login. The resources you create will remain available until the review process is complete.

### Assignment

Your objective is to deploy a user management web portal and set up integration with external partners who supply data.

Partners will upload user details as CSV files to a Cloud Storage bucket. You are responsible for implementing a job that validates and imports this data into the application's database.

You will also need to provision the infrastructure required to host the portal.

### What we are providing

You do not need to create every resource from scratch; we are supplying several foundational components for you to use.

- Within the GCP project, you will find:
  - A Cloud DNS zone for a pre-registered domain
  - A Cloud Storage bucket for storing Terraform state files
  - Sample Cloud Function code to use as a template

- In the shared GitHub repository, you will find:
  - A Terraform section with base modules and a suggested folder structure for organizing your code
  - A Python Flask application with a Dockerfile
  - SQL scripts for database setup
  - A sample dataset
  - A template for the Cloud Function used to import data

### Infrastructure Task

- Using Terraform, provision a minimal infrastructure that includes the following components:

    - One VPC network with both private and public subnets spanning at least two zones for hosting the application
    - Cloud Function setup for data import
    - A GKE cluster deployed in the private subnets of the VPC network
    - Full HTTPS configuration to securely expose the application to the internet (only on the HTTPS port and restricted to whitelisted IPs)
        - An HTTP(S) Load Balancer in front of the GKE cluster
        - DNS hostname for the Load Balancer
        - Google-managed SSL certificate
        - Optional: Minimal Cloud Armor policy using Google-managed rules
    - A separate VPC network (or subnet) with private and public subnets across at least two zones for the database
    - A Cloud SQL (MySQL) instance, only accessible from the GKE network
    - A Cloud Storage bucket configured for storing files containing highly sensitive data
    - Consider the sensitive nature of the data when arranging code and storage (utilize Cloud KMS for encryption where possible, and apply restrictive IAM policies and ACLs)
    - A small Compute Engine VM designated as a bastion host, accessible from the internet solely via the SSH port
- All additional resources (IAM roles/policies, firewall rules, etc.) should also be provisioned using Terraform. Manual resource creation should be minimized.
- Ensure the Terraform code is easily extensible, reusable, and highly configurable.
- New instances of any resource type should be creatable by simply adding a module invocation block.
- Terraform state files must be stored in the provided Cloud Storage bucket.

### Deployment

- Deploy the provided application using Helm
- Configure the application to connect to the Cloud SQL database, retrieving credentials from Secret Manager
- Execute the provided SQL statements to set up the database
- Troubleshoot and fix any bugs in the application or SQL code as necessary

### Programming task

After setting up the infrastructure and deploying the application, proceed to establish integration with the third-party data provider

- Develop a script to import data from CSV files in a Cloud Storage bucket into the database
- Configure a Cloud Function to execute the above script on a regular schedule
- Test the setup using the provided sample CSV file, ensuring that similar test datasets can be uploaded and reflected in the portal promptly.

### Documentation

Along with your code, provide documentation that describes the entire setup process, including detailed steps for creating the GCP infrastructure and deploying the application. This can be in the form of a visual chart, a README file, or both.

Pay close attention to the quality of your documentation, ensuring it is as thorough and clear as the code itself.

Include descriptions of the following:

- The architecture, presented clearly and concisely
- Step-by-step instructions for provisioning the infrastructure (for someone unfamiliar with the challenge)
- Any assumptions made during the setup
- Procedures for cleaning up and removing the infrastructure

### When finished

Once you have completed the challenge, commit your code and documentation to the provided git repository.

Notify the interviewer that you have finished the challenge. A review will be conducted, followed by a scheduled interview to discuss your work on the challenge.

## User Portal

This repository consists of the code for a sample web application for user management and the IaC to host it in GCP. 

### Repo structure

* `app` - Contains application code with the docker file
* `chart` - Contains the helm chart to deploy the application to the kubernetes cluster
* `datasets` - Contains a sample data set of users to load into the database
* `schema` - Contains the database schema for the application
* `serverless` - Contains the code for a lambda function that imports user data from the S3 bucket
* `terraform` - Contains the IaC for provisioning the GCP infrastructure where the application will be hosted
