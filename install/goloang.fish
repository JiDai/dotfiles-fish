function main
  set GO_VERSION "1.19"

  set OS (uname -s | tr "[:upper:]" "[:lower:]")
  set ARCH (uname -m | tr "[:upper:]" "[:lower:]")

  if test "$ARCH" = "x86_64"
    ARCH="amd64"
  else if string match -r '^armv.l$' "$ARCH"
    ARCH="armv6l"
  end

  if [[ ! -d "$HOME/opt/go" ]]
    set GO_ARCHIVE "go$GO_VERSION.$OS-$ARCH.tar.gz"
 
    curl -O "https://dl.google.com/go/$GO_ARCHIVE"
    tar -C "$HOME/opt" -xzf "$GO_ARCHIVE"
    rm -rf "$GO_ARCHIVE"
  end

  source "../sources/golang"
  mkdir -p "$GOPATH"

  if command -v go > /dev/null 2>&1
    if test "$ARCH" = "amd64"
      go get -u github.com/derekparker/delve/cmd/dlv
    end

    go get -u github.com/kisielk/errcheck
    go get -u golang.org/x/lint/golint
    go get -u golang.org/x/tools/cmd/goimports
  end

end

main
