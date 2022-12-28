terraform {
  backend "s3" {
    bucket = "sample-tfstate-aura"
    key    = "laravel-fargate-app/prod/routeing/foobar_internal_v1.0.0.tfstate"
    region = "us-west-2"
  }
}