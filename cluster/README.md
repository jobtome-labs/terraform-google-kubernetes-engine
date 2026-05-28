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
| [google-beta_google_container_cluster.cluster](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_container_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_additional_zones"></a> [additional\_zones](#input\_additional\_zones) | The node pools will be replicated automatically to the additional zones | `list(string)` | `[]` | no |
| <a name="input_bigquery_destination_dataset_id"></a> [bigquery\_destination\_dataset\_id](#input\_bigquery\_destination\_dataset\_id) | Destination for the monitoring of resources | `string` | `"gke_cluster_resource_consumption_usage"` | no |
| <a name="input_cloudrun"></a> [cloudrun](#input\_cloudrun) | Enable Cloud Run | `bool` | `false` | no |
| <a name="input_cluster_autoscaling"></a> [cluster\_autoscaling](#input\_cluster\_autoscaling) | Cluster autoscaling config | `list(any)` | <pre>[<br/>  {<br/>    "enabled": true,<br/>    "resource_limits": [<br/>      {<br/>        "maximum": 200,<br/>        "minimum": 2,<br/>        "resource_type": "cpu"<br/>      },<br/>      {<br/>        "maximum": 400,<br/>        "minimum": 8,<br/>        "resource_type": "memory"<br/>      }<br/>    ]<br/>  }<br/>]</pre> | no |
| <a name="input_database_encryption"></a> [database\_encryption](#input\_database\_encryption) | ETCD encryption by GKE | `list(any)` | <pre>[<br/>  {<br/>    "key_name": "",<br/>    "state": "DECRYPTED"<br/>  }<br/>]</pre> | no |
| <a name="input_description"></a> [description](#input\_description) | Cluster description | `string` | `"K8s cluster"` | no |
| <a name="input_enable_gateway_api"></a> [enable\_gateway\_api](#input\_enable\_gateway\_api) | (Optional) Enable Gateway API for this Cluster. Defaults to false. | `bool` | `false` | no |
| <a name="input_enable_network_egress_metering"></a> [enable\_network\_egress\_metering](#input\_enable\_network\_egress\_metering) | Setting for deciding the monitoring of resources | `bool` | `false` | no |
| <a name="input_enable_private_master"></a> [enable\_private\_master](#input\_enable\_private\_master) | Enable private master endpoint | `bool` | `true` | no |
| <a name="input_istio"></a> [istio](#input\_istio) | Enable Istio | `bool` | `false` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | The Kubernetes labels to be applied to cluster resources | `map(string)` | `{}` | no |
| <a name="input_master_authorized_networks_cidr"></a> [master\_authorized\_networks\_cidr](#input\_master\_authorized\_networks\_cidr) | Master authorized cidr blocks | `list(any)` | <pre>[<br/>  {<br/>    "cidr_block": "10.0.0.0/8",<br/>    "display_name": "internal"<br/>  }<br/>]</pre> | no |
| <a name="input_master_ipv4_cidr_block"></a> [master\_ipv4\_cidr\_block](#input\_master\_ipv4\_cidr\_block) | Master IPv4 cidr block | `string` | `"172.16.0.0/28"` | no |
| <a name="input_min_master_version"></a> [min\_master\_version](#input\_min\_master\_version) | Minimum kubernetes master version | `string` | `"1.15.11-gke.3"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the cluster, unique within the project and zone | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | The name or self\_link of the Google Compute Engine network to which the cluster is connected | `string` | n/a | yes |
| <a name="input_pods_range_name"></a> [pods\_range\_name](#input\_pods\_range\_name) | Network range for pods | `string` | n/a | yes |
| <a name="input_security_group"></a> [security\_group](#input\_security\_group) | Security Group | `list(string)` | `[]` | no |
| <a name="input_services_range_name"></a> [services\_range\_name](#input\_services\_range\_name) | Network range for services | `string` | n/a | yes |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | The name or self\_link of the Google Compute Engine subnetwork to which the cluster is connected | `string` | n/a | yes |
| <a name="input_workload_pool"></a> [workload\_pool](#input\_workload\_pool) | Workload Identity Pool | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone the master and nodes specified in initial\_node\_count should be created in | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
