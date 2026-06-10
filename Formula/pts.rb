class Pts < Formula
  desc "macOS 포트 사용 현황 확인 CLI 도구"
  homepage "https://github.com/gunobo/PortSearcher"
  url "https://github.com/gunobo/PortSearcher/releases/download/v1.3.0/pts-arm64.tar.gz"
  sha256 "f0476d2546890282ca852b92be4a93ff78aa4c3304cd8496a178d240e244eba6"
  license "MIT"
  version "1.3.0"

  depends_on :macos

  def install
    bin.install "pts"
  end

  test do
    output = shell_output("#{bin}/pts help")
    assert_match "사용법", output
  end
end
