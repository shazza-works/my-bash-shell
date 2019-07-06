echo $0
function gitalldown {
	for i in `ls`; do
		if [[ ! -f $i ]]; then
			cd $i
			echo "$pwd >>> WORKING..."
			echo -e "\e[1;31;42m$(git pull)\e[0;0;0m"
			cd - > /dev/null
		else
			echo -e "\e[1;33;44mLeft $i Alone !\e[0;0;0m"
		fi
	done
}
gitalldown
