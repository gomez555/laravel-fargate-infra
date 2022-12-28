terraform {
  backend "s3" {
    bucket = "sample-tfstate-aura"
    key    = "laravel-fargate-app/prod/log/app_foobar_v1.0.0.tfstate"
    region = "us-west-2"
  }
}