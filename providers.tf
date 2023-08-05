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
  region  = "asia-southeast1"
  zone    = "asia-southeast1-b"
  alias   = "longnv"
}

provider "google" {
  credentials = file("efiss-terraform-service-account_Minhpvt.json")
  project     = "efiss-train"
  region  = "asia-southeast1"
  zone    = "asia-southeast1-b"
  alias   = "minhpvt"
}
