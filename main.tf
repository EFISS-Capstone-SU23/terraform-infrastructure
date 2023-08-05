resource "google_compute_project_metadata" "default" {
  provider = google.longnv
  metadata = {
    ssh-keys = file("./ssh-keys.txt")
  }
}

resource "google_compute_project_metadata" "default" {
  provider = google.minhpvt
  metadata = {
    ssh-keys = file("./ssh-keys.txt")
  }
}