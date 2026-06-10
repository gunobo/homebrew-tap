class Pts < Formula
  desc "macOS 포트 사용 현황 확인 CLI 도구"
  homepage "https://github.com/gunobo/PortSearcher"
  url "https://github.com/gunobo/PortSearcher/releases/download/v1.4.0/pts-arm64.tar.gz"
  sha256 "c8a93140c2261f327c1475d0ec450b65a18d170652bdf4208a05e7e1a1b7c51f"
  license "MIT"
  version "1.4.0"

  depends_on :macos

  def install
    bin.install "pts"
  end

  test do
    output = shell_output("#{bin}/pts help")
    assert_match "사용법", output
  end
end
