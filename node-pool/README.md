## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 7.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 7.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | ~> 7.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [google-beta_google_container_node_pool.pool](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_container_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_auto_repair"></a> [auto\_repair](#input\_auto\_repair) | Activate auto repair on nodes | `bool` | `true` | no |
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input\_auto\_upgrade) | Activate auto upgrade on nodes | `bool` | `true` | no |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Name of the cluster to which to add this Node Pool | `string` | n/a | yes |
| <a name="input_disk_size_gb"></a> [disk\_size\_gb](#input\_disk\_size\_gb) | Disk of which size to attach to the nodes in the pool | `string` | `"50"` | no |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk\_type) | The type of disk to use for nodes in the pool | `string` | `"pd-ssd"` | no |
| <a name="input_image_type"></a> [image\_type](#input\_image\_type) | The image type to use for nodes. | `string` | `"COS"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | The Kubernetes labels to be applied to each node | `map(string)` | `{}` | no |
| <a name="input_local_ssd_count"></a> [local\_ssd\_count](#input\_local\_ssd\_count) | The amount of local SSD disks that will be attached to each cluster node | `string` | `"0"` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | The type of machine to use for nodes in the pool | `string` | `"n1-standard-1"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Node Pool | `string` | n/a | yes |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The number of nodes to create in this Node Pool | `number` | `3` | no |
| <a name="input_node_count_max"></a> [node\_count\_max](#input\_node\_count\_max) | The max number of nodes to create in autoscaling mode | `number` | `10` | no |
| <a name="input_node_count_min"></a> [node\_count\_min](#input\_node\_count\_min) | The min number of nodes to create in autoscaling mode | `number` | `1` | no |
| <a name="input_node_metadata"></a> [node\_metadata](#input\_node\_metadata) | Node Metadata | `string` | n/a | yes |
| <a name="input_oauth_scopes"></a> [oauth\_scopes](#input\_oauth\_scopes) | Oauth scope on Google AMI | `list(string)` | <pre>[<br/>  "https://www.googleapis.com/auth/compute",<br/>  "https://www.googleapis.com/auth/devstorage.read_only",<br/>  "https://www.googleapis.com/auth/logging.write",<br/>  "https://www.googleapis.com/auth/monitoring",<br/>  "https://www.googleapis.com/auth/servicecontrol",<br/>  "https://www.googleapis.com/auth/service.management.readonly",<br/>  "https://www.googleapis.com/auth/trace.append"<br/>]</pre> | no |
| <a name="input_preemptible"></a> [preemptible](#input\_preemptible) | Use preemptible nodes | `bool` | `false` | no |
| <a name="input_taint"></a> [taint](#input\_taint) | Add a taint to a node | `list(any)` | `[]` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | In which zone to create the Node Pool | `string` | n/a | yes |

## Outputs

No outputs.
