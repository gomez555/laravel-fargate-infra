resource "aws_vpc_endpoint" "ecr_api" {
  count = var.enable_fargate_endpoint ? 1 : 0

  service_name      = "com.amazonaws.${data.aws_region.current.name}.ecr.api"
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.this.id
  subnet_ids        = [for s in aws_subnet.private : s.id]

  security_group_ids = [
    aws_security_group.web.id,
  ]

  private_dns_enabled = true

  tags = {
    Name = "${aws_vpc.this.tags.Name}-ecr-api"
  }
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  count = var.enable_fargate_endpoint ? 1 : 0

  service_name      = "com.amazonaws.${data.aws_region.current.name}.ecr.dkr"
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.this.id
  subnet_ids        = [for s in aws_subnet.private : s.id]

  security_group_ids = [
    aws_security_group.web.id,
  ]

  private_dns_enabled = true

  tags = {
    Name = "${aws_vpc.this.tags.Name}-ecr-dkr"
  }
}

resource "aws_vpc_endpoint" "logs" {
  count = var.enable_fargate_endpoint ? 1 : 0

  service_name      = "com.amazonaws.${data.aws_region.current.name}.logs"
  vpc_endpoint_type = "Interface"

  vpc_id            = aws_vpc.this.id

  subnet_ids        = [for s in aws_subnet.private : s.id]

  security_group_ids = [
    aws_security_group.web.id,
  ]
  private_dns_enabled = true

  tags = {
    Name = "${aws_vpc.this.tags.Name}-logs"
  }
}

resource "aws_vpc_endpoint" "ssm" {
  count = var.enable_fargate_endpoint ? 1 : 0

  service_name      = "com.amazonaws.${data.aws_region.current.name}.ssm"
  vpc_endpoint_type = "Interface"

  vpc_id            = aws_vpc.this.id

  subnet_ids        = [for s in aws_subnet.private : s.id]

  security_group_ids = [
    aws_security_group.web.id,
  ]
  private_dns_enabled = true

  tags = {
    Name = "${aws_vpc.this.tags.Name}-ssm"
  }
}

resource "aws_vpc_endpoint" "s3" {

  service_name      = "com.amazonaws.${data.aws_region.current.name}.s3"
  vpc_endpoint_type = "Gateway"
  vpc_id            = aws_vpc.this.id
  route_table_ids = [
    for s in aws_route_table.private : s.id
  ]

  tags = {
    Name = "${aws_vpc.this.tags.Name}-s3"
  }
}
