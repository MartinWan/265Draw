#Computational domain
x0, x1 = -2.0, 1.0
y0, y1 = -1.0, 1.0

def mandel(c, maxiter):
    z = complex(0,0) #Create the starting complex point (0+0i)
    
    for i in range(maxiter): #Iterate maxiter times
        z = (z*z) + c #Generates output value using (z^2) + c as function
        
        if abs(z) > 2: #Check the pythagorean magnitude of the output and break if we have diverged
            break
            pass
        
        pass
    return i

def generateAtlas(n=1000):
    #n is the size of the atlas rectangle
    
    #Can't import NumPy so generate linspace manually
    #Generates arrays of values evenly spread from x0-x1 and y0-y1
    dx, dy = (x1-x0)/(n-1), (y1-y0)/(n-1)
    xs = [x0 + i*dx for i in range(n)]
    ys = [y0 + i*dy for i in range(n)]

    #Get length of x and y values
    xlen = len(xs)
    ylen = len(ys)

    #Initialize atlas[xlen][ylen] to all 0's
    atlas = [[0 for i in range(xlen)] for j in range(ylen)]

    for ix in range(xlen):
        for iy in range(ylen):
            #Find real and imaginary parts of x by looking it up in lists
            cx = xs[ix]
            cy = ys[iy]
            c = complex(cx,cy)
            
            #How many iterations are needed to diverge for c at this place in the atlas
            atlas[ix][iy] = mandel(c,120)

            pass
        pass

    return atlas

atlas = generateAtlas()
print atlas
