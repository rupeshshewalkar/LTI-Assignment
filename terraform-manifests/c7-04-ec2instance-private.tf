# AWS EC2 Instance Terraform Module
# EC2 Instances that will be created in VPC Private Subnets

module "ec2_private" {
  depends_on = [module.vpc] # VERY VERY IMPORTANT else userdata webserver provisioning will fail
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "4.0.0"
  # insert the 10 required variables here
  name          = "${var.environment}-vm"
  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type

  #monitoring             = true
  vpc_security_group_ids = [module.private_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  user_data              = file("${path.module}/app1-install.sh")
  tags                   = local.common_tags

  # Instance profile name
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

}