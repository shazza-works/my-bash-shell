for a in {0..100}; do
	for b in {0..100}; do
		for c in {0..100}; do
                        echo -e "\e[${a};${b};${c}mCode=($a)($b)($c)\e[0;0;0m"
                done
        done
done

