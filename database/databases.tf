resource "google_sql_database" "mysql" {
  provider = google.minhpvt
  name     = "efiss-mysql"
  instance = google_sql_database_instance.mysql_instance[0].name
  count    = length(google_sql_database_instance.mysql_instance)
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "mysql_instance" {
  provider         = google.minhpvt
  name             = "efiss-mysql"
  region           = var.region
  database_version = "MYSQL_8_0"
  count            = 1
  settings {
    tier = "db-f1-micro"
    location_preference {
      zone = var.zone
    }
    ip_configuration {
      authorized_networks {
        name  = "allow-all"
        value = "0.0.0.0/0"
      }
    }
  }

  deletion_protection = "false"
}

output "ip_address" {
  value = google_sql_database_instance.mysql_instance[0].ip_address
}
