# coding: utf-8
HOMEBREW_KANI_VERSION = "1.0.0"

class Kani < Formula
  desc "これは，git初心者向けのcommitを促す補助ツールになります．git addされる前とのファイル編集行と，コマンド操作時の連続エラー発生回数によってcommitを促すか否かを判別するツールです．促すべきと判断した場合，git addやstatusなどの説明をターミナル上に簡易に表示します．"
  homepage "https://github.com/tamadalab/kani"
  license "CC0"
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
      system "go", "build", "-o", "bin/git-kani", "git-kani.go"
      bin.install "bin/git-kani"
      prefix.install "README.md"
      ## ライセンスファイルを用意して，以下のコメントを外しましょう．
      # opt.install "LICENSE"
      prefix.install "scripts"
      prefix.install "analyses"
    end
  end

  def caveats
    <<~EOS
      To activate kani, execute the following snippet in your ~/.zshrc.

        eval \"$(git kani init -)\"
    EOS
  end
end
