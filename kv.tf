#----------------------------------------------------------
# Enable secrets engines
#----------------------------------------------------------
resource "vault_mount" "kvv2" {
  namespace = var.namespace
  path      = "${var.team_name}-kv"
  type      = "kv-v2"
}

resource "vault_kv_secret_v2" "github" {
  namespace           = var.namespace
  mount               = vault_mount.kvv2.path
  name                = "github"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode(
    {
      token = var.github_token
    }
  )
  custom_metadata {
    max_versions = 5
    data = {
      owner_email = var.owner_email,
      charge_back = var.charge_back,
    }
  }
}

resource "vault_kv_secret_v2" "thing" {
  namespace           = var.namespace
  mount               = vault_mount.kvv2.path
  name                = "thing"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode(
    {
      thing = "thing",
      foo   = "bar"
    }
  )
  custom_metadata {
    max_versions = 5
    data = {
      owner_email = var.owner_email,
      charge_back = var.charge_back,
    }
  }
}

resource "vault_kv_secret_v2" "servicenow" {
  namespace           = var.namespace
  mount               = vault_mount.kvv2.path
  name                = "servicenow"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode(
    {
      thing = "thing",
      foo   = "bar"
    }
  )
  custom_metadata {
    max_versions = 5
    data = {
      owner_email = var.owner_email,
      charge_back = var.charge_back,
    }
  }
}
