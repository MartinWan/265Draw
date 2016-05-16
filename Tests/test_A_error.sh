echo ----- illegal option -z
python rotate_scale_translate.py -z 1.0 > /dev/null

echo ----- duplicate option -a
python rotate_scale_translate.py -a 1.0 -f 2.0 -a 1.0 > /dev/null

echo ----- duplicate option -f
python rotate_scale_translate.py -f 1.0 -a 2.0 -f 1.0 > /dev/null

echo ----- duplicate option -n
python rotate_scale_translate.py -n 1 -a 2.0 -n 1 > /dev/null

echo ----- duplicate option -x
python rotate_scale_translate.py -x 1.0 -a 2.0 -x 1.0 > /dev/null

echo ----- duplicate option -y
python rotate_scale_translate.py -y 1.0 -a 2.0 -y 1.0 > /dev/null

echo ----- -a value illegal
python rotate_scale_translate.py -a x.1 -f 1.1 -n 1 -x 2.2 -y 3.3 > /dev/null

echo ----- -f value illegal
python rotate_scale_translate.py -a 0.0 -f 1.x -n 1 -x 2.2 -y 3.3 > /dev/null

echo ----- -n value illegal
python rotate_scale_translate.py -a 0.0 -f 1.1 -n 1x -x 2.2 -y 3.3 > /dev/null

echo ----- -x value illegal
python rotate_scale_translate.py -a 0.0 -f 1.1 -n 2 -x x -y 3.3 > /dev/null

echo ----- -y value illegal
python rotate_scale_translate.py -a 0.0 -f 1.1 -n 2 -x 2.2 -y y.3 > /dev/null
 
echo ----- file open error: xxx
python rotate_scale_translate.py -a 0.0 -f 1.1 -n 2 -x 2.2 -y 3.3 xxx > /dev/null

exit 0
