class Pts < Formula
  desc "macOS 포트 사용 현황 확인 CLI 도구"
  homepage "https://github.com/gunobo/PortSearcher"
  url "https://github.com/gunobo/PortSearcher/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
  license "MIT"

  depends_on :macos
  depends_on xcode: :build

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/PortSearcherCLI" => "pts"
  end

  test do
    output = shell_output("#{bin}/pts help")
    assert_match "사용법", output
  end
end
