terraform{
    backend "gcs"{
        bucket = "gcp-951c0919-tf-state"
        prefix = "terraform/state"
    }
}

resource "null_resource" "null"{
    triggers = {
        value = "Doing nothing"
    }
}