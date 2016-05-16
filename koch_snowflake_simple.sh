if [[ ($# -ne 2) || ("$1" -gt 5) || ("$1" -lt 0) || ("$2" -gt 250) || ("$2" -lt 0) ]]; then
	echo "Syntax koch_snowflake_simple.sh order size"
	echo "Order takes values from 0 to 5"
	echo "Size takes values from 0 to 250"
	exit
fi

echo Generating koch snowflake of order "$1" and size "$2"
python generate_koch_snowflake.py -o "$1" -s "$2" > koch_snowflake_simple.txt
python lines_to_svg.py koch_snowflake_simple.txt > koch_snowflake_simple_order-"$1"_size-"$2".svg
echo koch_snowflake_simple_order-"$1"_size-"$2".svg
echo Done



