group "default" {
  targets = ["workspace-py"]
}

target "jj" {
  platforms = ["linux/amd64", "linux/arm64"]
  context   = "jj"
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
    zsh = "target:zsh"
  }
  tags   = ["startown/workspace-py:0.2.0"]
  attest = ["type=provenance,mode=min", "type=sbom"]
}
