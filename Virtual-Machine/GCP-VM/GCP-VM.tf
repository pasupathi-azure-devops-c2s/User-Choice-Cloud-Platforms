resource "google_compute_network" "google-vpc" {
  name = "googlevpc01"
  auto_create_subnetworks = true
  
}

resource "google_compute_firewall" "google-nsg" {
  name = "allow-ssh"
  network = google_compute_network.google-vpc.name

  allow {
    protocol = "tcp"
    ports = [ "22" ]
  }

  source_ranges = [ "0.0.0.0/0" ]
  
}

resource "google_compute_address" "static_ip" {
  name   = "my-static-ip"  # Name for the static IP
  region = "us-central1"    # Specify the region
}

resource "google_compute_instance" "google-vm" {
  name = "google-ubuntu-vm"
  machine_type = "e2-micro"
  zone = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-arm64-v20240927"
    }
  }
  network_interface {
    network = google_compute_network.google-vpc.name

    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }
  
}