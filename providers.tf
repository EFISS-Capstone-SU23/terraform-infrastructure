terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("efiss-terraform-service-account_Longnv.json")
  project     = "efiss-394203"
  region  = var.region
  zone    = var.zone
  alias   = "longnv"
}

provider "google" {
  credentials = file("efiss-terraform-service-account_Minhpvt.json")
  project     = "efiss-train"
  region  = var.region
  zone    = var.zone
  alias   = "minhpvt"
}
