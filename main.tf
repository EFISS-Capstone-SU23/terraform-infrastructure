resource "google_compute_project_metadata" "default_minhpvt" {
  provider = google.minhpvt
  metadata = {
    ssh-keys = file("./ssh-keys.txt")
  }
}
