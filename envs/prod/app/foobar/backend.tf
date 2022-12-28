terraform {
  backend "s3" {
    bucket = "sample-tfstate-aura"
    key    = "laravel-fargate-app/prod/app/app_foobar=v1.0.0.tfstate"
    region = "us-west-2"
  }
}