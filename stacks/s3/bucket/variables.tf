variable "bucket_name" {
  description = "The name of the bucket."
  type        = string
}

variable "acl" {
  description = "ACL for bucket"
  type        = string
  default     = "private"
}

variable "region" {
  description = "If specified, the AWS region this bucket should reside in."
  type        = string
  default     = null
}

variable "versioning_enabled" {
  description = "Enable versioning."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to use on this bucket."
  type        = map(string)
  default     = {}
}

variable "expire_enabled" {
  description = "Whether Expire rule should be enabled."
  type        = bool
  default     = false
}

variable "expire_duration" {
  description = "Days in which the bucket should expire"
  type        = number
  default     = 45
}

variable "block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket."
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket."
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."
  type        = bool
  default     = true
}
