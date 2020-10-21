# coding: utf-8
HOMEBREW_PURPLECAT_VERSION = "0.1.0"

class Purplecat < Formula
  desc "Purple cat, Purple cat, What do you see? I see the dependant libraries and their licenses!"
  homepage "https://github.com/tamadalab/purplecat"
  license "WTFPL"
  url "https://github.com/tamadalab/purplecat/releases/download/v#{HOMEBREW_PURPLECAT_VERSION}/purplecat-#{HOMEBREW_PURPLECAT_VERSION}_darwin_amd64.tar.gz"
  version HOMEBREW_PURPLECAT_VERSION
  sha256 "5a09f5a057a3082c44190af123dc2b9ccbcefc57a5b3d3f424e5832ee66d8889"

  def install
    bin.install "bin/purplecat"

    if build.with? "completions"
      bash_completion.install "completions/bash/purplecat"
    end
  end
end
