# coding: utf-8
HOMEBREW_KANI_VERSION = "1.0.0"

class Kani < Formula
  desc "This tool supports git/GitHub operations for the novice developers on the shell."
  homepage "https://github.com/tamadalab/kani"
  license "CC0-1.0"
  # url "https://github.com/tamadalab/kani.git", :tag => "v#{HOMEBREW_KANI_VERSION}"
  url "https://github.com/tamadalab/kani.git", :branch => "master"
  version HOMEBREW_KANI_VERSION
  head "https://github.com/tamadalab/kani.git"

  depends_on "git"
  depends_on "go"    => :build

  def install
    ENV['GOPATH'] = buildpath
    ENV['GO111MODULE'] = 'on'
    kani_path = buildpath/"src/github.com/tamadalab/kani/"
    kani_path.install buildpath.children

    cd kani_path do
      system "go", "build", "-o", "bin/kani", "git-kani.go"
      bin.install "bin/kani"
      prefix.install "README.md"
      prefix.install "scripts"
      prefix.install "analyses"
      prefix.install "resources"
      prefix.install "LICENSE"
    end
  end

  def caveats
    <<~EOS
      To activate kani, execute the following snippet in your ~/.zshrc or ~/.bashrc.

        eval \"$(kani init -)\"
    EOS
  end
end
