module "security_group_days_since" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "3.18.0"
  name        = "sg_${local.instance_name}"
  description = "Security group for the Days Since EC2 instance."
  vpc_id      = var.vpc_id
  ingress_with_cidr_blocks = [{
    rule        = "ssh-tcp"
    cidr_blocks = var.ssh_ip
  },{
    rule        = "http-80-tcp"
    cidr_blocks = "0.0.0.0/0"
  },{
    rule        = "https-443-tcp"
    cidr_blocks = "0.0.0.0/0"
  }]
  egress_rules = ["all-all"]
  
  tags = local.tags
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}

resource "aws_instance" "server" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  key_name               = var.instance_key_pair_name
  vpc_security_group_ids = [module.security_group_days_since.this_security_group_id]

  disable_api_termination = true

  tags = merge({
    Name = local.instance_name
  }, local.tags)

  lifecycle {
    ignore_changes = [ami]
  }
}
