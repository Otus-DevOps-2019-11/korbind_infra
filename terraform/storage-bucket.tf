provider "google" {
  version = "~> 2.15"
  project = var.project
  region  = var.region
  zone = var.zone
}

module "storage-bucket" {
  source  = "SweetOps/storage-bucket/google"
  version = "0.3.0"

  # Имя поменяйте на другое
  name = "storage-bucket-vm"
  location = var.location
  force_destroy = "true"
}

output storage-bucket_url {
  value = module.storage-bucket.url
}
