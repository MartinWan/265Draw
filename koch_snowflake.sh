echo	Koch Snowflake Generator
echo
echo	Koch Snowflake Order 0 - 5

echo
echo	Generating Koch Snowflake Order 0 
python generate_koch_snowflake.py -o 0 -s 250.0 > koch_snowflake0.txt 
python lines_to_svg.py koch_snowflake0.txt > koch_snowflake0.svg
echo	Koch Snowflake Order 0 complete

echo
echo	Generating Koch Snowflake Order 1 
python generate_koch_snowflake.py -o 1 -s 250.0 > koch_snowflake1.txt 
python lines_to_svg.py koch_snowflake1.txt > koch_snowflake1.svg
echo	Koch Snowflake Order 1 complete

echo
echo	Generating Koch Snowflake Order 2 
python generate_koch_snowflake.py -o 2 -s 250.0 > koch_snowflake2.txt 
python lines_to_svg.py koch_snowflake2.txt > koch_snowflake2.svg
echo	Koch Snowflake Order 2 complete

echo
echo	Generating Koch Snowflake Order 3 
python generate_koch_snowflake.py -o 3 -s 250.0 > koch_snowflake3.txt 
python lines_to_svg.py koch_snowflake3.txt > koch_snowflake3.svg
echo	Koch Snowflake Order 3 complete

echo
echo	Generating Koch Snowflake Order 4 
python generate_koch_snowflake.py -o 4 -s 250.0 > koch_snowflake4.txt 
python lines_to_svg.py koch_snowflake4.txt > koch_snowflake4.svg
echo	Koch Snowflake Order 4 complete

echo
echo	Generating Koch Snowflake Order 5 
python generate_koch_snowflake.py -o 5 -s 250.0 > koch_snowflake5.txt 
python lines_to_svg.py koch_snowflake5.txt > koch_snowflake5.svg
echo	Koch Snowflake Order 5 complete

echo
echo	Generating Koch Snowflake Tiling - Order 5 
python generate_koch_snowflake.py -o 5 -s 75.0 > koch_snowflake_medium.txt
python generate_koch_snowflake.py -o 5 -s 45.0 > koch_snowflake_small.txt 
cat koch_snowflake_medium.txt > koch_snowflake_tiling.txt
python rotate_scale_translate.py -x 0.0 -y 150.0 koch_snowflake_medium.txt >> koch_snowflake_tiling.txt
python rotate_scale_translate.py -x 0.0 -y -150.0 koch_snowflake_medium.txt >> koch_snowflake_tiling.txt
python rotate_scale_translate.py -a 1.570796 -x 88.125 -y 0.0 koch_snowflake_small.txt >> koch_snowflake_tiling.txt
python rotate_scale_translate.py -a 1.570796 -x -88.125 -y 0.0 koch_snowflake_small.txt >> koch_snowflake_tiling.txt
python rotate_scale_translate.py -a 1.570796 -x 44.0 -y 75.0 koch_snowflake_small.txt >> koch_snowflake_tiling.txt
python rotate_scale_translate.py -a 1.570796 -x -44.0 -y 75.0 koch_snowflake_small.txt >> koch_snowflake_tiling.txt
python rotate_scale_translate.py -a 1.570796 -x -44.0 -y -75.0 koch_snowflake_small.txt >> koch_snowflake_tiling.txt
python rotate_scale_translate.py -a 1.570796 -x 44.0 -y -75.0 koch_snowflake_small.txt >> koch_snowflake_tiling.txt
python lines_to_svg.py koch_snowflake_tiling.txt > koch_snowflake_tiling.svg
echo	Koch Snowflake Tiling - Order 5 complete

echo
echo	Generating Koch Snowflake Tiling 2 - Order 2 
python generate_koch_snowflake.py -o 2 -s 50.0 > koch_snowflake_small2.txt
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
python lines_to_svg.py koch_snowflake_tiling2.txt > koch_snowflake_tiling2.svg
echo	Koch Snowflake Tiling 2 - Order 2 complete

