# LTI-Assignment
Need to create below resouces in AWS using terraform
1. VPC
2. EC2
3. S3 bucket 
4. S3 bucket should be accessible from EC2 instance 

# Following versions used:
- Terraform = v1.2.4
- AWS provider = 4.22.0
- terraform-aws-modules/vpc/aws = 3.14.2
- terraform-aws-modules/security-group/aws = 4.9.0
- terraform-aws-modules/ec2-instance/aws  = 4.0.0

# Standarization with terraform file
I have just created all file with filename c<number>-<resource-number> like c1-01, c1-02. this way we can easily track flow of terraform resource files and understand how it is process to deploy.