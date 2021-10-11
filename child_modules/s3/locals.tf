locals {
  common_tags = {
    Environment = var.env
    Owner       = var.owner
    ManagedBy   = var.managed_by
    GitUrl      = var.giturl
  }
}