variable "credentials" {
  description = "My Credentials"
  default     = "./keys/temp-keys.json"
}


variable "project" {
  description = "GCP Project"
  default     = "projeto-estudos-356715"
}

variable "region" {
  description = "Region"
  default     = "us-central1"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "homework01_bqdataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "homework01_gcpbucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}