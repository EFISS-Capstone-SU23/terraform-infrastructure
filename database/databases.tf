# efiss-admin
resource "google_sql_database" "admin" {
  provider = google.minhpvt
  name     = "efiss-admin"
  instance = google_sql_database_instance.admin_instance[0].name
  count    = length(google_sql_database_instance.admin_instance)
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "admin_instance" {
  provider         = google.minhpvt
  name             = "efiss-admin"
  region           = var.region
  database_version = "MYSQL_8_0"
  count            = 0
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


# efiss-auth
resource "google_sql_database" "auth" {
  provider = google.minhpvt
  name     = "efiss-auth"
  instance = google_sql_database_instance.auth_instance[0].name
  count    = length(google_sql_database_instance.auth_instance)
}
resource "google_sql_database_instance" "auth_instance" {
  provider         = google.minhpvt
  name             = "efiss-auth"
  region           = var.region
  database_version = "MYSQL_8_0"
  count            = 0
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

# efiss-normal-user
resource "google_sql_database" "normal_user" {
  provider = google.minhpvt
  name     = "efiss-normal-user"
  instance = google_sql_database_instance.normal_user_instance[0].name
  count    = length(google_sql_database_instance.normal_user_instance)
}

resource "google_sql_database_instance" "normal_user_instance" {
  provider         = google.minhpvt
  name             = "efiss-normal-user"
  region           = var.region
  database_version = "MYSQL_8_0"
  count            = 0
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

# efiss-ads
resource "google_sql_database" "ads" {
  provider = google.minhpvt
  name     = "efiss-ads"
  instance = google_sql_database_instance.ads_instance[0].name
  count    = length(google_sql_database_instance.ads_instance)
}

resource "google_sql_database_instance" "ads_instance" {
  provider         = google.minhpvt
  name             = "efiss-ads"
  region           = var.region
  database_version = "MYSQL_8_0"
  count            = 0
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