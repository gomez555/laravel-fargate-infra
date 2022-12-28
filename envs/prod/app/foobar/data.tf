data "aws_caller_identity" "self" {}

data "aws_region" "current"  {}

data "terraform_remote_state" "network_main" {
  backend = "s3"

  config = {
    bucket = "sample-tfstate-aura"
    key = "${local.system_name}-app/${local.env_name}/network/main_v1.0.0.tfstate"
    region = "us-west-2"
  }
}

data "terraform_remote_state" "routing_mosao-chp_link" {
  backend = "s3"

  config = {
    bucket = "sample-tfstate-aura"
    key = "${local.system_name}-app/${local.env_name}/routeing/mosao-chp_v1.0.0.tfstate"
    region = "us-west-2"
  }
}