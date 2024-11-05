resource "vault_mount" "kv" {
  path        = "kv"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

resource "vault_policy" "kv_reader" {
  depends_on = [vault_mount.kv]
  name       = "kv-reader"

  policy = <<EOT
path "kv/*" {
  capabilities = ["read", "list"]
}
EOT
}