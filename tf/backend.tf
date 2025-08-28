terraform {
  backend "s3" {
    key = "multicloud-github-actions-tf-state-file"
  }
}