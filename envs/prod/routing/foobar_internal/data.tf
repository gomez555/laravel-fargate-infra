data "terraform_remote_state" "network_main" {
  backend = "s3"

  config = {
    bucket = "sample-tfstate-aura"
    key    = "${local.system_name}-app/${local.env_name}/network/main_v1.0.0.tfstate"
    region = "us-west-2"
  }
}

data "terraform_remote_state" "db_foobar" {
  backend = "s3"

  config = {
    bucket = "sample-tfstate-aura"
    key    = "${local.system_name}-app/${local.env_name}/db/foobar_v1.0.0.tfstate"
    region = "us-west-2"
  }
}