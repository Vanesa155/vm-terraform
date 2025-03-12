variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "prefix" {
  type        = string
  default     = "win-vm-iis"
  description = "Prefix of the resource name"
}

variable "vm_name" {
  type        = string
  description = "Nombre específico de la máquina virtual"
}

variable "admin_password" {
  type        = string
  description = "La contraseña del administrador de la VM"
  sensitive   = true
}
