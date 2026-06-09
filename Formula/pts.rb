class Pts < Formula
  desc "macOS 포트 사용 현황 확인 CLI 도구"
  homepage "https://github.com/gunobo/PortSearcher"
  url "https://github.com/gunobo/homebrew-tap/releases/download/v1.0.0/pts-arm64.tar.gz"
  sha256 "a23c9d1d34737629fe6145798ae5a0377b3d15f795124c34257253ad33d7c499"
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
