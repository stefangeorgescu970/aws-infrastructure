variable "bucket_name" {
  description = "The name of the bucket."
  type        = string
}

variable "acl" {
  description = "ACL for bucket"
  type        = string
  default     = "private"
}

variable "versioning_enabled" {
  description = "Enable versioning."
  type        = bool
  default     = false
}

variable "lifecycle_rule_enabled" {
  description = "Whether or not lifecycle rules are enabled."
  type        = bool
  default     = false
}

variable "days_until_expire" {
  description = "Days until object gets deleted from S3."
  type        = number
  default     = 0
}

variable "tags" {
  description = "A map of tags to use on this bucket."
  type        = map(string)
  default     = {}
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
