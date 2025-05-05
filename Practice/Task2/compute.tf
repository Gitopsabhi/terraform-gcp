resource "google_compute_instance" "default" {
  name         = "terraform-nopublicip"
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
    
  }
  metadata = {
    startup-script = file("startup.sh") # Reference to the startup script file
}
}
