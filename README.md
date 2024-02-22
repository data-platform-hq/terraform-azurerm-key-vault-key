# Azure Key Vault Key Terraform module
Terraform module for creation Azure Key Vault Key

## Usage
```hcl
data "azurerm_key_vault" "example" {
  name                = "example"
  resource_group_name = "example"
}

module "key_vault_keys" {
  source   = "data-platform-hq/key-vault-key/azurerm"
  version  = "~> 1.0"

  project                = "datahq"
  env                    = "example"
  location               = "eastus"
  prefix                 = "cmk"
  key_vault_id           = data.azurerm_key_vault.example.id
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.60.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.60.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_key.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_key_name"></a> [custom\_key\_name](#input\_custom\_key\_name) | Specifies the custom name of the Key Vault Key | `string` | `null` | no |
| <a name="input_custom_rotation_policy"></a> [custom\_rotation\_policy](#input\_custom\_rotation\_policy) | Map with parameters to configure Key rotation policy | <pre>object({<br>    time_before_expiry   = optional(string, "P10D")<br>    expire_after         = optional(string, "P90D")<br>    notify_before_expiry = optional(string, "P15D")<br>  })</pre> | n/a | yes |
| <a name="input_default_expiration_date"></a> [default\_expiration\_date](#input\_default\_expiration\_date) | Expiration UTC datetime (Y-m-d'T'H:M:S'Z') | `string` | `null` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment name | `string` | n/a | yes |
| <a name="input_key_opts"></a> [key\_opts](#input\_key\_opts) | JSON web key operations: (decrypt,encrypt,sign,unwrapKey,verify,wrapKey) | `list(string)` | <pre>[<br>  "decrypt",<br>  "encrypt",<br>  "sign",<br>  "unwrapKey",<br>  "verify",<br>  "wrapKey"<br>]</pre> | no |
| <a name="input_key_size"></a> [key\_size](#input\_key\_size) | Size of the RSA key to create in bytes, required for RSA & RSA-HSM: (1024 - 2048) | `number` | `2048` | no |
| <a name="input_key_type"></a> [key\_type](#input\_key\_type) | Key Type to use for this Key Vault Key: (EC,EC-HSM,RSA,RSA-HSM) | `string` | `"RSA"` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | Key Vault ID | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Specifies the prefix of the Key Vault Key | `string` | `""` | no |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | The Key Vault Key ID |
| <a name="output_key_name"></a> [key\_name](#output\_key\_name) | The Key Vault Key name |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azurerm-key-vault-key/blob/main/LICENSE)
