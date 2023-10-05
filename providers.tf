terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
  backend "gcs" {
    bucket = "efiss-terraform"
    prefix = "terraform/state"
  }
}

provider "google" {
  credentials = file("efiss-terraform-service-account_minhpvt.json")
  project     = "impactful-bee-400715"
  region      = var.region
  zone        = var.zone
  alias       = "minhpvt"
}
