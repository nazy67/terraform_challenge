locals {
  common_tags = {
    Environment = var.env
    ManagedBy   = var.managed_by
    Owner       = var.owner
    GitUrl      = var.giturl
  }
}