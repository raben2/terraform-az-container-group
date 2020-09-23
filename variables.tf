variable "container_group_name" {
  type        = string
  default     = "test"
  description = "name of the container group to deploy to"
}
variable "container_group_dns_name" {
  type        = string
  default     = ""
  description = "DNS Label for the container group"
}
variable "container_group_location" {
  type        = string
  default     = "westeurope"
  description = "azure region of the service"
}
variable "container_group_environment" {
  type        = string
  default     = "develop"
  description = "Environment for deployment"
}
variable "container_group_os" {
  type        = string
  default     = "Linux"
  description = "Windows or Linux container"
}
variable "container_group_ip_type" {
  type        = string
  default     = "Private"
  description = "Public or private IP access"
}

variable "container_group_network_profile" {
  type        = string
  default     = null
  description = "Azure Network profile ID"
}

variable "container_group_resource_group" {
  type        = string
  default     = ""
  description = "name of the resource group"
}

variable "container_group_restart_policy" {
  type        = string
  default     = "Always"
  description = "restart behaviour"
}

variable "container_group_log_analytics" {
  type        = list(string)
  default     = null
  description = "extended logging configuration 1 = log_type, 2 workspace_id, 3 = workspace_key"
}
variable "container_group_log_metadata" {
  type        = map(string)
  default     = { m1 = "" }
  description = "additional log metadata"
}

variable "container_group_identity_type" {
  type        = string
  default     = ""
  description = "UserAssigned or SystemAssigned (optional)"
}

variable "container_group_identity_ids" {
  type        = list(string)
  default     = []
  description = "Assign identities (ids are only needed for type UserAssigned)"
}
variable "container_group_tags" {
  type = map(object({
    name  = string,
    value = string
  }))
  default = {
    tag1 = {
      name  = "",
      value = "",
    }
  }
  description = "Key value pairs to tag the resources"
}

variable "container_service_name" {
  type        = string
  description = "name of the service you want to deploy"
}

variable "container_service_image" {
  type        = string
  description = "docker image to deploy"
}
variable "container_service_version" {
  type        = string
  default     = "latest"
  description = "version of the service image"
}

variable "container_registry_username" {
  type        = string
  default     = ""
  description = "user of the private container registry"
}

variable "container_registry_password" {
  type        = string
  default     = ""
  description = "password of the private container registry"
}

variable "container_registry_server" {
  type        = string
  default     = ""
  description = "server url for the private container registry"
}


variable "container_memory" {
  type        = number
  default     = 1
  description = "container Memory in GB"
}

variable "container_cpu" {
  type        = number
  default     = 1
  description = "Number of cpu cores assigned to the container"
}

variable "container_gpu" {
  type = list(string)
  default = [
    null
  ]
  description = "gpu assignment for container (optional) first entry gpu # second sku"
}

variable "container_ports" {
  type = map(object({
    port     = number,
    protocol = string
  }))
  default = {
    port1 = {
      port     = 80,
      protocol = "TCP"
    }
  }
}
variable "container_volumes_enabled" {
  type        = bool
  default     = false
  description = "helper variable for conditional block"
}
variable "container_volumes" {
  type = map(object({
    volume_name                 = string,
    volume_mount_path           = string,
    volume_ro                   = bool,
    volume_storage_account_name = string,
    volume_storage_account_key  = string,
    volume_share_name           = string
  }))
  default = {
    vol1 = null
  }
  description = "volume mount (optional)"
}
variable "container_commands" {
  type        = list(string)
  default     = null
  description = "overwrite the docker entry point command"
}

variable "container_rp_http_get_path" {
  type        = string
  default     = ""
  description = "readiness probe path"
}
variable "container_rp_http_get_port" {
  type        = number
  default     = null
  description = "readiness probe port"
}
variable "container_rp_http_get_scheme" {
  type        = string
  default     = ""
  description = "readiness probe scheme http/https"
}
variable "container_lp_http_get_path" {
  type        = string
  default     = ""
  description = "liveness probe path"
}
variable "container_lp_http_get_port" {
  type        = number
  default     = null
  description = "liveness probe port"
}
variable "container_lp_http_get_scheme" {
  type        = string
  default     = ""
  description = "liveness probe scheme http/https"
}


variable "container_rp_exec" {
  type        = list(string)
  default     = null
  description = "readiness probe exec command"
}
variable "container_rp_init_seconds" {
  type        = number
  default     = 0
  description = "readiness probe initial delay seconds"
}
variable "container_rp_period" {
  type        = number
  default     = 0
  description = "readiness probe period in seconds"
}
variable "container_rp_failure" {
  type        = number
  default     = 0
  description = "readiness probe failure threshold"
}
variable "container_rp_success" {
  type        = number
  default     = 0
  description = "readiness probe success threshold"
}
variable "container_rp_timeout" {
  type        = number
  default     = 0
  description = "readiness probe timeout in seconds"
}
variable "container_lp_exec" {
  type        = list(string)
  default     = null
  description = "liveness probe exec command"
}
variable "container_lp_init_seconds" {
  type        = number
  default     = 0
  description = "liveness probe initial delay seconds"
}
variable "container_lp_period" {
  type        = number
  default     = 0
  description = "liveness probe period in seconds"
}
variable "container_lp_failure" {
  type        = number
  default     = 0
  description = "liveness probe failure threshold"
}
variable "container_lp_success" {
  type        = number
  default     = 0
  description = "liveness probe success threshold"
}
variable "container_lp_timeout" {
  type        = number
  default     = 0
  description = "liveness probe timeout in seconds"
}

variable "container_environment_vars" {
  type = map(object({
    name  = string,
    value = string
  }))
  default = {
    e1 = {
      name  = "",
      value = "",
    }
  }
  description = "Key value pairs to put into the environment"
}

variable "container_secure_environment_vars" {
  type = map(object({
    name  = string,
    value = string
  }))
  default = {
    se1 = {
      name  = "",
      value = "",
    }
  }
  description = "Key value pairs to put into the secure environment"
}

variable "container_liveness_probe_enabled" {
  type        = bool
  default     = false
  description = "helper variable for conditional liveness block"
}
variable "container_readiness_probe_enabled" {
  type        = bool
  default     = false
  description = "helper variable for conditional readiness block"
}
variable "container_group_log_analytics_enabled" {
  type        = bool
  default     = false
  description = "helper variable for conditional diagnostics block"
}
