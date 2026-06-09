class Pts < Formula
  desc "macOS 포트 사용 현황 확인 CLI 도구"
  homepage "https://github.com/gunobo/PortSearcher"
  url "https://github.com/gunobo/PortSearcher/releases/download/v1.0.0/pts-arm64.tar.gz"
  sha256 "ce639ea7716c9c369dcea79b61af8ee494502a30d7514b4c23b6961cba59a6ed"
  license "MIT"
  version "1.0.0"

  depends_on :macos

  def install
    bin.install "pts"
  end

  test do
    output = shell_output("#{bin}/pts help")
    assert_match "사용법", output
  end
end
