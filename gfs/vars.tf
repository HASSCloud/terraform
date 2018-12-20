variable "public_ssh_key" {
  type        = "string"
  description = "public ssh key for ssh access to created instances"
}

variable "availability_zone" {
  type        = "string"
  description = "availability zone to create resources in"
}

variable "num_instances" {
  type        = "string"
  description = "number of instances to create"
}

variable "volume_size" {
  type        = "string"
  description = "size of block volumes to use"
}
