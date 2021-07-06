terraform{
    backend "gcs" {
        bucket = "g-951c0919-tf-state"
        prefix = "terraform/state"
    }
}
resource "google_compute_network" "vpc_network" {
  name = "jessy-vpc-network"
}

locals{
    destroy = false
}