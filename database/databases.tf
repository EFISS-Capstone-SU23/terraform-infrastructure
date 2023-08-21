# efiss-admin
resource "google_sql_database" "admin" {
  provider = google.minhpvt
  name     = "efiss-admin"
  instance = google_sql_database_instance.admin_instance.name
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "admin_instance" {
  provider         = google.minhpvt
  name             = "efiss-admin"
  region           = var.region
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      authorized_networks {
        name  = "allow-all"
        value = "0.0.0.0/0"
      }
    }
  }

  deletion_protection = "true"
}


# efiss-auth
resource "google_sql_database" "auth" {
  provider = google.minhpvt
  name     = "efiss-auth"
  instance = google_sql_database_instance.auth_instance.name
}
resource "google_sql_database_instance" "auth_instance" {
  provider         = google.minhpvt
  name             = "efiss-auth"
  region           = var.region
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      authorized_networks {
        name  = "allow-all"
        value = "0.0.0.0/0"
      }
    }
  }

  deletion_protection = "true"
}

# efiss-normal-user
resource "google_sql_database" "normal_user" {
  provider = google.minhpvt
  name     = "efiss-normal-user"
  instance = google_sql_database_instance.normal_user_instance.name
}

resource "google_sql_database_instance" "normal_user_instance" {
  provider         = google.minhpvt
  name             = "efiss-normal-user"
  region           = var.region
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      authorized_networks {
        name  = "allow-all"
        value = "0.0.0.0/0"
      }
    }
  }

  deletion_protection = "true"
}

# efiss-ads
resource "google_sql_database" "ads" {
  provider = google.minhpvt
  name     = "efiss-ads"
  instance = google_sql_database_instance.ads_instance.name
}

resource "google_sql_database_instance" "ads_instance" {
  provider         = google.minhpvt
  name             = "efiss-ads"
  region           = var.region
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      authorized_networks {
        name  = "allow-all"
        value = "0.0.0.0/0"
      }
    }
  }

  deletion_protection = "true"
}