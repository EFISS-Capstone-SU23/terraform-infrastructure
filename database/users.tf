resource "google_sql_user" "admin_user" {
  name     = "admin_user"
  instance = google_sql_database_instance.admin_instance.name
  host     = "admin.db.efiss.tech"
  password = var.db_sql_password
}

resource "google_sql_user" "auth_user" {
  name     = "auth_user"
  instance = google_sql_database_instance.auth_instance.name
  host     = "auth.db.efiss.tech"
  password = var.db_sql_password
}

resource "google_sql_user" "ads_user" {
  name     = "ads_user"
  instance = google_sql_database_instance.ads_instance.name
  host     = "ads.db.efiss.tech"
  password = var.db_sql_password
}

resource "google_sql_user" "normal_user" {
  name     = "normal_user"
  instance = google_sql_database_instance.normal_user_instance.name
  host     = "normal-db.efiss.tech"
  password = var.db_sql_password
}