import math

'''
Purpose
	Provide an exception class for Point and Line.
Exceptions
	None
Preconditions
	Message is a string.
'''
class Error(Exception):
	def __init__(self, message):
		self.message = message

'''
Purpose
	Store a point as an x, y pair.
	Provide functions to rotate, scale and translate the point.
Preconditions
	After instantiation, a Point object is modified only by
	rotate, scale and translate.
'''
class Point:
	'''
	Purpose
		Create a Point instance from x and y.
	Exceptions
		Raise Error if x or y are not of type float.
	Preconditions
		None
	'''
	def __init__(self, x, y):
		# check that parameters are legal
		if not isinstance(x, float):
			raise Error('Parameter "x" illegal.')
		if not isinstance(y, float):
			raise Error('Parameter "y" illegal.')

		# normal case
		self.x, self.y = x, y

	'''
	Purpose
		Rotate counterclockwise, by a radians, about the origin.
	Exceptions
		Raise Error if a is not of type float.
	Preconditions
		None
	'''
	def rotate(self, a):
		# check that parameter is legal
		if not isinstance(a, float):
			raise Error('Parameter "a" illegal.')

		# rotate
		self.x, self.y = \
			math.cos(a) * self.x - math.sin(a) * self.y, \
			math.sin(a) * self.x + math.cos(a) * self.y

	'''
	Purpose
		Scale point by factor f, about the origin.
	Exceptions
		Raise Error if f is not of type float.
	Preconditions
		None
	'''
	def scale(self, f):
		# check that parameter is legal
		if not isinstance(f, float):
			raise Error('Parameter "f" illegal.')

		# scale
		self.x, self.y = self.x * f, self.y * f

	'''
	Purpose
		Translate point by delta_x and delta_y.
	Exceptions
		Raise Error if delta_x, delta_y are not of type float.
	Preconditions
		None
	'''
	def translate(self, delta_x, delta_y):
		# check that parameters are legal
		if not isinstance(delta_x, float):
			raise Error('Parameter "delta_x" illegal.')
		if not isinstance(delta_y, float):
			raise Error('Parameter "delta_y" illegal.')

		# translate
		self.x += delta_x
		self.y += delta_y

	'''
	Purpose
		Round and convert to int in string form.
	Exceptions
		None
	Preconditions
		None
	'''
	def __str__(self):
		x, y  = int(round(self.x,0)), int(round(self.y,0))

		return str(x) + " " + str(y)

'''
Purpose
	Store a Line as a pair of Point instances.
	Provide functions to rotate, scale and translate the line.
Preconditions
	After instantiation, a Line object is modified only by
	rotate, scale and translate.
'''
class Line:
	'''
	Purpose
		Create a Line instance from point0 and point1.
	Exceptions
		None
	Preconditions
		None
	'''
	def __init__(self, point0, point1):
		# avoid shallow copy: create new Point instances
		self.point0 = Point(point0.x, point0.y)
		self.point1 = Point(point1.x, point1.y)

	'''
	Purpose
		Rotate counterclockwise, by a radians, about the origin.
	Exceptions
		Raise Error if a is not of type float.
		Raise Error if self.point0 or self.points1 is not legal.
	Preconditions
		None
	'''
	def rotate(self, a):
		# check that parameter is legal
		if not isinstance(a, float):
			raise Error('Parameter "a" illegal.')

		# rotate
		self.point0.rotate(a)
		self.point1.rotate(a)

	'''
	Purpose
		Scale point by factor f, about the origin.
	Exceptions
		Raise Error if f is not of type float.
	Preconditions
		None
	'''
	def scale(self, factor):
		# check that parameter is legal
		if not isinstance(factor, float):
			raise Error('Parameter "factor" illegal.')

		# scale
		self.point0.scale(factor)
		self.point1.scale(factor)

	'''
	Purpose
		Translate Line by delta_x and delta_y.
	Exceptions
		Raise Error if delta_x, delta_y are not of type float.
	Preconditions
		None
	'''
	def translate(self, delta_x, delta_y):
		# check that parameters are legal
		if not isinstance(delta_x, float):
			raise Error('Parameter "delta_x" illegal.')
		if not isinstance(delta_y, float):
			raise Error('Parameter "delta_y" illegal.')

		# translate
		self.point0.translate(delta_x, delta_y)
		self.point1.translate(delta_x, delta_y)

	'''
	Purpose
		Round and convert to int in string form.
	Exceptions
		None
	Preconditions
		None
	'''
	def __str__(self):
		return str(self.point0) + " " + str(self.point1)
