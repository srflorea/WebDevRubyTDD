### Conway's Game Of Life

For reference:  
http://upload.wikimedia.org/wikipedia/commons/e/e5/Gospers_glider_gun.gif

The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, alive or dead. Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent to it. At each step in time, the following transitions occur:  
Any live cell with fewer than two live neighbours dies, as if caused by under-population.  
Any live cell with two or three live neighbours lives on to the next generation.  
Any live cell with more than three live neighbours dies, as if by overcrowding.  
Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

The initial pattern is the seed of the system. The first generation is created by applying the above rules simultaneously to every cell, and the births and deaths occur simultaneously. Each generation is a pure function of the preceding one. The rules continue to be applied repeatedly to create further generations.

