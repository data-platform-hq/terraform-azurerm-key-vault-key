variable "custom_rotation_policy" {
  type = object({
    time_before_expiry   = optional(string, "P10D")
    expire_after         = optional(string, "P90D")
    notify_before_expiry = optional(string, "P15D")
  })
  description = "Map with parameters to configure Key rotation policy"
}

variable "prefix" {
  type        = string
  description = "Specifies the prefix of the Key Vault Key"
  default     = ""
}

variable "custom_key_name" {
  type        = string
  description = "Specifies the custom name of the Key Vault Key"
  default     = null
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists"
}

variable "key_vault_id" {
  type        = string
  description = "Key Vault ID"
}

variable "key_type" {
  type        = string
  description = "Key Type to use for this Key Vault Key: (EC,EC-HSM,RSA,RSA-HSM)"
  default     = "RSA"
}

variable "key_opts" {
  type        = list(string)
  description = "JSON web key operations: (decrypt,encrypt,sign,unwrapKey,verify,wrapKey)"
  default = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}

variable "default_expiration_date" {
  type        = string
  description = "Expiration UTC datetime (Y-m-d'T'H:M:S'Z')"
  default     = null
}

variable "key_size" {
  type        = number
  description = "Size of the RSA key to create in bytes, required for RSA & RSA-HSM: (1024 - 2048)"
  default     = 2048
}
