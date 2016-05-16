if [[ ($# -ne 2) || ("$1" -gt 3) || ("$1" -lt 1) || ("$2" -gt 5) || ("$2" -lt 0) ]]; then
	echo "Syntax koch_snowflake_tiling.sh tiling order"
	echo "Tiling takes values from 1 to 3"
	echo "Order takes values from 0 to 5"
	exit
fi

if [[($1 == 1)]]; then
	echo	Generating Koch Snowflake Tiling - Order "$2"
	python generate_koch_snowflake.py -o "$2" -s 75.0 > koch_snowflake_medium.txt
	python generate_koch_snowflake.py -o "$2" -s 45.0 > koch_snowflake_small.txt
	cat koch_snowflake_medium.txt > koch_snowflake_tiling.txt
	python rotate_scale_translate.py -x 0.0 -y 150.0 koch_snowflake_medium.txt >> koch_snowflake_tiling.txt
	python rotate_scale_translate.py -x 0.0 -y -150.0 koch_snowflake_medium.txt >> koch_snowflake_tiling.txt
	python rotate_scale_translate.py -a 1.570796 -x 88.125 -y 0.0 koch_snowflake_small.txt >> koch_snowflake_tiling.txt
	python rotate_scale_translate.py -a 1.570796 -x -88.125 -y 0.0 koch_snowflake_small.txt >> koch_snowflake_tiling.txt
	python rotate_scale_translate.py -a 1.570796 -x 44.0 -y 75.0 koch_snowflake_small.txt >> koch_snowflake_tiling.txt
	python rotate_scale_translate.py -a 1.570796 -x -44.0 -y 75.0 koch_snowflake_small.txt >> koch_snowflake_tiling.txt
	python rotate_scale_translate.py -a 1.570796 -x -44.0 -y -75.0 koch_snowflake_small.txt >> koch_snowflake_tiling.txt
	python rotate_scale_translate.py -a 1.570796 -x 44.0 -y -75.0 koch_snowflake_small.txt >> koch_snowflake_tiling.txt
	python lines_to_svg.py koch_snowflake_tiling.txt > koch_snowflake_tiling_"$1"_order-"$2".svg
	echo	koch_snowflake_tiling_"$1"_order-"$2".svg 
	echo	Koch Snowflake Tiling - Order "$2" complete
elif [[($1 == 2)]]; then
	echo	Generating Koch Snowflake Tiling 2 - Order "$2"
	python generate_koch_snowflake.py -o "$2" -s 50.0 > koch_snowflake_small2.txt
	cat koch_snowflake_small2.txt > koch_snowflake_tiling2.txt
	python rotate_scale_translate.py -x 0.0 -y 100.0 koch_snowflake_small2.txt >> koch_snowflake_tiling2.txt
	python rotate_scale_translate.py -x 0.0 -y -100.0 koch_snowflake_small2.txt >> koch_snowflake_tiling2.txt
	python rotate_scale_translate.py -x 0.0 -y -200.0 koch_snowflake_small2.txt >> koch_snowflake_tiling2.txt
	python rotate_scale_translate.py -x 0.0 -y 200.0 koch_snowflake_small2.txt >> koch_snowflake_tiling2.txt
	python rotate_scale_translate.py -x 85.0 -y 50.0 koch_snowflake_small2.txt >> koch_snowflake_tiling2.txt
	python rotate_scale_translate.py -x -85.0 -y 50.0 koch_snowflake_small2.txt >> koch_snowflake_tiling2.txt
	python rotate_scale_translate.py -x 85.0 -y -50.0 koch_snowflake_small2.txt >> koch_snowflake_tiling2.txt
	python rotate_scale_translate.py -x -85.0 -y -50.0 koch_snowflake_small2.txt >> koch_snowflake_tiling2.txt
	python rotate_scale_translate.py -x -85.0 -y -150.0 koch_snowflake_small2.txt >> koch_snowflake_tiling2.txt
	python rotate_scale_translate.py -x -85.0 -y 150.0 koch_snowflake_small2.txt >> koch_snowflake_tiling2.txt
	python rotate_scale_translate.py -x 85.0 -y -150.0 koch_snowflake_small2.txt >> koch_snowflake_tiling2.txt
	python rotate_scale_translate.py -x 85.0 -y 150.0 koch_snowflake_small2.txt >> koch_snowflake_tiling2.txt
	python rotate_scale_translate.py -x 170.0 -y 0.0 koch_snowflake_small2.txt >> koch_snowflake_tiling2.txt
	python rotate_scale_translate.py -x -170.0 -y 0.0 koch_snowflake_small2.txt >> koch_snowflake_tiling2.txt
	python rotate_scale_translate.py -x 170.0 -y 100.0 koch_snowflake_small2.txt >> koch_snowflake_tiling2.txt
	python rotate_scale_translate.py -x -170.0 -y 100.0 koch_snowflake_small2.txt >> koch_snowflake_tiling2.txt
	python rotate_scale_translate.py -x 170.0 -y -100.0 koch_snowflake_small2.txt >> koch_snowflake_tiling2.txt
	python rotate_scale_translate.py -x -170.0 -y -100.0 koch_snowflake_small2.txt >> koch_snowflake_tiling2.txt
	python lines_to_svg.py koch_snowflake_tiling2.txt > koch_snowflake_tiling_"$1"_order-"$2".svg
	echo 	koch_snowflake_tiling_"$1"_order-"$2".svg
	echo	Koch Snowflake Tiling 2 - Order "$2" complete
elif [[($1 == 3)]]; then
	echo	Generating Koch Snowflake Tiling 3 - Order "$2"
	python generate_koch_snowflake.py -o "$2" -s 50.0 > koch_snowflake_small3.txt
	cat koch_snowflake_small3.txt > koch_snowflake_tiling3.txt
	python rotate_scale_translate.py -x 85.0 -y -16.5 koch_snowflake_small3.txt >> koch_snowflake_tiling3.txt
	python rotate_scale_translate.py -x 28.0 -y -83.0 koch_snowflake_small3.txt >> koch_snowflake_tiling3.txt
	python rotate_scale_translate.py -x 114.0 -y -99.5 koch_snowflake_small3.txt >> koch_snowflake_tiling3.txt
	python rotate_scale_translate.py -x 57.0 -y -166.25 koch_snowflake_small3.txt >> koch_snowflake_tiling3.txt
	python rotate_scale_translate.py -x -28.0 -y 83.0 koch_snowflake_small3.txt >> koch_snowflake_tiling3.txt
	python rotate_scale_translate.py -x -85.0 -y 16.5 koch_snowflake_small3.txt >> koch_snowflake_tiling3.txt
	python rotate_scale_translate.py -x -114.0 -y 99.5 koch_snowflake_small3.txt >> koch_snowflake_tiling3.txt
	python rotate_scale_translate.py -x -57.0 -y 166.25 koch_snowflake_small3.txt >> koch_snowflake_tiling3.txt
	python rotate_scale_translate.py -x 57.25 -y 66.5 koch_snowflake_small3.txt >> koch_snowflake_tiling3.txt
	python rotate_scale_translate.py -x -57.25 -y -66.5 koch_snowflake_small3.txt >> koch_snowflake_tiling3.txt
	python rotate_scale_translate.py -x -28.0 -y -150.0 koch_snowflake_small3.txt >> koch_snowflake_tiling3.txt
	python rotate_scale_translate.py -x 28.0 -y 150.0 koch_snowflake_small3.txt >> koch_snowflake_tiling3.txt
	python rotate_scale_translate.py -x -171.0 -y 33.0 koch_snowflake_small3.txt >> koch_snowflake_tiling3.txt
	python rotate_scale_translate.py -x -142.0 -y -50.5 koch_snowflake_small3.txt >> koch_snowflake_tiling3.txt
	python rotate_scale_translate.py -x -114.0 -y -134.0 koch_snowflake_small3.txt >> koch_snowflake_tiling3.txt
	python lines_to_svg.py koch_snowflake_tiling3.txt > koch_snowflake_tiling_"$1"_order-"$2".svg
	echo 	koch_snowflake_tiling_"$1"_order-"$2".svg
	echo	Koch Snowflake Tiling 3 - Order "$2" complete
fi
