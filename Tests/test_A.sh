 echo -------------------- input from stdin

echo ----- -a default
python rotate_scale_translate.py -f 0.8 -n 2 -x 10.0 -y 10.0 \
	< square.txt > square_a.txt
diff square_a.txt square_a_gold.txt
./lines_to_svg square_a.txt > square_a.svg

echo ----- -f default
python rotate_scale_translate.py -a 0.39 -n 2 -x 10.0 -y 10.0 \
	< square.txt > square_f.txt
diff square_f.txt square_f_gold.txt
./lines_to_svg square_f.txt > square_f.svg

echo ----- -n default
python rotate_scale_translate.py -x 10.0 -a 0.39 -f 0.8 -y 10.0 \
 	< square.txt > square_n.txt
diff square_n.txt square_n_gold.txt
./lines_to_svg square_n.txt > square_n.svg
 
echo ----- -x default
python rotate_scale_translate.py -y 10.0 -a 0.39 -f 0.8 -n 2 \
 	< square.txt > square_x.txt
diff square_x.txt square_x_gold.txt
./lines_to_svg square_x.txt > square_x.svg

echo ----- -y default
python rotate_scale_translate.py -a 0.39 -n 2 -x 10.0 -f 0.8  \
 	< square.txt > square_y.txt
diff square_y.txt square_y_gold.txt
./lines_to_svg square_y.txt > square_y.svg

echo ----- no command-line parameters
python rotate_scale_translate.py  \
 	< square.txt > square_gold.txt
diff square.txt square_gold.txt
./lines_to_svg square.txt > square.svg

echo -------------------- input from named files

echo ----- -a default
python rotate_scale_translate.py -f 0.8 -n 2 -x 10.0 -y 10.0 \
	square.txt > square_a.txt
diff square_a.txt square_a_gold.txt
./lines_to_svg square_a.txt > square_a.svg

echo ----- empty file: should be unchanged
python rotate_scale_translate.py -f 0.8 -n 2 -x 10.0 -y 10.0 \
	empty.txt > empty_file.txt
diff empty_file.txt empty.txt

echo ----- one-line file
python rotate_scale_translate.py -f 0.8 -n 2 -x 10.0 -y 10.0 \
	square_upper_left.txt > square_upper_left_file.txt
diff square_upper_left_file.txt square_upper_left_file_gold.txt
./lines_to_svg square_upper_left_file.txt > square_upper_left_file.svg

echo ----- two files
python rotate_scale_translate.py -f 0.8 -n 2 -x 10.0 -y 10.0 \
	square_left.txt square_right.txt > square_left_right.txt
diff square_left_right.txt square_left_right_gold.txt
./lines_to_svg square_left_right.txt > square_left_right.svg
 
echo ----- spiral.svg
python generate_polygon.py 0.0 50.0 4 > spiral0.txt
python rotate_scale_translate.py -y 200.0  < spiral0.txt > spiral1.txt
python rotate_scale_translate.py -a 0.395 -f 0.9 -n 16 < spiral1.txt > spiral.txt
diff spiral.txt spiral_gold.txt
./lines_to_svg spiral.txt > spiral.svg

exit 0
