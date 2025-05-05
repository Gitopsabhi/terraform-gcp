resource "google_compute_instance" "def" {
  name         = "terraform-nopubliciplogin"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-2210-kinetic-amd64-v20230126"
    }
  }


  network_interface {
    network = google_compute_network.tf_vpc3.id
    subnetwork = google_compute_subnetwork.tf_subnet-19.id # Specify the subnetwor
    
  }
  tags = ["i27-ssh-network-tag", "custom-tag"]
  metadata = {
    startup-script = file("startup.sh") # Reference to the startup script file
}
}
