# 265Draw 

Final group project for SENG 265 - Software Development Methods

Excellent Team members:
* Martin Wan
* Ethan Dinnen
* Rai Goyal 
* Andrea Nesdoly 

A simple framework for creating fractal graphics in SVG through the command line. 
Implemented in Python. Recieved perfect final grade.

## Screenshots 

![Screenshots](/MANUAL/BoxFractal.png)

![Screenshots](/MANUAL/KochSnowflakeSimple.png)

![Screenshots](/MANUAL/KochSnowflakeTiling.png)

![Screenshots](/MANUAL/ThreeRings.png)

##265Draw Framework Contents
The 265Draw Framework consists of three generators:
* generate koch snowflake.py 
* generate box fractal.py
* generate polygon.py

One filter:
* rotate scale translate.py Four bash scripts:
* koch snowflake simple.sh • koch snowflake tiling.sh • box fractal.sh
* three rings.sh

##Fractal Generation with Bash
###Koch Snowflake
####Simple
To generate a simple Koch snowflake two arguments are required: the order (ranging from 0 to 5) and the size (ranging from 0 to 250). The syntax for running the generation script is as follows:

    bash koch snowflake simple.sh order size

The size value specifies how much of the canvas is used by the fractal drawing. The order value determines how many iterations are completed and thereby determines how many triangles are recursively added to each side. Assuming the order value is represented with the variable n, the number of sides of the snowflake is given by:
    
    Sn = Sn−1 ·4 = 3·4^n

###Tiling    
To generate a tiled Koch snowflate two arguments are required: the tiling (ranging from 1 to 3) and the
order (ranging from 0 to 5). The syntax for running the generation script is as follows:

    bash koch snowflake tiling.sh tiling order

The tiling value changes the type of tiling applied to the snowflake where the values 1-3 are different tiling styles. The order and number of sides are defined the same as the simple snowflake.

##Box Fractal
To generate a box fractal two arguments are required: the order (ranging from 0 to 8) and the size (ranging from 1 to 750). The syntax for running the generation script is as follows:

    bash box fractal.sh order size

The size value specifies how much of the canvas is used by the fractal drawing. The order value determines how many iterations are completed and thereby determines how many groups of five boxes are drawn. Assuming the order value is represented with the variable n, the number of boxes is given by:
    
    Bn = 5n

##Three Rings
To generate a three ring fractal one argument is required: the number of sides (n) (ranging from 2 to ∞). This script results in three rings of increasing size centered around the origin with each ring consisting of 16 polygons with n sides each rotated around the origin. The syntax for running the generation script is as follows:

    bash three rings.sh number of sides

For more information:
* [265Draw User Manual](/MANUAL/265DrawUserManual.pdf)
* [Fractal's and Mathematics](https://en.wikipedia.org/wiki/Fractal)



