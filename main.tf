locals {
  prefix   = length(var.prefix) != 0 ? "${var.prefix}-" : ""
  key_name = var.custom_key_name != null ? var.custom_key_name : "${local.prefix}${var.project}-${var.env}-${var.location}"

  default_expiration_date = var.default_expiration_date == null ? timeadd(timestamp(), "2160h") : var.default_expiration_date
}

resource "azurerm_key_vault_key" "this" {
  name            = local.key_name
  key_type        = var.key_type
  key_size        = var.key_size
  key_vault_id    = var.key_vault_id
  key_opts        = var.key_opts
  expiration_date = local.default_expiration_date

  lifecycle {
    ignore_changes = [
      expiration_date,
    ]
  }

  dynamic "rotation_policy" {
    for_each = var.custom_rotation_policy != null ? [1] : []
    content {
      automatic {
        time_before_expiry = var.custom_rotation_policy.time_before_expiry
      }
      expire_after         = var.custom_rotation_policy.expire_after
      notify_before_expiry = var.custom_rotation_policy.notify_before_expiry
    }
  }
}
