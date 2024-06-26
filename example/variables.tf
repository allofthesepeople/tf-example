variable "extra" {
    type = string
    default = "I am from the git"
}

variable "extra1" {
    type = string
    default = "I am from the git"
}

variable "instance_type" {
    type = string
}

variable "bucket_name" {
  description = "Name of the s3 bucket. Must be unique."
  type        = string
}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {}
}

variable "costcentre" {
  description = "tag to identify cost centre ownership for resources"
  type        = string
}

variable "team" {
  description = "tag to identify team ownership for resources"
  type        = string
}
