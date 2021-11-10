provider "yandex" {
  version = "0.35"
  token     = "var.service_account_key_file"
  cloud_id  = "var.cloud_id"
  folder_id = "var.folder_id"
  zone      = "var.zone"
}
resource "yandex_compute_instance" "app" {
  name = "reddit-app0"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = "fd8h0307vdvaiuncudbo"
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = "e9b08ggehid135lepnt5"
    nat       = true
  }
  metadata = {
  ssh-keys = "ubuntu:${file("/mnt/c/Users/Gleb/appuser.pub")}"
  }
  
  connection {
    type = "ssh"
    host = yandex_compute_instance.app.network_interface.0.nat_ip_address
    user = "ubuntu"
    agent = false
  # путь до приватного ключа
    private_key = file("~/.ssh/appuser")
    }
  
  provisioner "file" {
    source = "files/puma.service"
    destination = "/tmp/puma.service"
  }
  provisioner "remote-exec" {
  script = "files/deploy.sh"
  }
  


}
