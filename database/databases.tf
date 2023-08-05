# efiss-admin
resource "google_sql_database" "database" {
  provider = google.longnv
  name     = "efiss-admin"
  instance = google_sql_database_instance.instance.name
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "instance" {
  provider = google.longnv
  name             = "efiss-admin"
  region           = var.region
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "true"
}


# efiss-auth
resource "google_sql_database" "database" {
  provider = google.longnv
  name     = "efiss-auth"
  instance = google_sql_database_instance.instance.name
}
resource "google_sql_database_instance" "instance" {
  provider = google.longnv
  name             = "efiss-auth"
  region           = var.region
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "true"
}

# efiss-normal-user
resource "google_sql_database" "database" {
  provider = google.longnv
  name     = "efiss-normal-user"
  instance = google_sql_database_instance.instance.name
}
resource "google_sql_database_instance" "instance" {
  provider = google.longnv
  name             = "efiss-normal-user"
  region           = var.region
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "true"
}

# efiss-ads
resource "google_sql_database" "database" {
  provider = google.longnv
  name     = "efiss-ads"
  instance = google_sql_database_instance.instance.name
}
resource "google_sql_database_instance" "instance" {
  provider = google.longnv
  name             = "efiss-ads"
  region           = var.region
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "true"
}