function gitalldown() {
	for i in `ls`; do
		if [[ ! $i == $PWD ]]; then
			cd $i
			git pull
			cd - > /dev/null
		else
			echo "Left $i Alone !"
		fi
	done
}

gitalldown()
