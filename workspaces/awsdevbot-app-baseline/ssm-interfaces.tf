data "aws_vpc_endpoint_service" "ssm_messages" {
  service = "ssmmessages"
}

data "aws_vpc_endpoint_service" "ec2" {
  service = "ec2"
}

data "aws_vpc_endpoint_service" "ec2_messages" {
  service = "ec2messages"
}

data "aws_vpc_endpoint_service" "ssm" {
  service = "ssm"
}


resource "aws_security_group" "ssm_security_group" {
  name        = "${var.prefix}-ssm_security_group"
  vpc_id      = aws_vpc.production_vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
}


resource "aws_vpc_endpoint" "ssm_messages_vpc_endpoint" {
  vpc_id            = aws_vpc.production_vpc.id
  service_name      = data.aws_vpc_endpoint_service.ssm_messages.service_name
  vpc_endpoint_type = "Interface"

  subnet_ids = tolist(aws_subnet.private_subnet.*.id)

  security_group_ids = [
    aws_security_group.ssm_security_group.id
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ec2_vpc_endpoint" {
  vpc_id            = aws_vpc.production_vpc.id
  service_name      = data.aws_vpc_endpoint_service.ec2.service_name
  vpc_endpoint_type = "Interface"

  subnet_ids = tolist(aws_subnet.private_subnet.*.id)

  security_group_ids = [
    aws_security_group.ssm_security_group.id
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ec2_messages_vpc_endpoint" {
  vpc_id            = aws_vpc.production_vpc.id
  service_name      = data.aws_vpc_endpoint_service.ec2_messages.service_name
  vpc_endpoint_type = "Interface"

  subnet_ids = tolist(aws_subnet.private_subnet.*.id)

  security_group_ids = [
    aws_security_group.ssm_security_group.id
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssm_vpc_endpoint" {
  vpc_id            = aws_vpc.production_vpc.id
  service_name      = data.aws_vpc_endpoint_service.ssm.service_name
  vpc_endpoint_type = "Interface"

  subnet_ids = tolist(aws_subnet.private_subnet.*.id)

  security_group_ids = [
    aws_security_group.ssm_security_group.id
  ]

  private_dns_enabled = true
}
