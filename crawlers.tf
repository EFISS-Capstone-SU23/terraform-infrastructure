resource "google_compute_instance" "spot_crawler_longnv" {
  name     = "spot-crawler-longnv-${count.index}"
  count    = 0
  provider = google.longnv

  machine_type = "e2-custom-8-16384" # 4 CPU cores = 8 vCPUs, 16GB RAM

  boot_disk {
    auto_delete = true
    device_name = "efiss"

    initialize_params {
      image = "projects/debian-cloud/global/images/debian-11-bullseye-v20230711"
      size  = 80
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
    type        = "crawler"
  }

  metadata = {
    ssh-keys = file("./ssh-keys.txt")
    # startup-script = "curl -s https://raw.githubusercontent.com/EFISS-Capstone-SU23/k8s-manifest/main/scripts/gcp-scripts/gce-crawler-setup.sh | bash -s ${var.crawler_join_token} ${var.crawler_join_hash_discover}"
  }

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = "projects/efiss-394203/regions/${var.region2}/subnetworks/default"
  }

  scheduling {
    automatic_restart   = false
    on_host_maintenance = "TERMINATE"
    preemptible         = true
    provisioning_model  = "SPOT"
  }

  service_account {
    email  = "137666907574-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  tags = ["http-server", "https-server"]
  zone = var.region2_zone
}

resource "google_compute_instance" "spot_crawler_minhpvt" {
  name     = "spot-crawler-minhpvt-${count.index}"
  count    = 0
  provider = google.minhpvt

  machine_type = "e2-custom-8-16384" # 4 CPU cores = 8 vCPUs, 16GB RAM

  boot_disk {
    auto_delete = true
    device_name = "efiss"

    initialize_params {
      image = "projects/debian-cloud/global/images/debian-11-bullseye-v20230711"
      size  = 80
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
    type        = "crawler"
  }

  metadata = {
    ssh-keys = file("./ssh-keys.txt")
    # startup-script = "curl -s https://raw.githubusercontent.com/EFISS-Capstone-SU23/k8s-manifest/main/scripts/gcp-scripts/gce-crawler-setup.sh | bash -s ${var.github_runner_token}"
  }

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = "projects/efiss-train/regions/${var.region2}/subnetworks/default"
  }

  scheduling {
    automatic_restart   = false
    on_host_maintenance = "TERMINATE"
    preemptible         = true
    provisioning_model  = "SPOT"
  }

  service_account {
    email  = "910878745565-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  tags = ["http-server", "https-server"]
  zone = var.region2_zone
}