echo ----- square.txt: 4 lines
python lines_to_svg.py square.txt > square.svg
diff square.svg square_gold.svg

echo ----- square_upper_left.txt: 2 lines
python lines_to_svg.py square_upper_left.txt > square_upper_left.svg
diff square_upper_left.svg square_upper_left_gold.svg

echo ----- square_left.txt: 1 line
python lines_to_svg.py square_left.txt > square_left.svg
diff square_left.svg square_left_gold.svg

echo ----- empty lines file: 0 lines
python lines_to_svg.py empty.txt > empty.svg
diff empty.svg empty_gold.svg

exit 0
