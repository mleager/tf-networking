variable "env" {
  type        = string
  default     = "development"
  description = "Environment name (e.g., development, staging, production)"
}

variable "public_availability_zones" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
  description = "List of public availability zones"
}

variable "private_availability_zones" {
  type        = list(string)
  default     = ["us-east-1c", "us-east-1d"]
  description = "List of private availability zones"
}

variable "public_cidr" {
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
  description = "List of public CIDR blocks"
}

variable "private_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
  description = "List of private CIDR blocks"
}

