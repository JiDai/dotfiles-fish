# GO paths configuration

if test -d $HOME/opt/go/bin
  set -gx PATH $HOME/opt/go/bin $PATH
end

if command -v go > /dev/null 2>&1
	  
	if test ! -d $HOME/go-workspace
	  mkdir $HOME/go-workspace
	end

	set -gx GOPATH $HOME/go-workspace
	set -gx PATH $GOPATH/bin $PATH
	set -gx PATH $GOROOT/bin $PATH

end
