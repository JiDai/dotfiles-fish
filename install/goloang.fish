function main
  set GO_VERSION "1.20.2"

  set OS "darwin"
  set ARCH "arm64"

  source './symlinks/config/fish/conf.d/golang.fish'

  set GO_ARCHIVE "go$GO_VERSION.$OS-$ARCH.tar.gz"

  curl -O "https://dl.google.com/go/$GO_ARCHIVE"
  tar -C "$HOME/opt" -xzf "$GO_ARCHIVE"
  rm -rf "$GO_ARCHIVE"

  if command -v go > /dev/null 2>&1
  go install github.com/kisielk/errcheck@latest
  go install golang.org/x/lint/golint@latest
  go install golang.org/x/tools/cmd/goimports@latest
  end

end

main
