#variable "db_password" {
#    description = "The password for the database"
#    type = string
#}

# $ export TF_VAR_db_password="(YOUR_DB_PASSWORD)"
# Note that there is intentionally a space before the 'export' command to prevent the secret from being stored on disk in the Bash history.

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "db_name" {
  description = "The name to use for the database"
  type        = string
  default     = "example_database_stage"
}

# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "db_username" {
  description = "The username for the database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}

# export TF_VAR_db_username=admin
# export TF_VAR_db_password=htccYompttE245v942av
