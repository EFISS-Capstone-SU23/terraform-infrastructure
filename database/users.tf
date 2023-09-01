resource "google_sql_user" "admin_user" {
  provider = google.minhpvt
  name     = "root"
  instance = google_sql_database_instance.admin_instance[0].name
  host     = "%"
  password = var.db_sql_password
}

resource "google_sql_user" "auth_user" {
  provider = google.minhpvt
  name     = "root"
  instance = google_sql_database_instance.auth_instance[0].name
  host     = "%"
  password = var.db_sql_password
}

resource "google_sql_user" "ads_user" {
  provider = google.minhpvt
  name     = "root"
  instance = google_sql_database_instance.ads_instance[0].name
  host     = "%"
  password = var.db_sql_password
}

resource "google_sql_user" "normal_user" {
  provider = google.minhpvt
  name     = "root"
  instance = google_sql_database_instance.normal_user_instance[0].name
  host     = "%"
  password = var.db_sql_password
}