#SENG 265 Assingment 03
#For group: UNIQUE 

import sys
import re

## SVG header with placeholders for canvas width and height
SVG_HEADER = '<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width="{WIDTH}" height="{HEIGHT}">\n'


## SVG bounding box with placeholders for width and height
SVG_BOUNDING_BOX = '<rect x=\"0\" y=\"0\" width="{WIDTH}" height="{HEIGHT}" style=\"stroke:#000;fill:none\" />\n'

## SVG line with placeholders for x0, y0, x1, y1
SVG_LINE = '<line x1="{X1}" y1="{Y1}" x2="{X2}" y2="{Y2}" style=\"stroke:#000\" />\n'

## SVG footer
SVG_FOOTER = "</svg>"

CANVAS_HEIGHT = 500
CANVAS_WIDTH = 500

# Main
# Process Command Line argument
arg_count = len(sys.argv)
if arg_count != 2:
	print >> sys.exit("Usage: "+sys.argv[0]+" lines_file")
# Open desired line file
try:
	lines_file = open(sys.argv[1])
except IOError:
	sys.exit('Cannot open file: {}'.format(filepath))

## Generate Header, Bounding Box
print SVG_HEADER.format(WIDTH = CANVAS_WIDTH, HEIGHT = CANVAS_HEIGHT),
print SVG_BOUNDING_BOX.format(WIDTH = CANVAS_WIDTH, HEIGHT = CANVAS_HEIGHT),

## Process lines by parsing input lines with compile, match, end, and group
##re to compile
integer = '([-+]?\d+\s+)'
line_compile = re.compile('(?:\s*line\s+|'+integer+')')
check = re.compile('\d+')

##move through file line by line
line_number = 0

for line in lines_file:
	##check for 'line' assign end index to offset to handle errors
	offset = 0
	line_number = line_number + 1
	tokens = line.split()
	
	line_result = line_compile.match(line) 
	
	if line_result:
	##if 'line' is correct move through the ints and place in list
		count = 1
		variable_list = []
		offset = line_result.end()
		
		while line_result:
			##process ints x and y and insert into list to be converted
			variable_list.append([line_result.group(), offset])
			line_result = line_compile.match(line,offset) 
			
			if line_result == None or count == 5:
				break
			
			offset = line_result.end()
			count = count + 1
		
		#Handle all illegal integers given and place carrot in correct position
		if len(variable_list)!= 5 or len(tokens)!= 5:
			# case 1: checks exactly where the error occurs in the illegal token no match means the error occurs at the beginning
			check_result = check.match(line, offset)
			if check_result == None:
				print >> sys.stderr, "Error in line {}:".format(line_number)
				line = line.strip('\r\n')
				print >> sys.stderr, ' '*3 + line
				print >> sys.stderr, ' '*3 +' '*offset+"^" 
			# the error occurs after the first character in the token
			else:
				offset = check_result.end()
				# case 2: find any new line characters or extra spaces after the illegal token
				extra = re.compile('(?:\n+|\r+|\s+)')
				extra_result = extra.match(line, offset)
				# the error has extra characters at the end so we must take thos into account when placing the carrot below the error
				if extra_result:
					offset2 = (extra_result.end()) - offset
					print >> sys.stderr, "Error in line {}:".format(line_number)
					line = line.strip('\r\n')
					print >> sys.stderr, ' '*3 + line
					print >> sys.stderr, ' '*3 +' '*(offset - offset2)+"^"
				# there is no extra characters after the error so place the carrot below the error
				else:
					print >> sys.stderr, "Error in line {}:".format(line_number)
					line = line.strip('\r\n')
					print >> sys.stderr, ' '*3 + line
					print >> sys.stderr, ' '*3 +' '*offset+"^"
		else:
			##convert to svg coordinates
			#First point
			x0 = int(variable_list[1][0])
			x0 = x0 + CANVAS_WIDTH/2
				
			y0 = int(variable_list[2][0])
			y0 = -y0 + CANVAS_HEIGHT/2
			
			#Second point
			x1 = int(variable_list[3][0])
			x1 = x1 + CANVAS_WIDTH/2
		
			y1 = int(variable_list[4][0])
			y1 = -y1 + CANVAS_HEIGHT/2
	
			#Handle any errors, where the point given does not fall on the canvas
			if x0<0 or x0>CANVAS_WIDTH:
				print >> sys.stderr, "Error in line {}:".format(line_number)
				line = line.strip('\r\n')
				print >> sys.stderr, ' '*3 + line
				print >> sys.stderr, ' '*3 + ' '*int(variable_list[0][1])+"^"			
			elif y0<0 or y0>CANVAS_HEIGHT:
				print >> sys.stderr, "Error in line {}:".format(line_number)
				line = line.strip('\r\n')
				print >> sys.stderr, ' '*3 + line
				print >> sys.stderr, ' '*3 + ' '*int(variable_list[1][1])+"^"
			elif x1<0 or x1>CANVAS_WIDTH:
				print >> sys.stderr, "Error in line {}:".format(line_number)
				line = line.strip('\r\n')
				print >> sys.stderr,' '*3 + line
				print >> sys.stderr, ' '*3 + ' '*int(variable_list[2][1])+"^"
			elif y1<0 or y1>CANVAS_HEIGHT:
				print >> sys.stderr, "Error in line {}:".format(line_number)
				line = line.strip('\r\n')
				print >> sys.stderr, ' '*3 + line
				print >> sys.stderr, ' '*3 +' '*int(variable_list[3][1])+"^"
			else:
			#print legal line
				print SVG_LINE.format(X1 = x0, Y1 = y0, X2 = x1, Y2 = y1),
	# first token 'line' is illegal
	else:
		print >> sys.stderr, "Error in line {}:".format(line_number)
		line = line.strip('\r\n')
		print >> sys.stderr, ' '*3+ line
		print >> sys.stderr, ' '*3+'^'
print SVG_FOOTER,