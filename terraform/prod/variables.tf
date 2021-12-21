variable cloud_id {
  description = "cloud"
}
variable folder_id {
  description = "folder"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable public_key_path {
  # Описание переменной
  description = "public key path"
}
variable image_id {
  description = "image"
}
variable subnet_id {
  description = "subnet"
}
variable service_account_key_file {
  description = "service_account_key_file"
}
variable private_key_path {
  description = "private key path"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

