terraform {
  backend "s3" {
    bucket = "sample-tfstate-aura"
    key    = "laravel-fargate-app/prod/db/foobar_v1.0.0.tfstate"
    region = "us-west-2"
  }
}