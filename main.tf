resource "google_compute_project_metadata" "default_duonglt" {
  provider = google.duonglt
  metadata = {
    ssh-keys = file("./ssh-keys.txt")
  }
}

resource "google_compute_project_metadata" "default_minhpvt" {
  provider = google.minhpvt
  metadata = {
    ssh-keys = file("./ssh-keys.txt")
  }
}