echo
echo	Generating Koch Snowflake Tiling 2 - Order 3 
python generate_koch_snowflake.py -o 3 -s 50.0 > koch_snowflake_small2_order3.txt
cat koch_snowflake_small2_order3.txt > koch_snowflake_tiling2_order3.txt
python rotate_scale_translate.py -x 0.0 -y 100.0 koch_snowflake_small2_order3.txt >> koch_snowflake_tiling2_order3.txt
python rotate_scale_translate.py -x 0.0 -y -100.0 koch_snowflake_small2_order3.txt >> koch_snowflake_tiling2_order3.txt
python rotate_scale_translate.py -x 0.0 -y -200.0 koch_snowflake_small2_order3.txt >> koch_snowflake_tiling2_order3.txt
python rotate_scale_translate.py -x 0.0 -y 200.0 koch_snowflake_small2_order3.txt >> koch_snowflake_tiling2_order3.txt
python rotate_scale_translate.py -x 85.0 -y 50.0 koch_snowflake_small2_order3.txt >> koch_snowflake_tiling2_order3.txt
python rotate_scale_translate.py -x -85.0 -y 50.0 koch_snowflake_small2_order3.txt >> koch_snowflake_tiling2_order3.txt
python rotate_scale_translate.py -x 85.0 -y -50.0 koch_snowflake_small2_order3.txt >> koch_snowflake_tiling2_order3.txt
python rotate_scale_translate.py -x -85.0 -y -50.0 koch_snowflake_small2_order3.txt >> koch_snowflake_tiling2_order3.txt
python rotate_scale_translate.py -x -85.0 -y -150.0 koch_snowflake_small2_order3.txt >> koch_snowflake_tiling2_order3.txt
python rotate_scale_translate.py -x -85.0 -y 150.0 koch_snowflake_small2_order3.txt >> koch_snowflake_tiling2_order3.txt
python rotate_scale_translate.py -x 85.0 -y -150.0 koch_snowflake_small2_order3.txt >> koch_snowflake_tiling2_order3.txt
python rotate_scale_translate.py -x 85.0 -y 150.0 koch_snowflake_small2_order3.txt >> koch_snowflake_tiling2_order3.txt
python rotate_scale_translate.py -x 170.0 -y 0.0 koch_snowflake_small2_order3.txt >> koch_snowflake_tiling2_order3.txt
python rotate_scale_translate.py -x -170.0 -y 0.0 koch_snowflake_small2_order3.txt >> koch_snowflake_tiling2_order3.txt
python rotate_scale_translate.py -x 170.0 -y 100.0 koch_snowflake_small2_order3.txt >> koch_snowflake_tiling2_order3.txt
python rotate_scale_translate.py -x -170.0 -y 100.0 koch_snowflake_small2_order3.txt >> koch_snowflake_tiling2_order3.txt
python rotate_scale_translate.py -x 170.0 -y -100.0 koch_snowflake_small2_order3.txt >> koch_snowflake_tiling2_order3.txt
python rotate_scale_translate.py -x -170.0 -y -100.0 koch_snowflake_small2_order3.txt >> koch_snowflake_tiling2_order3.txt
python lines_to_svg.py koch_snowflake_tiling2_order3.txt > koch_snowflake_tiling2_order3.svg
echo	Koch Snowflake Tiling 2 - Order 3 complete

echo
echo	Generating Koch Snowflake Tiling 3 - Order 2 
python generate_koch_snowflake.py -o 2 -s 50.0 > koch_snowflake_small3.txt
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
python lines_to_svg.py koch_snowflake_tiling3.txt > koch_snowflake_tiling3.svg
echo	Koch Snowflake Tiling 3 - Order 2 complete

echo
echo	Generating Koch Snowflake Tiling 3 - Order 3 
python generate_koch_snowflake.py -o 3 -s 50.0 > koch_snowflake_small3_order3.txt
cat koch_snowflake_small3_order3.txt > koch_snowflake_tiling3_order3.txt
python rotate_scale_translate.py -x 85.0 -y -16.5 koch_snowflake_small3_order3.txt >> koch_snowflake_tiling3_order3.txt
python rotate_scale_translate.py -x 28.0 -y -83.0 koch_snowflake_small3_order3.txt >> koch_snowflake_tiling3_order3.txt
python rotate_scale_translate.py -x 114.0 -y -99.5 koch_snowflake_small3_order3.txt >> koch_snowflake_tiling3_order3.txt
python rotate_scale_translate.py -x 57.0 -y -166.25 koch_snowflake_small3_order3.txt >> koch_snowflake_tiling3_order3.txt
python rotate_scale_translate.py -x -28.0 -y 83.0 koch_snowflake_small3_order3.txt >> koch_snowflake_tiling3_order3.txt
python rotate_scale_translate.py -x -85.0 -y 16.5 koch_snowflake_small3_order3.txt >> koch_snowflake_tiling3_order3.txt
python rotate_scale_translate.py -x -114.0 -y 99.5 koch_snowflake_small3_order3.txt >> koch_snowflake_tiling3_order3.txt
python rotate_scale_translate.py -x -57.0 -y 166.25 koch_snowflake_small3_order3.txt >> koch_snowflake_tiling3_order3.txt
python rotate_scale_translate.py -x 57.25 -y 66.5 koch_snowflake_small3_order3.txt >> koch_snowflake_tiling3_order3.txt
python rotate_scale_translate.py -x -57.25 -y -66.5 koch_snowflake_small3_order3.txt >> koch_snowflake_tiling3_order3.txt
python rotate_scale_translate.py -x -28.0 -y -150.0 koch_snowflake_small3_order3.txt >> koch_snowflake_tiling3_order3.txt
python rotate_scale_translate.py -x 28.0 -y 150.0 koch_snowflake_small3_order3.txt >> koch_snowflake_tiling3_order3.txt
python rotate_scale_translate.py -x -171.0 -y 33.0 koch_snowflake_small3_order3.txt >> koch_snowflake_tiling3_order3.txt
python rotate_scale_translate.py -x -142.0 -y -50.5 koch_snowflake_small3_order3.txt >> koch_snowflake_tiling3_order3.txt
python rotate_scale_translate.py -x -114.0 -y -134.0 koch_snowflake_small3_order3.txt >> koch_snowflake_tiling3_order3.txt
python lines_to_svg.py koch_snowflake_tiling3_order3.txt > koch_snowflake_tiling3_order3.svg
echo	Koch Snowflake Tiling 3 - Order 3 complete