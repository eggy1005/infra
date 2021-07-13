terraform{
    backend "gcs" {
        bucket = "g-951c0919-tf-state"
        prefix = "terraform/state"
    }
}


resource "google_compute_instance" "default" {
  name         = "jessy-virtual-machine-from-terraform"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

    metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "jessy-service-acount@g-951c0919.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}

locals{
    destroy = true
}