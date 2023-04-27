terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
provider "google" {
  version = "3.5.0"
  project = "<PROJECT_ID>"
  region  = "<REGION>" # ex : us-central1
  zone    = "<ZONE>" # ex : us-central1-a
}

resource "google_compute_instance" "vm_instance" {
  name         = "<NAME>"
  machine_type = "<machine_type>" # ex : f1-micro
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}