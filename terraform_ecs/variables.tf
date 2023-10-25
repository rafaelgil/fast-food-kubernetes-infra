variable "region" {
  description = "Region that the instances will be created"
}

/*====
environment specific variables
======*/

variable "production_database_name" {
  description = "The database name for Production"
  default     = "food"
}

variable "production_database_username" {
  description = "The username for the Production database"
  default     = "postgres"
}

variable "production_database_password" {
  description = "The user password for the Production database"
  default     = "Postgres2023"
}