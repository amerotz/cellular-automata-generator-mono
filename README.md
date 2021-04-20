# cellular-automata-generator-mono
A generator of monodimensional cellular automata with an arbitrary number of states, visualized as pixel rows in a RGB image.
The automata generated have to 2, 3 or 4 states, as further increasing the number of states reduces the noticeability of patterns in the generations and makes the images generally less visually appealing.

# How it works
Given a set of possible cell states, an array of cells is initialized with random states, serving as generation 0.
The next state of a particular cell is determined by looking at its neighbors and evaluating the obtained configuration via a set of randomly generated rules.
Each state is color coded and each generation is placed under its ancestor, ultimately forming an image.

Press ENTER to generate a new automaton.

# Some math
We define **_neighbors_** of a cell _i_ the cells numbered _i-1_ and _i+1_ (edge cases are not considered for simplicity). Given _n_ possible cell states, we have to generate a set of rules for each possible configuration of three cells in a row, thus obtaining _n_^3 total cases.
These cases can be numbered and stored in an array, so that the next cell state for a cell in configuration _m_ is equal to `rules[m]`.
Each configuration can lead to one of the possible cell states: thus, the total number of cellular automata we can generate is equal to (_configuration number_)^n.
The algorithm randomly initializes the rules array, effectively picking one of the cellular automata at random.

# Some images

Color coding is randomly generated. The automata often produce nice patterns, as the ones shown below:

![](/images/cell1)

![](/images/cell2)

![](/images/cell3)
