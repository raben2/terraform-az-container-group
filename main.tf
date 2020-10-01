provider "azurerm" {
  version = "~> 2.29.0"
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

resource "azurerm_container_group" "main" {
  name                = format("%s-%s", var.container_group_name, var.container_group_environment)
  location            = var.container_group_location
  resource_group_name = var.container_group_resource_group
  os_type             = var.container_group_os
  restart_policy      = var.container_group_restart_policy
  ip_address_type     = var.container_group_ip_type
  network_profile_id  = var.container_group_network_profile
  dns_name_label      = var.container_group_dns_name

  image_registry_credential {
    username = var.container_registry_username
    password = var.container_registry_password
    server   = var.container_registry_server
  }
  dynamic "diagnostics" {
    for_each = var.container_group_log_analytics_enabled ? [1] : []
    content {
      log_analytics {
        log_type      = element(var.container_group_log_analytics, 0)
        workspace_id  = element(var.container_group_log_analytics, 1)
        workspace_key = element(var.container_group_log_analytics, 2)
        metadata      = var.container_group_log_metadata
      }
    }
  }
  container {
    name   = var.container_service_name
    image  = format("%s/%s:%s", var.container_registry_server, var.container_service_image, var.container_service_version)
    cpu    = var.container_cpu
    memory = var.container_memory
    dynamic "gpu" {
      for_each = var.container_assign_gpu ? [1] : []
      content {
        count = element(var.container_gpu, 0)
        sku   = element(var.container_gpu, 1)
      }
    }
    dynamic "ports" {
      for_each = var.container_ports
      content {
        port     = lookup(ports.value, "port", 80)
        protocol = lookup(ports.value, "protocol", "TCP")
      }
    }
    dynamic "volume" {
      for_each = var.container_volumes_enabled ? map(var.container_volumes) : []
      content {
        name                 = lookup(volume.value, "volume_name")
        mount_path           = lookup(volume.value, "volume_mount_path")
        read_only            = lookup(volume.value, "volume_ro")
        storage_account_name = lookup(volume.value, "volume_storage_account_name")
        storage_account_key  = lookup(volume.value, "volume_storage_account_key")
        share_name           = lookup(volume.value, "volume_share_name")
      }
    }
    commands                     = var.container_commands
    environment_variables        = var.container_environment_vars
    secure_environment_variables = var.container_secure_environment_vars
    dynamic "readiness_probe" {
      for_each = var.container_readiness_probe_enabled ? [1] : []
      content {
        exec                  = var.container_rp_exec
        initial_delay_seconds = var.container_rp_init_seconds
        period_seconds        = var.container_rp_period
        failure_threshold     = var.container_rp_failure
        success_threshold     = var.container_rp_success
        timeout_seconds       = var.container_rp_timeout
        http_get {
          path   = var.container_rp_http_get_path
          port   = var.container_rp_http_get_port
          scheme = var.container_rp_http_get_scheme

        }
      }
    }
    dynamic "liveness_probe" {
      for_each = var.container_liveness_probe_enabled ? [1] : []
      content {
        exec                  = var.container_lp_exec
        initial_delay_seconds = var.container_lp_init_seconds
        period_seconds        = var.container_lp_period
        failure_threshold     = var.container_lp_failure
        success_threshold     = var.container_lp_success
        timeout_seconds       = var.container_lp_timeout
        http_get {
          path   = var.container_lp_http_get_path
          port   = var.container_lp_http_get_port
          scheme = var.container_lp_http_get_scheme

        }
      }
    }
  }
  tags = {
    for tag in var.container_group_tags :
    tag.name => tag.value
  }

}
