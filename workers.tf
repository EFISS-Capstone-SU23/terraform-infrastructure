resource "google_compute_instance" "worker_longnv" {
  name     = "worker-longnv-${count.index}"
  count    = 1
  provider = google.longnv

  machine_type = "e2-small"

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
    type        = "worker"
  }

  metadata = {
    ssh-keys       = file("./ssh-keys.txt")
    startup-script = "curl -s https://raw.githubusercontent.com/EFISS-Capstone-SU23/k8s-manifest/main/scripts/gcp-scripts/gce-worker-setup.sh | bash -s ${var.worker_join_token} ${var.worker_join_hash_discover}"
  }

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = "projects/efiss-394203/regions/${var.region2}/subnetworks/default"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
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

resource "google_compute_instance" "worker_minhpvt" {
  name     = "worker-minhpvt-${count.index}"
  count    = 0
  provider = google.minhpvt

  machine_type = "e2-small"

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
    type        = "worker"
  }

  metadata = {
    ssh-keys       = file("./ssh-keys.txt")
    startup-script = "curl -s https://raw.githubusercontent.com/EFISS-Capstone-SU23/k8s-manifest/main/scripts/gcp-scripts/gce-worker-setup.sh | bash -s ${var.github_runner_token}"
  }

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = "projects/efiss-train/regions/${var.region}/subnetworks/default"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
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
  zone = var.zone
}