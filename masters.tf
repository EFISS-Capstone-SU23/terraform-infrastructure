resource "google_compute_instance" "master_minhpvt" {
  name     = "master-minhpvt-${count.index}"
  count    = 0
  provider = google.minhpvt

  #   machine_type = "e2-small"
  machine_type = "e2-custom-6-24576"

  boot_disk {
    auto_delete = true
    device_name = "efiss"

    initialize_params {
      image = "projects/debian-cloud/global/images/debian-11-bullseye-v20230711"
      size  = 150
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
    type        = "master"
  }

  metadata = {
    ssh-keys       = file("./ssh-keys.txt")
    startup-script = "curl -s https://raw.githubusercontent.com/EFISS-Capstone-SU23/k8s-manifest/main/scripts/gcp-scripts/gce-master-setup.sh | bash"
  }

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = "projects/impactful-bee-400715/regions/asia-southeast1/subnetworks/default"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "616762020640-compute@developer.gserviceaccount.com"
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

output "master_minhpvt_public_ip_address" {
  value = google_compute_instance.master_minhpvt.*.network_interface.0.access_config.0.nat_ip
}