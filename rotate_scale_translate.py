import sys
import Line_Point

''' 
purpose
	for each input line L
	repeat count times
		rotate L counter clockwise about the origin by angle
		scale L about the origin by factor
		translate L horizontally by delta_x
		translate L vertically by delta_y
		print L to stdout
preconditions
	input are legal lines format
'''

option_dict = {'-a': 0.0, '-f': 1.0, '-n': 1, '-x': 0.0, '-y': 0.0}
input_files = []

# check for duplicate command line options
if sys.argv.count('-a') > 1:
	sys.exit('Duplicate option: -a')

if sys.argv.count('-f') > 1:
	sys.exit('Duplicate option: -f')

if sys.argv.count('-n') > 1:
	sys.exit('Duplicate option: -n')

if sys.argv.count('-x') > 1:
	sys.exit('Duplicate option: -x')

if sys.argv.count('-y') > 1: 
	sys.exit('Duplicate option: -y')

# process command line options
arg_count = len(sys.argv)
for i in range(1, arg_count, 2): # every odd element of argv contains '-option' tags
	option = sys.argv[i]
	
	if option in option_dict and option != '-n': # option with float argument
		value = sys.argv[i + 1]
		try:
			option_dict[option] = float(value) 
		except ValueError:
			sys.exit('Illegal option value: {} {}'.format(option, value))
	
	elif option == '-n': # option with int argument
		value = sys.argv[i + 1]
		try:
			option_dict[option] = int(value)
		except ValueError: 
			sys.exit('Illegal option value: {} {}'.format(option, value))

	elif option[0] == '-': # not in option_dict so must be illegal option
		sys.exit('Illegal option: {}'.format(option))
	
	else: # must be at file arguments
		for j in range(i, arg_count):
			filepath = sys.argv[j]
			try:
				file = open(filepath)
				input_files.append(file)
			except IOError:
				sys.exit('Cannot open file: {}'.format(filepath))
		break



if input_files: # there are input_files
	
	# rotate, scale and translate from input_files 
	for file in input_files: 
		for line in file:
			# convert L to a Line object
			L = line.split()
			point0 = Line_Point.Point(float(L[1]), float(L[2]))
			point1 = Line_Point.Point(float(L[3]), float(L[4]))
			line = Line_Point.Line(point0, point1)

			# get options from option_dict
			count = option_dict['-n']
			angle = option_dict['-a']
			factor = option_dict['-f']
			delta_x = option_dict['-x']
			delta_y = option_dict['-y']

			# rotate, scale, translate and write line count times
			for i in range(count):
				line.rotate(angle)
				line.scale(factor)
				line.translate(delta_x, delta_y)
				print 'line', line

else: # no input files so use stdin
	
	# rotate, scale and translate from stdin
	for line in sys.stdin:
		# convert L to a Line object
		L = line.split()
		point0 = Line_Point.Point(float(L[1]), float(L[2]))
		point1 = Line_Point.Point(float(L[3]), float(L[4]))
		line = Line_Point.Line(point0, point1)

		# get options from option_dict
		count = option_dict['-n']
		angle = option_dict['-a']
		factor = option_dict['-f']
		delta_x = option_dict['-x']
		delta_y = option_dict['-y']

		# rotate, scale, translate and write line count times
		for i in range(count):
			line.rotate(angle)
			line.scale(factor)
			line.translate(delta_x, delta_y)
			print 'line', line
			