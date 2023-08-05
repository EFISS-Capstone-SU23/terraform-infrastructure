resource "google_compute_project_metadata" "default" {
  metadata = {
    ssh-keys = file("ssh-keys.txt")
  }
}