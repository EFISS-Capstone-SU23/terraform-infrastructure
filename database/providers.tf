terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
  backend "gcs" {
    bucket = "efiss-infra"
    prefix = "terraform/db-state"
  }
}

provider "google" {
  credentials = file("efiss-terraform-service-account_Minhpvt.json")
  project     = "efiss-train"
  region      = var.region
  zone        = var.zone
  alias       = "minhpvt"
}
