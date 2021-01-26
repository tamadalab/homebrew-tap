# coding: utf-8
HOMEBREW_PURPLECAT_VERSION = "0.3.3"

class Purplecat < Formula
  desc "Purple cat, Purple cat, What do you see? I see the dependant libraries and their licenses!"
  homepage "https://github.com/tamadalab/purplecat"
  license "WTFPL"
  url "https://github.com/tamadalab/purplecat/releases/download/v#{HOMEBREW_PURPLECAT_VERSION}/purplecat-#{HOMEBREW_PURPLECAT_VERSION}_darwin_amd64.tar.gz"
  version HOMEBREW_PURPLECAT_VERSION
  sha256 "dcfc80103c79e06affe2bb4668867369a0debb2d7ca1c56b961444d5a9e1f86a"

  def install
    prefix.install "README.md"
    prefix.install "LICENSE"
    prefix.install "docs"
    bin.install "bin/purplecat"

    if build.with? "completions"
      bash_completion.install "completions/bash/purplecat"
    end
  end
end
