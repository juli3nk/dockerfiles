if ping -W 1 -c 1 github.com > /dev/null 2>&1 ; then
	ORIGIN_DIR=$PWD

	cd $HOME/Dotfiles || exit
	if [ $PWD == "${HOME}/Dotfiles" ]; then
		git pull -q origin master
	fi

	${HOME}/bin/dotfiles -profile container -sync -force

	cd $ORIGIN_DIR
fi
