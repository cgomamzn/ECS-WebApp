variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default     = "10.1.0.0/16"
}
variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  default     = "10.1.0.0/24"
} /* SET AVAIABILITY ZONE AS NEEDED */
variable "availability_zone" {
  description = "availability zone to create subnet"
  default     = "us-east-1b"
} /* SSH PUBLIC KEY */
variable "public_key_path" {
  default = "~/.ssh/terraform.pub"
}
variable "environment_tag" {
  description = "Environment tag"
  default     = "STG"
}