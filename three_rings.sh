#$# is the number of command line arguments, NOT including the script name
#$1: is the first argument, AFTER the script itself
if [ $# -ne 1 ]; then
	echo "Syntax python2 three_rings.sh number_of_sides"
	exit
fi

#polygon at origin as basis for all others
python2 generate_polygon.py 0.0 50.0 $1 > polygon.txt

#generate top polygon
python2 rotate_scale_translate.py -y 200.0  polygon.txt > polygon_top.txt

#generate middle polygon
python2 rotate_scale_translate.py -f 0.8  polygon.txt > polygon_middle0.txt
python2 rotate_scale_translate.py -y 110.0  polygon_middle0.txt > polygon_middle1.txt

#generate bottom polygon
python2 rotate_scale_translate.py -f 0.5  polygon.txt > polygon_bottom0.txt
python2 rotate_scale_translate.py -y 45.0  polygon_bottom0.txt > polygon_bottom1.txt

#combine 3 polygons and rotate
cat polygon_top.txt polygon_middle1.txt polygon_bottom1.txt > three_rings0.txt
python2 rotate_scale_translate.py -a 0.395 -n 16  three_rings0.txt > three_rings.txt

#generate SVG
python2 lines_to_svg.py three_rings.txt > three_rings.svg
