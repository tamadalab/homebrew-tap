# coding: utf-8
HOMEBREW_NULETE_VERSION = "0.1.0"

class Nulete < Formula
  desc "Generating unit tests tool for assignments in the Java programming courses"
  homepage "https://github.com/tamadalab/nulete"
  license "CC0-1.0"
  url "https://github.com/tamadalab/nulete/releases/download/v#{HOMEBREW_NULETE_VERSION}/nulete-#{HOMEBREW_PURPLECAT_VERSION}_darwin_amd64.tar.gz"
  version HOMEBREW_NULETE_VERSION
  sha256 "7d7ade1cb4cf9ce6ce45593e5ad1089af09c375f30ccf17e40bd80cb3c4de893"

  def install
    prefix.install "README.md"
    prefix.install "LICENSE"
    prefix.install "docs"
    bin.install "bin/nulete"
  end
end
