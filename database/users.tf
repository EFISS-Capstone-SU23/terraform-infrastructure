resource "google_sql_user" "mysql_user" {
  provider = google.minhpvt
  name     = "root"
  instance = google_sql_database_instance.mysql_instance[0].name
  count    = length(google_sql_database_instance.mysql_instance)
  host     = "%"
  password = var.db_sql_password
}
