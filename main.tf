terraform{
    backend "gcs"{
        bucket = "gcp-951c0919-tf-state"
        prefix = "terraform/state"
    }
}

resource "google_compute_network" "vpc_network" {
  name = "vpc-network"
}