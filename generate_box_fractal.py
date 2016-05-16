import sys
import math
import Line_Point
import re
# Square Class
class Square:
	def __init__(self, size, lines=None):
		self.size = size
		if lines is None:
			point0 = Line_Point.Point(-size, size)
			point1 = Line_Point.Point(-size, -size)
			point2 = Line_Point.Point(size, -size)
			point3 = Line_Point.Point(size, size)
			
			line0 = Line_Point.Line(point0, point1)
			line1 = Line_Point.Line(point1, point2)
			line2 = Line_Point.Line(point2, point3)
			line3 = Line_Point.Line(point3, point0)
		
			self.lines = [line0, line1, line2, line3]
		else:
			line0 = Line_Point.Line(lines[0].point0, lines[0].point1)
			line1 = Line_Point.Line(lines[1].point0, lines[1].point1)
			line2 = Line_Point.Line(lines[2].point0, lines[2].point1)
			line3 = Line_Point.Line(lines[3].point0, lines[3].point1)
			self.lines = [line0, line1, line2, line3]
			
	def scale(self, factor):
	
		delta_y = (self.lines[0].point0.y+self.lines[0].point1.y)/2
		delta_x = (self.lines[1].point0.x+self.lines[1].point1.x)/2
		
		self.translate(-delta_x, -delta_y)
		for line in self.lines:
			line.scale(factor)
		self.translate(delta_x, delta_y)
		self.size = self.size * factor
			
	def translate(self, delta_x, delta_y):
		for line in self.lines:
			line.translate(delta_x, delta_y)
# End Square Class

# Box Fractal Generator		
def box_fractal(order, size):
	squares = []
	square0 = Square(size)
	squares.append(square0)
	order = order - 1
	counter = 0
	
	while(order >= 0):
		counter = counter + 1
		new_squares = []
		for i in range(len(squares)):
			if counter == 1: 
				squares[i].scale(1.0/9.0)
			else:
				squares[i].scale(1.0/3.0)
			delta = 2*squares[i].size

			new_square0 = Square(squares[i].size, lines=squares[i].lines)
			new_square1 = Square(squares[i].size, lines=squares[i].lines)
			new_square2 = Square(squares[i].size, lines=squares[i].lines)
			new_square3 = Square(squares[i].size, lines=squares[i].lines)
			new_square0.translate(delta, delta)
			new_square1.translate(delta, -delta)
			new_square2.translate(-delta, -delta)
			new_square3.translate(-delta, delta)
			
			new_squares.append(squares[i])
			new_squares.append(new_square0)
			new_squares.append(new_square1)
			new_squares.append(new_square2)
			new_squares.append(new_square3)
		order = order - 1
		squares = new_squares
		
	for x in squares:
		for line in x.lines:
			print "line ", line
# End Box Fractal Generator

# Takes arguments: order (integer, order >= 0) and size (float, 0.0 <= size <= 750.0) in any order
# Syntax: python generate_box_fractal.py -o order -s size (or -s ... -o ...)
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
			
		if options[option] < 0.0 or options[option] > 750.0: 
			sys.exit('Illegal option value {} {}'.format(option, value))

		
box_fractal(options['-o'], options['-s'])
