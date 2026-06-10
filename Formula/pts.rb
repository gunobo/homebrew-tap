class Pts < Formula
  desc "macOS 포트 사용 현황 확인 CLI 도구"
  homepage "https://github.com/gunobo/PortSearcher"
  url "https://github.com/gunobo/PortSearcher/releases/download/v1.2.0/pts-arm64.tar.gz"
  sha256 "2be19aa67570e49409af6a0033e8fa9cc68e2856e404a0b3f220ee6f88f86aa3"
  license "MIT"
  version "1.2.0"

  depends_on :macos

  def install
    bin.install "pts"
  end

  test do
    output = shell_output("#{bin}/pts help")
    assert_match "사용법", output
  end
end
