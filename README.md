## Requirements

| Name | Version |
|------|---------|
| azurerm | 2.28.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | 2.28.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| container\_commands | overwrite the docker entry point command | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| container\_cpu | Number of cpu cores assigned to the container | `number` | `1` | no |
| container\_environment\_vars | Key value pairs to put into the environment | <pre>map(object({<br>    name  = string,<br>    value = string<br>  }))</pre> | <pre>{<br>  "e1": {<br>    "name": "",<br>    "value": ""<br>  }<br>}</pre> | no |
| container\_gpu | gpu assignment for container (optional) first entry gpu # second sku | `list(string)` | <pre>[<br>  null<br>]</pre> | no |
| container\_group\_dns\_name | DNS Label for the container group | `string` | `""` | no |
| container\_group\_environment | Environment for deployment | `string` | `"develop"` | no |
| container\_group\_identity\_ids | Assign identities (ids are only needed for type UserAssigned) | `list(string)` | `[]` | no |
| container\_group\_identity\_type | UserAssigned or SystemAssigned (optional) | `string` | `""` | no |
| container\_group\_ip\_type | Public or private IP access | `string` | `"Private"` | no |
| container\_group\_location | azure region of the service | `string` | `"westeurope"` | no |
| container\_group\_log\_analytics | extended logging configuration 1 = log\_type, 2 workspace\_id, 3 = workspace\_key | `list(string)` | <pre>[<br>  null<br>]</pre> | no |
| container\_group\_log\_metadata | additional log metadata | `map(string)` | <pre>{<br>  "m1": ""<br>}</pre> | no |
| container\_group\_name | name of the container group to deploy to | `string` | `"test"` | no |
| container\_group\_network\_profile | Azure Network profile ID | `string` | `""` | no |
| container\_group\_os | Windows or Linux container | `string` | `"Linux"` | no |
| container\_group\_resource\_group | name of the resource group | `string` | `""` | no |
| container\_group\_restart\_policy | restart behaviour | `string` | `"Always"` | no |
| container\_group\_tags | Key value pairs to tag the resources | <pre>map(object({<br>    name  = string,<br>    value = string<br>  }))</pre> | <pre>{<br>  "tag1": {<br>    "name": "",<br>    "value": ""<br>  }<br>}</pre> | no |
| container\_lp\_exec | liveness probe exec command | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| container\_lp\_failure | liveness probe failure threshold | `number` | `0` | no |
| container\_lp\_http\_get\_path | liveness probe path | `string` | `""` | no |
| container\_lp\_http\_get\_port | liveness probe port | `number` | `null` | no |
| container\_lp\_http\_get\_scheme | liveness probe scheme http/https | `string` | `""` | no |
| container\_lp\_init\_seconds | liveness probe initial delay seconds | `number` | `0` | no |
| container\_lp\_period | liveness probe period in seconds | `number` | `0` | no |
| container\_lp\_success | liveness probe success threshold | `number` | `0` | no |
| container\_lp\_timeout | liveness probe timeout in seconds | `number` | `0` | no |
| container\_memory | container Memory in GB | `number` | `1` | no |
| container\_ports | n/a | <pre>map(object({<br>    port     = number,<br>    protocol = string<br>  }))</pre> | <pre>{<br>  "port1": {<br>    "port": 80,<br>    "protocol": "TCP"<br>  }<br>}</pre> | no |
| container\_registry\_password | password of the private container registry | `string` | `""` | no |
| container\_registry\_server | server url for the private container registry | `string` | `""` | no |
| container\_registry\_username | user of the private container registry | `string` | `""` | no |
| container\_rp\_exec | readiness probe exec command | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| container\_rp\_failure | readiness probe failure threshold | `number` | `0` | no |
| container\_rp\_http\_get\_path | readiness probe path | `string` | `""` | no |
| container\_rp\_http\_get\_port | readiness probe port | `number` | `null` | no |
| container\_rp\_http\_get\_scheme | readiness probe scheme http/https | `string` | `""` | no |
| container\_rp\_init\_seconds | readiness probe initial delay seconds | `number` | `0` | no |
| container\_rp\_period | readiness probe period in seconds | `number` | `0` | no |
| container\_rp\_success | readiness probe success threshold | `number` | `0` | no |
| container\_rp\_timeout | readiness probe timeout in seconds | `number` | `0` | no |
| container\_secure\_environment\_vars | Key value pairs to put into the secure environment | <pre>map(object({<br>    name  = string,<br>    value = string<br>  }))</pre> | <pre>{<br>  "se1": {<br>    "name": "",<br>    "value": ""<br>  }<br>}</pre> | no |
| container\_service\_image | docker image to deploy | `string` | n/a | yes |
| container\_service\_name | name of the service you want to deploy | `string` | n/a | yes |
| container\_service\_version | version of the service image | `string` | `"latest"` | no |
| container\_volumes | volume mount (optional) | <pre>map(object({<br>    volume_name                 = string,<br>    volume_mount_path           = string,<br>    volume_ro                   = bool,<br>    volume_storage_account_name = string,<br>    volume_storage_account_key  = string,<br>    volume_share_name           = string<br>  }))</pre> | <pre>{<br>  "vol1": null<br>}</pre> | no |
| container\_volumes\_enabled | helper variable for conditional block | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| fqdn | url of the container group |
| id | id of the container group |
| ip | ip address of the container group |

