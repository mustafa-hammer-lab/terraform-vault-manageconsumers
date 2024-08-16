# Define the policy name
path "kv2/data/*" {
  capabilities = ["read", "list"]
}

path "kv2/metadata/*" {
  capabilities = ["list"]
}
