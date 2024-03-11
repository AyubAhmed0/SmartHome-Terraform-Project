# Terraform Smart Home Microservice Infrastructure

## Overview

This Terraform project provisions a comprehensive network infrastructure within AWS, tailored for a smart home microservice. It utilises Terraform modules to configure AWS services and adheres to security best practices, establishing a robust and fault-tolerant architecture.

## Prerequisites

Ensure you have the following:

- An AWS account with the CLI configured.
- Terraform installed on your system.

## Key Components

### Virtual Private Cloud (VPC)

- Implements a fault-tolerant design with public and private subnets across multiple availability zones.
- Provides internet access through proper routing configurations, including a NAT Gateway for outbound access from private subnets.

### Security

- Configures security groups for HTTP, HTTPS, and SSH access.

### IAM Credentials

- Involves the manual creation of an IAM user with full access to DynamoDB for AWS service interactions, done through the AWS Management Console.

### DynamoDB

- Utilises modules to create DynamoDB tables with PAY_PER_REQUEST billing for enhanced cost efficiency.

### EC2 Servers

- Provisions EC2 instances using  custom Amazon Machine Images (AMIs) for lighting, heating, status, and authentication services. Instances are placed within both public and private subnets as appropriate

### Load Balancers and Autoscaling

- Implements public and internal load balancers, target groups, and autoscaling policies to ensure services are highly available and scalable.



