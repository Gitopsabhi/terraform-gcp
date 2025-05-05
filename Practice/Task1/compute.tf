resource "google_compute_instance" "default" {
  name         = "terraform-test"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-2210-kinetic-amd64-v20230126"
    }
  }


  network_interface {
    network = google_compute_network.tf_vpc.id
    subnetwork = google_compute_subnetwork.tf_subnet.id # Specify the subnetwor
    access_config {
        nat_ip = google_compute_address.static.address
        }
  }
  metadata = {
    startup-script = file("startup.sh") # Reference to the startup script file
}
}
