group "default" {
  targets = ["workspace-py"]
}

target "jj" {
  platforms = ["linux/amd64", "linux/arm64"]
  context   = "jj"
}

target "uv" {
  platforms = ["linux/amd64", "linux/arm64"]
  context   = "uv"
}

target "zsh" {
  platforms = ["linux/amd64", "linux/arm64"]
  context   = "zsh"
}

target "workspace-py" {
  platforms = ["linux/amd64", "linux/arm64"]
  context   = "workspace-py"
  contexts = {
    jj  = "target:jj"
    uv  = "target:uv"
    zsh = "target:zsh"
  }
  tags   = ["startown/workspace-py:0.1.0"]
  attest = ["type=provenance,mode=min", "type=sbom"]
}
