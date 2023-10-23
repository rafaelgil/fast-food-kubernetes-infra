variable "environment" {
  description = "The environment"
}

variable "vpc_id" {
  description = "The VPC id"
}

variable "availability_zones" {
  type        = "list"
  description = "The azs to use"
}

variable "security_groups_ids" {
  type        = "list"
  description = "The SGs to use"
}

variable "subnets_ids" {
  type        = "list"
  description = "The private subnets to use"
}

variable "public_subnet_ids" {
  type        = "list"
  description = "The private subnets to use"
}

variable "repository_name" {
  description = "repository name"
  default = "fast-food"
}

variable "database_endpoint" {
  description = "The database endpoint"
}

variable "database_username" {
  description = "The database username"
  default = "postgres"
}

variable "database_password" {
  description = "The database password"
  default = "Postgres2023"
}

variable "database_name" {
  description = "The database that the app will use"
  default = "food"
}