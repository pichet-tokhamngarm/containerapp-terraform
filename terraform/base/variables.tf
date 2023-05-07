variable "app_name" {
  type        = string
  description = "name of the app"
  default     = "datax-devops-01"
}

variable "location" {
  type        = string
  description = "Location of Resources"
  default     = "southeastasia"
}

variable "environment" {
  type        = string
  description = "Environment"
  default     = "production"
}

