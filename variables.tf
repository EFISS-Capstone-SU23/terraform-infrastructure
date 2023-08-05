variable "region" {
  type    = string
  default = "asia-southeast1"
}

variable "zone" {
  type    = string
  default = "asia-southeast1-b"
}

variable "region2" {
  type = string
  default = "us-central1"
}

variable "region2_zone" {
    type = string
    default = "us-central1-c"
}
variable "github_runner_token" {
  type = string
}

variable "worker_join_token" {
  type = string
}

variable "worker_join_hash_discover" {
  type = string
}