variable "region" {
  type    = string
  default = "asia-southeast1"
}

variable "zone" {
  type    = string
  default = "asia-southeast1-b"
}

variable "github_runner_token" {
  type    = string
}

variable "worker_join_token" {
    type    = string
}

variable "worker_join_hash_discover" {
    type    = string
}