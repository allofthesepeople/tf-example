data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "all" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "${var.environment}-ec2-sg"
  description = "Security group for ${var.environment} EC2 instances"
  vpc_id      = data.aws_vpc.default.id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}

resource "aws_instance" "this" {
  count = var.instance_count

  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = element(data.aws_subnets.all.ids, count.index % length(data.aws_subnets.all.ids))
  vpc_security_group_ids      = [module.security_group.security_group_id]
  associate_public_ip_address = true

  tags = {
    Name        = "${var.environment}-ec2-${count.index}"
    Environment = var.environment
  }
}
