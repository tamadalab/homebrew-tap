# coding: utf-8
HOMEBREW_PURPLECAT_VERSION = "0.3.3"

class Purplecat < Formula
  desc "Purple cat, Purple cat, What do you see? I see the dependant libraries and their licenses!"
  homepage "https://github.com/tamadalab/purplecat"
  license "WTFPL"
  url "https://github.com/tamadalab/purplecat/releases/download/v#{HOMEBREW_PURPLECAT_VERSION}/purplecat-#{HOMEBREW_PURPLECAT_VERSION}_darwin_amd64.tar.gz"
  version HOMEBREW_PURPLECAT_VERSION
  sha256 "49f8ece7bebe3a1ae0a36779f2145e1196d4c0d02e24de4aa64e3459ab91ba80"

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
