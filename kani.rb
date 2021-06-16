# coding: utf-8
HOMEBREW_KANI_VERSION = "1.2.1"

class Kani < Formula
  desc "This tool supports git/GitHub operations for the novice developers on the shell."
  homepage "https://github.com/tamadalab/kani"
  license "CC0-1.0"
  # url "https://github.com/tamadalab/kani.git", :tag => "v#{HOMEBREW_KANI_VERSION}"
  url "https://github.com/tamadalab/kani/releases/download/v#{HOMEBREW_KANI_VERSION}/kani-#{HOMEBREW_KANI_VERSION}_darwin_amd64.tar.gz"
  version HOMEBREW_KANI_VERSION
  sha256 "89e2fa1923024e7501df32944f8b38b2a853d1b2a1bd0c96110e0ddb15c228c6"

  depends_on "git"
  depends_on "bash-preexec"

  def install
    bin.install "bin/kani"
    prefix.install "README.md"
    prefix.install "LICENSE"
    prefix.install "analyses"
    prefix.install "resources"
    prefix.install "scripts"
    prefix.install "docs"
  end

  def caveats
    <<~EOS
      To activate kani, execute the following snippet in your ~/.zshrc or ~/.bashrc.

        eval \"$(kani init -)\"
    EOS
  end
end
