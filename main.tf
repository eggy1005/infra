terraform{
    backend "gcs" {
        bucket = "g-951c0919-tf-state"
        prefix = "terraform/state"
    }
}
resource "google_service_account" "myaccount" {
  account_id   = "jessy-service-acount"
  project      =  "g-951c0919"
  display_name = "Jessy's Service account for Github action Pipeline"
}

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}

locals{
    destroy = true
}