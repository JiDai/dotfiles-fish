# GO paths configuration

set -gx GOROOT $HOME/opt/go

if test -d $GOROOT/bin
	set -gx PATH $GOROOT/bin $PATH
end

set -gx GOPATH $HOME/GitHome/go

set -gx PATH $GOPATH/bin $PATH
set -gx PATH $GOROOT/bin $PATH

if command -v go > /dev/null 2>&1
	if test ! -d $HOME/go-workspace
		mkdir $GOPATH
	end
end
