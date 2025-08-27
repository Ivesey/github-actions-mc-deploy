terraform {
  backend "s3" {
    bucket = "tf-backend-bucket-040125"
    key    = "multicloud-iac-cicd-d03-tf-state-file"
  }
}