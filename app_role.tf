# Create admin policy in the root namespace
resource "vault_policy" "read_only" {
  namespace = var.namespace
  name      = "read_only"
  policy    = file("${path.module}/policies/read_only.hcl")
}

resource "vault_auth_backend" "approle" {
  namespace = var.namespace
  type      = "approle"
  path      = "${var.team_name}-approle"
}

resource "vault_approle_auth_backend_role" "team_role_read_only" {
  namespace  = var.namespace
  depends_on = [vault_auth_backend.approle, vault_policy.read_only]

  backend        = vault_auth_backend.approle.path
  role_name      = "${var.team_name}-read_only-role"
  token_policies = [vault_policy.read_only.name]
}
