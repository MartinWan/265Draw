import sys
import math
import Line_Point
import re
'''
Generates Koch Snowflake.
Parameters: order (integer >= 0), size(0.0 <= float <= 250.0)

'''
def koch(order, size):
	lines = generate_triangle(size)
	order = order - 1
		
	while (order >= 0):
		new_lines = []
		for i in range(len(lines)):
			trisected = trisect(lines[i])
			line0 = Line_Point.Line(trisected[0], trisected[1])
			rotated = rotate_point(trisected[1], trisected[2])
			line1 = Line_Point.Line(trisected[1], rotated)
			line2 = Line_Point.Line(rotated, trisected[2])
			line3 = Line_Point.Line(trisected[2], trisected[3])
			new_lines = new_lines + [line0, line1, line2, line3] 
			
		order = order - 1
		lines = new_lines
		
	for x in lines:
		print "line ", x	
		
#Trisects line	
def trisect(line):
	trisected = []
	trisected.append(line.point0)
	
	xdiff = line.point1.x - line.point0.x
	ydiff = line.point1.y - line.point0.y
	
	pointA = Line_Point.Point(line.point0.x + xdiff/3, line.point0.y + ydiff/3)
	trisected.append(pointA)
	pointB = Line_Point.Point(line.point0.x + 2*xdiff/3, line.point0.y + 2*ydiff/3)
	trisected.append(pointB)
	trisected.append(line.point1)
	
	return trisected

def rotate_point(point0, point1):
	point_new = Line_Point.Point(point1.x - point0.x, point1.y - point0.y)
	point_new.rotate(-math.pi/3)
	return Line_Point.Point(point0.x + point_new.x, point0.y + point_new.y)
	
def generate_triangle(size):
		s = 3
		triangle = []
		central_angle = 2 * math.pi / s
		p0 = Line_Point.Point(0.0, size)
		
		while s > 0:
			p1 = Line_Point.Point(p0.x, p0.y)
			p1.rotate(central_angle)
			line = Line_Point.Line(p0, p1)
			triangle.append(line)
			p0 = p1
			s = s - 1
		
		return triangle
		


# Takes arguments: order (integer, order >= 0) and size (float, 0 <= size <= 250.0)
# Syntax: python generate_koch_snowflake.py -o order -s size (or -s ... -o ...)
# No duplicates accepted, must specify both args
# Amended version of arg processing from rotate_scale_translate.py

if len(sys.argv) != 5:
	sys.exit('Illegal number of arguments - see 265Draw User\'s Manual') 

if sys.argv.count('-o') == 0:
	sys.exit('Option \'-o\' must be specified')
elif sys.argv.count('-o') > 1:
	sys.exit('Duplicate option: -o')
	
if sys.argv.count('-s') == 0:
	sys.exit('Option \'-s\' must be specified')
elif sys.argv.count('-s') > 1:
	sys.exit('Duplicate option: -s')

options = {'-o': None, '-s': None}	

for i in range(1, len(sys.argv), 2):
	option = sys.argv[i]
	if option == '-o':
		value = sys.argv[i+1]
		try: 
			options['-o'] = int(value)
		except ValueError:
			sys.exit('Illegal option value {} {}'.format(option, value))
			
		if options[option] < 0: 
			sys.exit('Illegal option value {} {}'.format(option, value))
			
	elif option == '-s':
		value = sys.argv[i+1]
		try:
			options['-s'] = float(value)
		except ValueError:
			sys.exit('Illegal option value {} {}'.format(option, value))
			
		if options[option] < 0.0 or options[option] > 250.0: 
			sys.exit('Illegal option value {} {}'.format(option, value))

koch(options['-o'], options['-s'])