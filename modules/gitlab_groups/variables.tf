variable "build_number" {
  type        = string
}

variable "env_type" {
  type        = string
  default     = "dev"
}

variable "group_names" {
  type        = list
}