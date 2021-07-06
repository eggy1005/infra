terraform{
    backend "gcs" {
        bucket = "g-951c0919-tf-state"
        prefix = "terraform/state"
    }
}
resource "null_resource" "null" {
    triggers = {
        value = "Doing nothing"
    }
}
