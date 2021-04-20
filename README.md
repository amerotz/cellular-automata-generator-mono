# cellular-automata-generator-mono
A generator of monodimensional cellular automata with an arbitrary number of states, visualized as pixel rows in a RGB image.

# How it works
Given a set of possible cell states, an array of cells is initialized with random states, serving as generation 0.
The next state of a particular cell is determined by looking at its neighbors and evaluating the obtained configuration via a set of randomly generated rules.
Each state is color coded and each generation is placed under its ancestor, ultimately forming an image.

# Some math
We define _neighbors_ of a cell **_i_** the cells numbered **_i-1_** and **_i+1_**.
