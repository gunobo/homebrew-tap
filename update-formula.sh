#!/bin/zsh
# 새 버전 릴리즈 후 formula SHA256 자동 업데이트
# 사용: ./update-formula.sh 1.0.0

set -e
VERSION="${1:?버전을 입력하세요. 예: ./update-formula.sh 1.0.0}"
URL="https://github.com/gunobo/PortSearcher/releases/download/v$VERSION/pts-arm64.tar.gz"

echo "📦 tarball 다운로드 중: $URL"
TMP=$(mktemp)
curl -sL "$URL" -o "$TMP"

SHA=$(shasum -a 256 "$TMP" | awk '{print $1}')
rm "$TMP"

echo "🔑 SHA256: $SHA"

# formula 파일 업데이트
sed -i '' \
  -e "s|/tags/v[0-9.]*.tar.gz|/tags/v$VERSION.tar.gz|" \
  -e "s|sha256 \".*\"|sha256 \"$SHA\"|" \
  Formula/pts.rb

echo "✅ Formula/pts.rb 업데이트 완료"

git add Formula/pts.rb
git commit -m "pts: v$VERSION"
git push

echo "🎉 완료! 설치 명령:"
echo "   brew tap gunobo/tap"
echo "   brew install pts"
