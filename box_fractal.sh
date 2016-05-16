if [[ ($# -ne 2) || ("$1" -gt 8) || ("$1" -lt 0) || ("$2" -gt 750) || ("$2" -lt 0) ]]; then
	echo "Syntax box_fractal.sh order size"
	echo "Order takes values from 0 to 8"
	echo "Size takes values from 0 to 750"
	exit
fi

echo Generating box fractal of order "$1" and size "$2"
python generate_box_fractal.py -o "$1" -s "$2" > box_fractal.txt
python lines_to_svg.py box_fractal.txt > box_fractal_order-"$1"_size-"$2".svg
echo box_fractal_order-"$1"_size-"$2".svg
echo Done
